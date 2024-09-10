//
//  MemoListViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

class MemoListViewController: BaseStackViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let memoStore: MemoStore = MemoStore.shared
    
    private lazy var queryTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "검색어를 입력하세요"
        textField.borderStyle = .roundedRect
        // textField.keyboardType = .numberPad
        textField.tintColor = .gray
        
        textField.addAction(UIAction { _ in
            print("editingChanged : \(textField.text ?? "(none)")")
            self.memoStore.queryString = textField.text ?? ""
            self.memoTableView.reloadData()
        }, for: .editingChanged)
        
        let image = UIImage(systemName: "magnifyingglass")
        textField.leftView = UIImageView(image: image)
        textField.leftViewMode = .always
        
        let clearButton = UIButton()
        clearButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        clearButton.addAction(UIAction { _ in
            textField.text = ""
            self.memoStore.queryString = textField.text ?? ""
            self.memoTableView.reloadData()
        }, for: .touchUpInside)
        
        textField.rightView = clearButton
        textField.rightViewMode = .whileEditing
        
        return textField
    }()
    
    private lazy var memoTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.dataSource = self
        tableView.delegate = self
        
        // 메모리의 효율적 관리를 위해
        // TableView가 사용할 Cell의 재활용 선언
        tableView.register(MemoCell.self, forCellReuseIdentifier: "MemoCell")
        
        // 밀어서 삭제 활성화
        tableView.isEditing = false
        
        // 구분선 없애기
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add a memo", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.backgroundColor = .memoThemeColor
        
        button.addAction(UIAction { _ in
            
            let viewController = MemoEditViewController()
            viewController.modalPresentationStyle = .pageSheet
            
            // 편집이 다 끝나고 저장을 누르면 할 일을 여기서 정해주자
            viewController.saveAction = { (_, text, emoji, color) in
                print("save!!!! : \(text)")
                
                self.memoStore.addMemo(text, emoji: emoji, color: color)
                self.memoTableView.reloadData()
            }
            
            self.present(viewController, animated: true)
            
        }, for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Memo"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memoTableView.reloadData()
    }

    override func setupInterface() {
        super.setupInterface()
        
        stackView.addArrangedSubview(queryTextField)
        stackView.addArrangedSubview(memoTableView)
        stackView.addArrangedSubview(addButton)
    }
    
    /*
    override func setupLayout() {
        super.setupLayout()
    }
    */
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoStore.memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MemoCell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as! MemoCell
        
        let memo: Memo = memoStore.memoList[indexPath.row]
        
        cell.memoTextLabel.text = memo.text
        cell.emojiLabel.text = memo.emoji.rawValue
        cell.emojiLabel.backgroundColor = memo.color
        cell.memoCreatedAtLabel.text = memo.createdAtString
        cell.memoImageView.image = memo.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            // 배열에서 삭제
            let memo = memoStore.memoList[indexPath.row]
            memoStore.removeMemo(memo)
            // 테이블뷰에서 삭제 애니메이션
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        default:
            break
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        // let viewController = MemoWebDetailViewController()
        let viewController = MemoDetailViewController()
        viewController.memo = memoStore.memoList[indexPath.row]
        
        navigationController?.pushViewController(viewController, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

#Preview {
    MemoListViewController()
}
