//
//  ShowDetailView.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import SwiftUI

struct ShowDetailView: View {
    var show: Show
    
    var body: some View {
        List {
            Section {
                AsyncImage(url: show.posterImageURL) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                } placeholder: {
                    ProgressView()
                }
            }
            
            Section("에피소드") {
                ForEach(show.episodes) { episode in
                    HStack(alignment: .top) {
                        AsyncImage(url: episode.posterImageURL) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 170)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("시즌 \(episode.season)")
                                Text("에피소드 \(episode.number)")
                            }
                            Text("\(episode.title)")
                                .font(.headline)
                            Text("\(episode.description)")
                            Text("\(episode.runningTime)분")
                                .foregroundStyle(Color.gray)
                        }
                    }
                }
            }
            
            Section("상세정보") {
                Text(show.description)
                
                Text("공개일 \(String(show.year))년")

                if show.rate > 0 {
                    Text("관람등급 \(show.rate)")
                } else {
                    Text("관람등급 All")
                }
                
                VStack(alignment: .leading) {
                    Text("장르")
                        .font(.headline)
                    HStack {
                        ForEach(show.genre, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("감독")
                        .font(.headline)
                    ForEach(show.directors, id: \.self) { director in
                        Text(director)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("출연")
                        .font(.headline)
                    ForEach(show.actors, id: \.self) { actor in
                        Text(actor)
                    }
                }
            }
        }
        .navigationTitle(show.title)
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        ShowDetailView(show: shows.first!)
    }
}
