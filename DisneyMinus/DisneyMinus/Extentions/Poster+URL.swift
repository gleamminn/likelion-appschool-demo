//
//  Poster+URL.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import Foundation

extension Poster {
    var posterImageURL: URL? {
        get {
            return URL(string: posterImageURLString)
        }
    }
}
