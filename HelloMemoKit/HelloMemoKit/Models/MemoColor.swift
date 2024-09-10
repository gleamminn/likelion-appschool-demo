//
//  MemoColor.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/23/24.
//

import UIKit

// CaseIterable 프로토콜을 따르는 enum 열거형은
// allCases로 모든 경우를 배열로 뽑아낼 수 있다
enum MemoColor: String, CaseIterable {
    case white = "white"
    case black = "black"
    case blue = "blue"
    case green = "green"
    case red = "red"
    case yellow = "yello"
    
    var uiColor: UIColor {
        switch self {
        case .white:
            return .white
        case .black:
            return .black
        case .blue:
            return .blue
        case .green:
            return .green
        case .red:
            return .red
        case .yellow:
            return .yellow
        }
    }
    
    static func indexForColor(color: UIColor) -> Int {
        var index: Int = 0
        
        for memoColor in MemoColor.allCases {
            
            if memoColor.uiColor == color {
                return index
            }
            
            index += 1
        }
        
        return 0
    }
}
