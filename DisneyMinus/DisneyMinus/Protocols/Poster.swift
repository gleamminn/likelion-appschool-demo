//
//  Poster.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import Foundation

protocol Poster {
    // 포스터 이미지 주소
    var posterImageURLString: String { get set }
    var posterImageURL: URL? { get }
}
