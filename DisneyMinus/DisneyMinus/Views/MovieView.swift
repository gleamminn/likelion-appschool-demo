//
//  MovieView.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import SwiftUI

struct MovieView: View {
    var body: some View {
        List(movies) { movie in
            Section {
                Text(movie.title)
                    .font(.title)
                
                AsyncImage(url: movie.posterImageURL) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                } placeholder: {
                    ProgressView()
                }
                
                Text(movie.description)
                
                Text("러닝타임 \(movie.runningTime)분")
                
                Text("공개일 \(String(movie.year))년")
                
                if movie.rate > 0 {
                    Text("관람등급 \(movie.rate)")
                } else {
                    Text("관람등급 All")
                }
                
                VStack(alignment: .leading) {
                    Text("장르")
                        .font(.headline)
                    HStack {
                        ForEach(movie.genre, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("감독")
                        .font(.headline)
                    ForEach(movie.directors, id: \.self) { director in
                        Text(director)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("출연")
                        .font(.headline)
                    ForEach(movie.actors, id: \.self) { actor in
                        Text(actor)
                    }
                }
                
                
            }
        }
        .navigationTitle("Movie")
    }
}

#Preview {
    NavigationStack {
        MovieView()
    }
}
