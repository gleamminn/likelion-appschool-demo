//
//  Sticker.swift
//  Stickers
//
//  Created by Jongwook Park on 2/6/24.
//

import Foundation
import SwiftUI

struct Sticker: Identifiable, Codable {
    var id: String = UUID().uuidString
    var memo: String
    var colorIndex: Int
    var date: Date = Date()
    
// struct의 저장 프로퍼티 값을 수정하는 메서드라면 mutating을 붙여 선언해야한다
    
//    mutating func updateMemo(text: String) {
//        memo = text
//    }
    
    // 현재상태의 저장 프로퍼티 값을 활용해
    // 특정 값을 실시간으로 만들어 반환해주려면
    // 함수(메서드) 보다는 연산 프로퍼티를 먼저 생각하자
    
    static var colors: [Color] {
        return [.yellow, .purple, .blue, .cyan, .brown]
    }
    
    var color: Color {
        get {
            switch colorIndex {
            case 0:
                return .yellow
            case 1:
                return .purple
            case 2:
                return .blue
            case 3:
                return .cyan
            case 4:
                return .brown
            default:
                return Color(red: 33/255, green: 33/255, blue: 33/255)
            }
        }
        
        set {
            // colorIndex = Sticker.getColorIndex(color: newValue)
            
            // 위와 같이 내부에서 다시 타입 메서드 호출로 처리도 가능하고
            // 아래와 같이 Swift 5.9의 새로운 switch 문법으로도 가능하다
            
            colorIndex = switch newValue {
                            case .yellow:
                                0
                            case .purple:
                                1
                            case .blue:
                                2
                            case .cyan:
                                3
                            case .brown:
                                4
                            default:
                                0
                            }
        }
    }
    
    var dateString: String {
        get {
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            
            return formatter.string(from: date)
        }
    }
    
    // 필요하면 함수(메서드)를 만들어야죠
    static func getColorIndex(color: Color) ->Int {
        switch color {
        case .yellow:
            return 0
        case .purple:
            return 1
        case .blue:
            return 2
        case .cyan:
            return 3
        case .brown:
            return 4
        default:
            return 0
        }
    }
}
