//
//  AuthHistoryModel.swift
//  LoginCenter
//
//  Created by Jongwook Park on 7/31/24.
//

import Foundation

class AuthHistoryModel: NSObject {
    
    static let shared: AuthHistoryModel = AuthHistoryModel()
    
    // 최근 로그인된 상황을 기록
    private(set) var username: String?
    private(set) var isLogin: Bool = false
    
    override init() {
        super.init()
            
        NotificationCenter.default.addObserver(self, selector: #selector(updateHistory(_:)), name: .userLogin, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateHistory(_:)), name: .userLogout, object: nil)
    }
    
    @objc func updateHistory(_ notification: Notification) {
        if let authUsername = AuthModel.shared.username {
            username = authUsername
        }
        
        isLogin = AuthModel.shared.isLogin
    }
    
    func clear() {
        username = nil
        
        NotificationCenter.default.post(name: .clearHistory, object: nil)
    }
}

extension Notification.Name {
    static let clearHistory = Notification.Name("clearHistory")
}
