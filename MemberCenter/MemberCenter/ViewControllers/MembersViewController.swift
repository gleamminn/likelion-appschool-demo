//
//  MembersViewController.swift
//  MemberCenter
//
//  Created by Jongwook Park on 8/1/24.
//

import UIKit

class MembersViewController: UIViewController {
    
    @IBOutlet weak var member1Button: UIButton!
    @IBOutlet weak var member2Button: UIButton!
    @IBOutlet weak var member3Button: UIButton!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    let authModel: AuthModel = AuthModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateViews()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateViews), name: .userLogin, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateViews), name: .userLogout, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        
        super.viewWillDisappear(animated)
    }
    
    
    @objc func updateViews() {
        // 가급적이면 너무 이렇게 짧게 쓰지는 맙시다! - 알아보기 불편함
        member1Button.isHidden = authModel.isLogin
        member2Button.isHidden = authModel.isLogin
        member3Button.isHidden = authModel.isLogin
        messageLabel.isHidden = !authModel.isLogin
        logoutButton.isHidden = !authModel.isLogin
        
        if authModel.isLogin {
            let name: String = authModel.username ?? "(none)"
            messageLabel.text = "\(name)님이 로그인 했습니다"
        }
    }
    
    @IBAction func loginMember1(_ sender: Any) {
        authModel.login(username: "Tuna")
    }
    
    @IBAction func loginMember2(_ sender: Any) {
        authModel.login(username: "Ned")
    }
    
    @IBAction func loginMember3(_ sender: Any) {
        authModel.login(username: "CH")
    }
    
    @IBAction func loginout(_ sender: Any) {
        authModel.logout()
    }
}
