//
//  MemoDetailViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

class MemoDetailViewController: BaseStackViewController {
    
    var memo: Memo? = Memo(text: "Hello World", createdAt: Date())

    private lazy var memoCreatedAtLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    
    private lazy var memoEmojiLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var memoColorView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    private lazy var memoTextView: UITextView = {
        let textView = UITextView()
        textView.font = .preferredFont(forTextStyle: .largeTitle)
        textView.isEditable = false
        return textView
    }()
    /*
    private lazy var memoTextLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 15
        return label
    }()
    */
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.backgroundColor = .memoAlertColor
        button.addAction(UIAction { _ in
            print("delete")
            
            let alert = UIAlertController(title: "Do you want delete this memo?",
                                          message: "After deleting, it can't back.",
                                          preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Remove",
                                             style: .destructive,
                                             handler: { _ in
                                                print("Remove")
                
                                                if let memo = self.memo {
                                                    MemoStore.shared.removeMemo(memo)
                                                    self.navigationController?.popViewController(animated: true)
                                                }
                                            })
            
            let cancelAction = UIAlertAction(title: "Cancel",
                                             style: .cancel,
                                             handler: { _ in
                                                print("cancel")
                                            })
            
            alert.addAction(deleteAction)
            alert.addAction(cancelAction)
            
            self.present(alert, animated: true, completion: nil)
            
            
            
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.backgroundColor = .memoThemeColor
        button.addAction(UIAction { _ in
            
            let viewController = MemoEditViewController()
            
            if let memo = self.memo {
                viewController.memo = memo
            }
            
            viewController.modalPresentationStyle = .pageSheet
            
            viewController.saveAction = { (memo, text, emoji, color) in
                
                if var memo = self.memo {
                    memo.text = text
                    memo.emoji = emoji
                    memo.color = color
                    MemoStore.shared.updateMemo(memo)
                    
                    self.displayMemo()
                }
            }
            
            self.present(viewController, animated: true) {
                print("present!!!!!")
            }
            
        }, for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Memo Detail"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        displayMemo()
    }


    override func setupInterface() {
        super.setupInterface()
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(memoCreatedAtLabel)
        stackView.addArrangedSubview(memoEmojiLabel)
        stackView.addArrangedSubview(memoColorView)
        stackView.addArrangedSubview(memoTextView)
        
        let actionStackView = UIStackView()
        actionStackView.axis = .horizontal
        actionStackView.spacing = 10
        actionStackView.distribution = .fillEqually
        stackView.addArrangedSubview(actionStackView)
        
        actionStackView.addArrangedSubview(deleteButton)
        actionStackView.addArrangedSubview(editButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            memoColorView.heightAnchor.constraint(equalToConstant: 2.0)
        ])
    }
    
    func displayMemo() {
        // 항상 화면에 보이는 메모는
        // 최신의 메모 내용이 되도록 한다
        // (편집 후 업데이트 대응)
        if let memo {
            self.memo = MemoStore.shared.memoForId(memo.id)
        }
        
        memoTextView.text = memo?.text ?? ""
        memoEmojiLabel.text = memo?.emoji.rawValue
        memoCreatedAtLabel.text = memo?.createdAtString ?? ""
        memoColorView.backgroundColor = memo?.color ?? .clear
    }
}

#Preview {
    MemoDetailViewController()
}
