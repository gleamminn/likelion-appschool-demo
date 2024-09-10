//
//  ViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

// 기본 예제

class ViewController: BaseStackViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.backgroundColor = .systemBlue
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "검색어를 입력하세요"
        textField.borderStyle = .line
        textField.keyboardType = .numberPad
        
        textField.addAction(UIAction { _ in
            print("editingChanged : \(textField.text ?? "(none)")")
        }, for: .editingChanged)
        
        textField.addAction(UIAction { _ in
            print("editingDidBegin : \(textField.text ?? "(none)")")
        }, for: .editingDidBegin)
        
        textField.addAction(UIAction { _ in
            print("editingDidEnd : \(textField.text ?? "(none)")")
        }, for: .editingDidEnd)
        
        textField.addAction(UIAction { _ in
            print("valueChanged : \(textField.text ?? "(none)")")
        }, for: .valueChanged)
        
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("show alert", for: .normal)
        button.backgroundColor = .memoAlertColor
        button.addAction(UIAction { _ in
            print("show!")
            
            let alert = UIAlertController(title: "Do you want delete this memo?",
                                          message: "After deleting, it can't back.",
                                          preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Remove",
                                             style: .destructive,
                                             handler: { _ in
                                                print("Remove")
                                            })
            
            let cancelAction = UIAlertAction(title: "Cancel",
                                             style: .default,
                                             handler: { _ in
                                                print("cancel")
                                            })
            
            alert.addAction(deleteAction)
            alert.addAction(cancelAction)
            
            self.present(alert, animated: true, completion: nil)
            
        }, for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
    }

    override func setupInterface() {
        super.setupInterface()
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(button)
    }

}

#Preview {
    ViewController()
}
