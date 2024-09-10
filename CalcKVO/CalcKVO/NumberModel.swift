//
//  NumberModel.swift
//  CalcKVO
//
//  Created by Jongwook Park on 7/30/24.
//

import Foundation

class NumberModel: NSObject {
    
    // Singleton 패턴을 위한 인스턴스 생성
    static let shared = NumberModel()
    
    @objc dynamic var firstNumber: Int = 0
    @objc dynamic var secondNumber: Int = 0
    
    // 연산프로퍼티 : 상세하게 다 만들기 get, return ...
    var plusNumbers: String {
        get {
            return "\(firstNumber) ➕ \(secondNumber) 🟰 \(firstNumber + secondNumber)"
        }
    }
    
    // 연산프로퍼티 : get만 있으면 get 언급 생략 가능
    var minusNumbers: String {
        return "\(firstNumber) ➖ \(secondNumber) 🟰 \(firstNumber - secondNumber)"
    }
    
    // 연산프로퍼티 : return 줄밖에 없으면 return 생략 가능
    var multiplyNumbers: String {
        "\(firstNumber) ✖️ \(secondNumber) 🟰 \(firstNumber * secondNumber)"
    }
    
    // 나눗셈은 0으로 나누는 경우를 생각해서 좀 다르게 처리해봅시다
    var divideNumbers: String {
        guard secondNumber != 0 else {
            return ""
        }
        
        return "\(firstNumber) ➗ \(secondNumber) 🟰 \(Double(firstNumber) / Double(secondNumber))"
    }
}
