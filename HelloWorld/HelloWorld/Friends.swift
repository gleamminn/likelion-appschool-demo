//
//  Friends.swift
//  HelloWorld
//
//  Created by Jongwook Park on 7/3/24.
//

import Foundation

enum Country: String {
    case Maldives = "몰디브"
    case Argentina = "아르헨티나"
    case Swiss = "스위스"
    case Taiwan = "타이완"
    case Germany = "독일"
    case Spain = "스페인"
    case UK = "영국"
    case Japan = "일본"
    
    // 연산프로퍼티
    var greeting: String {
        switch self {
        case .Maldives:
            return "Dhivehin Jeha"
        case .Argentina, .Spain:
            return "Hola" // 스페인어
        case .Swiss:
            return "Bonjour" // 프랑스어
        case .Taiwan:
            return "Nihao" // 중국어
        case .Germany:
            return "Guten Tag"
        case .UK:
            return "Hello"
        case .Japan:
            return "곤니치와"
        }
    }
}

struct Friend: Identifiable {
    var id: UUID = UUID()
    var name: String
    var country: Country
}

struct Lab: Identifiable {
    var id: UUID = UUID()
    var index: Int
    var friends: [Friend]
}

let labs: [Lab] = [
    Lab(index: 1, friends: [
        Friend(name: "구영진", country: .Maldives),
        Friend(name: "강희창", country: .Argentina),
        Friend(name: "김수은", country: .Swiss),
        Friend(name: "황인영", country: .Taiwan),
        Friend(name: "배문성", country: .Germany)
    ]),
    Lab(index: 2, friends: [
        Friend(name: "강승우", country: .Spain),
        Friend(name: "김준환", country: .UK),
        Friend(name: "신현우", country: .Japan),
        Friend(name: "이정민", country: .Germany),
    ])
]


