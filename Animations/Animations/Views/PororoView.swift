//
//  PororoView.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import SwiftUI

struct PororoView: View {
    
    let titleImageUrl: URL? = URL(string: "https://i.namu.wiki/i/l84pTm4_ArBsO0FSNC8JIruZMQS_eD5g4p29CKeg1VzTeB0w0CBJ7ngOl6uXMhAVn5_RECBmKVDrsuVhrx3mJ8J-e2UnMdnQ8juBJPVtnL5ElGnc7_9asUMiU0ElT8JsmLqWWyFdLrrWbgYV4QHBoA.webp")
    
    var body: some View {
        List {
            Section {
                AsyncImage(url: titleImageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
            }
            
            Section {
                ForEach(pororoChracters) { character in
                    NavigationLink {
                        PororoDetailView(character: character)
                    } label: {
                        Text(character.name)
                    }
                }
            }
        }
        .navigationTitle("뽀롱뽀롱 뽀로로")
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        PororoView()
    }
}
