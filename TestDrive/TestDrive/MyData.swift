//
//  MyData.swift
//  TestDrive
//
//  Created by Jongwook Park on 8/5/24.
//

import Foundation

class MyData {
    
    // 두 숫자를 합쳐서 반환하는 메서드
    /*
    func addTwoNumbers(_ first: Int, _ second: Int) -> Int {
        let result: Int = first + second
        return result
    }
    
    func addTwoNumbers(_ first: Double, _ second: Double) -> Double {
        let result: Double = first + second
        return result
    }
    */
    
    // 제너릭을 활용한 메서드로 리팩터링
    func addTwoNumbers<T: AdditiveArithmetic>(_ first: T, _ second: T) -> T {
        let result = first + second
        return result
    }
}
