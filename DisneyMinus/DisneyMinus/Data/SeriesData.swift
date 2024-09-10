//
//  SeriesData.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import Foundation

let serieses: [Series] = [
    Series(title: "무빙",
           description: "초능력을 숨긴 채 현재를 살아가는 아이들과, 과거의 아픈 비밀 을 감춘 채 살아온 부모들이 시대와 세대를 넘어 닥치는 거대한 위험에 함께 맞서는 초능력 휴먼 액션 시리즈. 일부 섬광 장면이 빛에 민감한 시청자에게 영향을 줄 수 있음.",
           year: 2023,
           genre: ["드라마", "스릴러", "판타지", "어드벤처", "액션"],
           rate: 19,
           directors: ["박인제", "박윤서"],
           actors: ["류승룡", "한효주", "조인성", "이정하", "고윤정"],
           posterImageURLString: "https://file.kinolights.com/l/content_still_cut/202309/26/66cf4331-5657-4ad6-9c46-f2dc6df5c444.webp",
           episodes: [
            Episode(season: 1, 
                    number: 1,
                    title: "고3",
                    description: "평범한 고등학생 같지만, 비밀을 감춘 봉석.",
                    runningTime: 42,
                    posterImageURLString: "https://file.kinolights.com/l/content_still_cut/202307/12/bbd3e008-bb11-4ee5-b586-e05b0347f725.webp"),
            Episode(season: 1, 
                    number: 2,
                    title: "부양",
                    description: "미현은 봉석의 초능력을 숨기며 살아간다.",
                    runningTime: 45,
                    posterImageURLString: "https://file.kinolights.com/l/content_still_cut/202307/18/d718a1aa-9db0-4d90-8bd5-e90f00630e29.webp"),
            Episode(season: 1, 
                    number: 3,
                    title: "원+원",
                    description: "우리가 되게 잘 맞는 거 같아!",
                    runningTime: 42,
                    posterImageURLString: "https://file.kinolights.com/l/content_still_cut/202307/12/5aef70e7-6286-464c-8ed9-89c0b03e309e.webp"),
           ]),
]
