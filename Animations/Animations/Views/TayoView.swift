//
//  TayoView.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import SwiftUI

struct TayoView: View {
    let titleImageUrl: URL? = URL(string: "https://i.namu.wiki/i/uD7-e6-XwXKTYnqqtrEl5kgWbHZ6Qed_-K598Afry4XG2_9VILDfnFqPCf9ynNHyvA_b47wIUXOCzsZFzlmv3ouApXzTo573i2UtV8L5W2Xr53ejXPkcXrWU-EkystTUXI84yaE2ybZGXneGrcnBCQ.webp")
    
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
                ForEach(tayoCharaters) { character in
                    NavigationLink {
                        TayoDetailView(character: character)
                    } label: {
                        Text(character.name)
                    }
                }
            }
        }
        .navigationTitle("꼬마버스 타요")
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        TayoView()
    }
}
