//
//  ShowView.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import SwiftUI

struct ShowView: View {
    var body: some View {
        List(shows) { show in
            NavigationLink {
                ShowDetailView(show: show)
            } label: {
                HStack(alignment: .top) {
                    AsyncImage(url: show.posterImageURL) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 150)
                    
                    VStack(alignment: .leading) {
                        Text("\(show.title)")
                            .font(.headline)
                            .padding(.bottom)
                        
                        
                        Text(show.description)
                            .lineLimit(4)
                            .padding(.bottom)
                        
                        if !show.directors.isEmpty {
                            VStack(alignment: .leading) {
                                Text("연출")
                                    .font(.headline)
                                
                                ForEach(show.directors, id: \.self) { director in
                                    Text(director)
                                }
                            }
                            .padding(.bottom)
                        }
                        
                        Text("공개일 \(String(show.year))년")
                    }
                }
            }
        }
        .navigationTitle("Show")
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        ShowView()
    }
}
