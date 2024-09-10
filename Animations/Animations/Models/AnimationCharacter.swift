//
//  AnimationCharacter.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import SwiftUI

class AnimationCharacter: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var color: Color
    var imageUrlString: String
    
    // 연산프로퍼티를 사용하면 외부에서 별도의 계산을 반복적으로 할 필요가 줄어듭니다.
    // 외부의 반복되는 코드를 간결하게 만들어줍니다.
    var imageUrl: URL? {
        get {
            return URL(string: imageUrlString)
        }
    }
    
    init(name: String, color: Color, imageUrlString: String) {
        self.name = name
        self.color = color
        self.imageUrlString = imageUrlString
    }
}
