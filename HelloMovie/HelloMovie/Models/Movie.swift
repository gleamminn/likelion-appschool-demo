//
//  Movie.swift
//  HelloMovie
//
//  Created by Jongwook Park on 8/13/24.
//

import Foundation

enum Publisher: String, CaseIterable {
    case cjEnm = "CJ ENM"
    case nextEntWorld = "NEW"
    case showbox = "쇼박스"
    case lotte = "롯데엔터테인먼트"
    case plusM = "플러스엠"
}

struct Movie {
    var publisher: Publisher
    var name: String
    var year: Int
    var posterURL: String?
    var infoURL: String?
}
