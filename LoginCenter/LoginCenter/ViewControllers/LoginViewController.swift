//
//  LoginViewController.swift
//  LoginCenter
//
//  Created by Jongwook Park on 7/31/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
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
        if authModel.isLogin {
            usernameLabel.isHidden = true
            passwordLabel.isHidden = true
            usernameField.isHidden = true
            passwordField.isHidden = true
            loginButton.isHidden = true
            logoutButton.isHidden = false
        } else {
            usernameLabel.isHidden = false
            passwordLabel.isHidden = false
            usernameField.isHidden = false
            passwordField.isHidden = false
            loginButton.isHidden = false
            logoutButton.isHidden = true
        }
    }
    
    @IBAction func login(_ sender: Any) {
        let username: String = usernameField.text ?? ""
        let password: String = passwordField.text ?? ""
        let result = authModel.login(username: username, password: password)
        
        if result {
            usernameField.text = ""
            passwordField.text = ""
        }
    }
    
    @IBAction func logout(_ sender: Any) {
        authModel.logout()
    }
    
}
