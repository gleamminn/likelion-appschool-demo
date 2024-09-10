//
//  SeriesContent.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import Foundation

//  시리즈(드라마)
protocol SeriesContent: MediaContent {
    var episodes: [Episode] { get set } // 에피소드(들)
}
