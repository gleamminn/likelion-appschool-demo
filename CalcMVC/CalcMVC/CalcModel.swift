//
//  CalcModel.swift
//  CalcMVC
//
//  Created by Jongwook Park on 7/24/24.
//

import Foundation

struct CalcModel {
    /*
     set(값을 할당하는 작업)은 private으로 설정해서
     이 타입의 내부 메서드를 통해서만 가능하게 만든다
     : Controller는 Model의 메서드를 통해서,
     : Model 내부의 값을 간접적으로 수정할 수 있다.
     */
    private(set) var firstNumber: Int = 0
    private(set) var secondNumber: Int = 0
    
    /*
     result의 타입을 무엇으로 하면 좋을까?
     Int: 5/2의 결과에서 수숫점 이하를 보여줄 수 없다
     Double: 103/0의 결과가 "이런거 안됨"표시할 때 애매하다
     그래서 결론은 String으로 처리하자!
     */
    private(set) var result: String = ""
    
    mutating func increaseFirstNumber() {
        firstNumber += 1
    }
    
    mutating func decreaseFirstNumber() {
        firstNumber -= 1
    }
    
    mutating func increaseSecondNumber() {
        secondNumber += 1
    }
    
    mutating func decreaseSecondNumber() {
        secondNumber -= 1
    }
    
    mutating func add() {
        result = "\(firstNumber + secondNumber)"
    }
}
