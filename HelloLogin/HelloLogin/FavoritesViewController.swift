//
//  FavoritesViewController.swift
//  HelloLogin
//
//  Created by Jongwook Park on 7/29/24.
//

import UIKit

class FavoritesViewController: UIViewController {

//    private var loginModel: LoginModel = LoginModel()
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // KVO 관찰자 추가
        setupObserver()
        
        displayStatus()
    }
    
    // KVO를 활용한다면 deinit 메서드에 반드시
    // 해당 항목의 관찰을 그만 두겠다는 코드를 추가할 필요가 있다
    deinit {
        LoginModel.shared.removeObserver(self, forKeyPath: #keyPath(LoginModel.name))
    }
    
    func setupObserver() {
        // 만약 LoginModel에서 제공하는 shared 인스턴스에 관찰자를 추가하는 코드
        // LoginModel 안의 name이라는 프로퍼티까지의 찾아가는 데이터 포함 경로를 지정하고
        // 신규값이 생기거나(.new), 최초로 값이 할당되거든(.initial)
        // 알림을 받을 준비를 하게 만든다
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
        // 이 앱에서 딱 하나만 존재할 LoginModel의 싱글톤 데이터값인 shared를 사용해보자!
        messageLabel.text = "user: \(LoginModel.shared.name)"
    }
    
    @IBAction func login(_ sender: Any) {
        LoginModel.shared.name = "Ned"
    }
    
    @IBAction func logout(_ sender: Any) {
        LoginModel.shared.name = "(none)"
    }
}
