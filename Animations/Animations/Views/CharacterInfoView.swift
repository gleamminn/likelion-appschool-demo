//
//  CharacterInfoView.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import SwiftUI

struct CharacterInfoView: View {
    var title: String
    var detail: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Text(detail)
        }
    }
}

#Preview {
    CharacterInfoView(title: "제목", detail: "내용")
}
