//
//  TayoDetailView.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import SwiftUI

struct TayoDetailView: View {
    var character: TayoCharacter
    
    var body: some View {
        List {
            CharacterImageView(character: character)
            CharacterInfoView(title: "버스번호", detail: character.number)
            CharacterInfoView(title: "버스 종류", detail: character.busKind.rawValue)
            CharacterColorView(character: character)
        }
        .navigationTitle(character.name)
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        TayoDetailView(character: sampleTayoCharater)
    }
}
