//
//  HistoryViewController.swift
//  HelloLogin
//
//  Created by Jongwook Park on 7/29/24.
//

import UIKit

class HistoryViewController: UIViewController {

//    private var loginModel: LoginModel = LoginModel()
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // KVO 관찰자 추가
        setupObserver()
    }
    
    deinit {
        LoginModel.shared.removeObserver(self, forKeyPath: #keyPath(LoginModel.name))
    }
    
    func setupObserver() {
        LoginModel.shared.addObserver(self, forKeyPath: #keyPath(LoginModel.name), options: [.new, .initial], context: nil)
    }
    
    // 관찰자에서 이벤트가 발행하면 처리해줄 코드
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        // 우리가 관찰하려는 keyPath의 값이 바뀌었다면 처리할 코드
        if keyPath == #keyPath(LoginModel.name) {
            displayStatus()
        }
    }
    
    func displayStatus() {
        // Singleton에 의한 데이터이기 때문에
        // FavoriteViewController에서 변경된 내용을 반영할 수 있다.
        messageLabel.text = "user: \(LoginModel.shared.name)"
    }
}
