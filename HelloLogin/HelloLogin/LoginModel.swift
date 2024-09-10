//
//  LoginModel.swift
//  HelloLogin
//
//  Created by Jongwook Park on 7/29/24.
//

import Foundation

// KVO에 맞춰 진행하려면, Swift가 아닌
// Objective-C에서 말하는 기본 클래스인 NSObject를 상속받아야할 수 있다.
class LoginModel: NSObject {
    // Singleton 패턴을 적용하기 위해
    // shared라는 타입 인스턴스를 만들어주자
    static let shared: LoginModel = LoginModel()
    
    // KVO로 관찰당하고자 하는 대상에 @objc dynamic 키워드를 추가한다
    // @objc는 Objective-C를 위한 런타임이 이해하도록 돕는 키워드
    @objc dynamic var name: String = ""
}
