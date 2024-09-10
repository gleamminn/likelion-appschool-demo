//
//  SeriesView.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import SwiftUI

struct SeriesView: View {
    var body: some View {
        List(serieses) { series in
            Section {
                Text(series.title)
                    .font(.title)
                
                AsyncImage(url: series.posterImageURL) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                } placeholder: {
                    ProgressView()
                }
                
                ScrollView(.horizontal) {
                    HStack(alignment: .top) {
                        ForEach(series.episodes) { episode in
                            VStack(alignment: .leading) {
                                AsyncImage(url: episode.posterImageURL) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                
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
                            .frame(width: 200)
                        }
                    }
                }
                
                Text(series.description)
                
                Text("공개일 \(String(series.year))년")
                
                if series.rate > 0 {
                    Text("관람등급 \(series.rate)")
                } else {
                    Text("관람등급 All")
                }
                
                VStack(alignment: .leading) {
                    Text("장르")
                        .font(.headline)
                    HStack {
                        ForEach(series.genre, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("감독")
                        .font(.headline)
                    ForEach(series.directors, id: \.self) { director in
                        Text(director)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("출연")
                        .font(.headline)
                    ForEach(series.actors, id: \.self) { actor in
                        Text(actor)
                    }
                }
            }
        }
        .navigationTitle("Series")
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        SeriesView()
    }
}
