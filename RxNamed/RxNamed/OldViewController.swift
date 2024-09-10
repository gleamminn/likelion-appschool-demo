//
//  OldViewController.swift
//  RxNamed
//
//  Created by Jongwook Park on 8/1/24.
//

import UIKit

class OldViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.placeholder = "텍스트를 입력하세요"
        label.text = "여기에 텍스트가 표시됩니다"
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        textField.delegate = self
    }
    
    // MARK: - 이벤트 처리
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        
        label.text = textField.text
    }
    
    // MARK: - UITextFieldDelegate 메서드
    
    // 텍스트 필드의 편집이 끝났을 때 호출되는 메서드
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 여기에 필요한 추가 로직을 구현할 수 있습니다.
        print("텍스트 필드 편집 완료: \(textField.text ?? "")")
    }
    
    // 리턴 키를 눌렀을 때 호출되는 메서드
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 키보드 숨기기
        textField.resignFirstResponder()
        return true
    }
}
