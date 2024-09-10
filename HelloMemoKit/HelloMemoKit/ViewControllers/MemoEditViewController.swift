//
//  EditMemoViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

class MemoEditViewController: BaseStackViewController, UIPickerViewDataSource,  UIPickerViewDelegate {
    
    var memo: Memo?
    
    var selectedColor: UIColor = MemoColor.allCases.first?.uiColor ?? .clear
    
    // save 버튼이 눌리면 처리할 일을 클로저로 정해줄수 있게 합시다
    var saveAction: (Memo?, String, MemoEmoji, UIColor) -> Void = { (_, _, _, _) in
        // 아직 할 일을 정하기 전
    }
    
    private lazy var memoTextView: UITextView = {
        let textView = UITextView()
        textView.font = .preferredFont(forTextStyle: .largeTitle)
        textView.isEditable = true
        return textView
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .memoThemeColor
        button.addAction(UIAction { _ in
            // 화면 내리자!
            self.dismiss(animated: true)
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.backgroundColor = .memoThemeColor
        
        button.addAction(UIAction { _ in
            
            guard !self.memoTextView.text.isEmpty else {
                print("empty!")
                return
            }
            
            let emojiIndex: Int = self.emojiSegmentedControl.selectedSegmentIndex
            let emoji = MemoEmoji.allCases[emojiIndex]
            
            // 외부에서 지정한 저장 액션 클로저를 실행하자!
            self.saveAction(self.memo, self.memoTextView.text, emoji, self.selectedColor)
            
            // 화면 내리자!
            self.dismiss(animated: true)
                
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var emojiSegmentedControl: UISegmentedControl = {
        
        var items: [String] = []
        
        for emoji in MemoEmoji.allCases {
            items.append(emoji.rawValue)
        }
        
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        
        return segmentedControl
    }()
    
    private lazy var colorPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        return pickerView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let memo {
            memoTextView.text = memo.text
            
            let emojiIndex: Int = MemoEmoji.getIndex(from: memo.emoji)
            emojiSegmentedControl.selectedSegmentIndex = emojiIndex
            
            let colorIndex: Int = MemoColor.indexForColor(color: memo.color)
            colorPickerView.selectRow(colorIndex, inComponent: 0, animated: false)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 처음 화면 보여주자마자
        // 텍스트 편집창에 포커스를 주면
        // 키보드가 올라올 것이다
        memoTextView.becomeFirstResponder()
    }
    
    override func setupInterface() {
        super.setupInterface()
        
        let actionStackView = UIStackView()
        actionStackView.axis = .horizontal
        actionStackView.spacing = 10
        actionStackView.distribution = .equalSpacing
        stackView.addArrangedSubview(actionStackView)
    
        actionStackView.addArrangedSubview(cancelButton)
        actionStackView.addArrangedSubview(saveButton)
        
        stackView.addArrangedSubview(memoTextView)
        stackView.addArrangedSubview(emojiSegmentedControl)
        stackView.addArrangedSubview(colorPickerView)
    }
    /*
    override func setupLayout() {
        super.setupLayout()
    }
     */
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(component)
        return MemoColor.allCases.count
    }
    
    /*
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        MemoColor.allCases[row].rawValue
    }
    */
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let title: String = MemoColor.allCases[row].rawValue
        let color: UIColor = MemoColor.allCases[row].uiColor
        let attributes = [NSAttributedString.Key.foregroundColor: color]
        
        return NSAttributedString(string: title, attributes: attributes)
    }
    
    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("selected \(MemoColor.allCases[row].rawValue)")
        selectedColor = MemoColor.allCases[row].uiColor
        
        memoTextView.layer.borderWidth = 1
        memoTextView.layer.borderColor = selectedColor.cgColor
    }
    
}

#Preview {
    MemoEditViewController()
}
