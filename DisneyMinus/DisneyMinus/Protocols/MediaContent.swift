//
//  MediaContent.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import Foundation

protocol MediaContent: Identifiable, Poster {
    var title: String { get set } // 제목
    var description: String { get set } // 설명글
    var year: Int { get set } // 공개일
    var genre: [String] { get set } // 장르(들)
    var rate: Int { get set } // 관람등급
    var directors: [String] { get set } // 감독(들)
    var actors: [String] { get set } // 출연자(들)
}
