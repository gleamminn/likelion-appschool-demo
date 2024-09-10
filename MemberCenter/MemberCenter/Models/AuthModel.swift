//
//  AuthModel.swift
//  MemberCenter
//
//  Created by Jongwook Park on 8/1/24.
//

import Foundation

// final: 상속 불가 클래스 만들기
final class AuthModel: NSObject {
    static let shared: AuthModel = AuthModel()
    /*
     [SET]
     AuthModel.shared.username = "hello"
     
     [GET]
     let name = AuthModel.username
     */
    
    private(set) var username: String?
    
    var isLogin: Bool {
        get {
            if username != nil {
                return true
            } else {
                return false
            }
        }
    }
    
    func login(username: String) {
        self.username = username
        postNofication(.userLogin)
    }
    
    func logout() {
        username = nil
        postNofication(.userLogout)
    }
    
    private func postNofication(_ name: Notification.Name) {
        let notification: Notification = Notification(name: name)
        NotificationCenter.default.post(notification)
    }
}

extension Notification.Name {
    static let userLogin = Notification.Name("userLogin")
    static let userLogout = Notification.Name("userLogout")
}
