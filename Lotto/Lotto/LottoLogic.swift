//
//  LottoLogic.swift
//  Lotto
//
//  Created by Jongwook Park on 7/3/24.
//

import Foundation

// 1부터 45 사이의 정수 만들기
func getNumber() -> Int {
    Int.random(in: 1...45)
}

// 당첨번호 6개와 보너스 번호 만들기
func getResults() -> (results: [Int], bonus: Int) {
    var resultSet: Set<Int> = []
    
    repeat {
        resultSet.insert(getNumber())
    } while resultSet.count < 7
    
    // Set 데이터로부터 Array를 만들기
    var results: [Int] = Array(resultSet)
    
    let bonus: Int = results.last ?? 0
    results.removeLast()
    
    return (results.sorted(), bonus)
}

// 응모번호 6개 숫자 만들기
func getRequest() -> [Int] {
    var requestSet: Set<Int> = []
    
    repeat {
        requestSet.insert(getNumber())
    } while requestSet.count < 6
    
    // Set 데이터로부터 Array를 만들어 반환하기
    return Array(requestSet).sorted()
}

// 응모번호 모음 5개 만들기 (모음마다 6개 숫자 담김)
func getRequests() -> [[Int]] {
    var requests: [[Int]] = []
    
    for _ in 0..<5 {
        requests.append(getRequest())
    }
    
    return requests
}
