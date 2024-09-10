//
//  EpisodeContent.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import Foundation

// 에피소드
protocol EpisodeContent: Identifiable, Poster {
    var season: Int { get set } // 시즌
    var number: Int { get set } // 화
    var title: String { get set } // 제목
    var description: String { get set } // 설명
    var runningTime: Int { get set } // 재생시간
}
