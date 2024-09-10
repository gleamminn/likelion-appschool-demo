//
//  Movie.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import Foundation

struct Movie: MovieContent {
    var id: UUID = UUID()
    
    var title: String
    var description: String
    var year: Int
    var genre: [String]
    var rate: Int
    var directors: [String]
    var actors: [String]
    
    var posterImageURLString: String

    var runningTime: Int
}
