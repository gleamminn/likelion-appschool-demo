//
//  PororoCharacter.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import SwiftUI

enum Gender: String {
    case female = "여성"
    case male = "남성"
    case other = "기타"
}

class PororoCharacter: AnimationCharacter {
    var gender: Gender
    
    init(name: String, color: Color, imageUrlString: String, gender: Gender) {
        self.gender = gender
        
        // super 지시자는 슈퍼클래스의 메서드를 접근할 수 있게 한다
        super.init(name: name, color: color, imageUrlString: imageUrlString)
    }
}
