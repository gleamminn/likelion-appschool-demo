//
//  CombineViewController.swift
//  RxNamed
//
//  Created by Jongwook Park on 8/2/24.
//

import UIKit
import Combine

class CombineViewController: UIViewController {

    // Combine을 사용하기 위한 Cancellable 배열
    private var cancellables: Set<AnyCancellable> = []
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindUI()
    }
    
    // Combine을 사용한 UI 바인딩
    func bindUI() {
        
        // Combine을 사용하여 텍스트 필드의 텍스트 변경을 구독
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: textField)
            .compactMap { ($0.object as? UITextField)?.text }
            .assign(to: \.text, on: label)
            .store(in: &cancellables)
        
        // Combine을 사용하여 텍스트 필드의 텍스트가 변경될 때마다 레이블의 텍스트를 업데이트합니다.
            
    }
}
