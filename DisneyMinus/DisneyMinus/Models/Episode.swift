//
//  Episode.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import Foundation

struct Episode: EpisodeContent {
    var id: UUID = UUID()
    
    var season: Int
    var number: Int
    var title: String
    var description: String
    var runningTime: Int
    
    var posterImageURLString: String
}
