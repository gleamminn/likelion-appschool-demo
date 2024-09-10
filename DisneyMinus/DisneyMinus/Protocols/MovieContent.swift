//
//  MovieContent.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import Foundation

// 영화
protocol MovieContent: MediaContent {
    var runningTime: Int { get set } // 재생시간
}
