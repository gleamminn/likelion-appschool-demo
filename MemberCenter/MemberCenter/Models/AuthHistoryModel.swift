//
//  AuthHistoryModel.swift
//  MemberCenter
//
//  Created by Jongwook Park on 8/1/24.
//

import Foundation

final class AuthHistoryModel: NSObject {
    // singleton 인스턴스는 앱이 시작되면 그냥 자동으로 생기는 게 아니라
    // 어디선가 처음으로 이 이름을 언급하는 순간에 메모리에서 자리를 잡는다
    static let shared: AuthHistoryModel = AuthHistoryModel()
    
    private(set) var logs: [String] = [] {
        didSet {
            let notification: Notification = Notification(name: .updateHistory)
            NotificationCenter.default.post(notification)
        }
    }
    private(set) var lastUsername: String = "(none)"
    
    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(addLog), name: .userLogin, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(addLog), name: .userLogout, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func addLog() {
        let authModel: AuthModel = AuthModel.shared
        
        if authModel.isLogin {
            lastUsername = authModel.username ?? "(none)"
            let log: String = "\(lastUsername)님이 로그인했습니다"
            logs.append(log)
        } else {
            let log: String = "\(lastUsername)님이 로그아웃했습니다"
            logs.append(log)
        }
    }
    
    func clear() {
        logs.removeAll()
    }
}

extension Notification.Name {
    static let updateHistory = Notification.Name("updateHistory")
}
