//
//  CharacterColorView.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import SwiftUI

struct CharacterColorView: View {
    var character: AnimationCharacter
    
    var body: some View {
        HStack {
            Text("색상")
                .font(.headline)
            Spacer()
            Circle()
                .foregroundStyle(character.color)
                .shadow(radius: 10)
                .frame(width: 50)
        }
    }
}

#Preview {
    CharacterColorView(character: sampleTayoCharater)
}
