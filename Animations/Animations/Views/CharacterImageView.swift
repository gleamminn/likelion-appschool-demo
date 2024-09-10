//
//  CharacterImageView.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import SwiftUI

struct CharacterImageView: View {
    // charater 데이터는 AnimationCharacter 클래스 타입을 상속받은
    // PororoCharacter나 TayoCharacter라도 상관 없다!
    var character: AnimationCharacter
    
    var body: some View {
        AsyncImage(url: character.imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    CharacterImageView(character: samplePororoChracters)
}
