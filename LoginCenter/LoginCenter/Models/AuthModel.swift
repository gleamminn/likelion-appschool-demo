//
//  AuthModel.swift
//  LoginCenter
//
//  Created by Jongwook Park on 7/31/24.
//

import Foundation

class AuthModel: NSObject {
    
    // Singleton 인스턴스
    static let shared: AuthModel = AuthModel()
    
    private(set) var isLogin: Bool = false
    private(set) var username: String?
    
    func login(username: String, password: String) -> Bool {
        
        if (username == "NED" && password == "1234")
        || (username == "TUNA" && password == "12345") {
            isLogin = true
            self.username = username
            
            NotificationCenter.default.post(name: .userLogin, object: nil)
        }
        
        return isLogin
    }
    
    func logout() {
        isLogin = false
        username = nil
        
        NotificationCenter.default.post(name: .userLogout, object: nil)
    }
}

extension Notification.Name {
    static let userLogin = Notification.Name("userLogin")
    static let userLogout = Notification.Name("userLogout")
}
