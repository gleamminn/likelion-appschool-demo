//
//  PororoDetailView.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import SwiftUI

struct PororoDetailView: View {
    var character: PororoCharacter
    
    var body: some View {
        List {
            CharacterImageView(character: character)
            CharacterInfoView(title: "성별", detail: character.gender.rawValue)
            CharacterColorView(character: character)
        }
        .navigationTitle(character.name)
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        PororoDetailView(character: samplePororoChracters)
    }
}
