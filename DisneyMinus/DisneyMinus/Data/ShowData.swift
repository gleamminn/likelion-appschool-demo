//
//  ShowData.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import Foundation

let shows: [Show] = [
    Show(title: "My name is 가브리엘",
         description: """
            세계 80억 인구 중 누군가의 이름으로 살아본다면? 특별한 Al '가브리엘'이 분석한 대한민국 최고 스타들의 타인의 삶 매칭 결 과를 지금 공개합니다. 예기치 못한 순간에 찾아오는 나의 새로 운 이름.
            "지금부터 72시간 동안 당신은 진짜 타인의 삶을 살게 됩니다." 주목! AI 가브리엘 매칭 정확도는 10%, 취향 저격 꿈의 라이프 스타일부터 모든 것이 반대인 삶까지.
            세계 정반대 편에서 갑작스럽게 시작되는 타인의 삶 <My name is 가브리엘>, 지금 당신을 찾아갑니다.
            일부 섬광 장면이 빛에 민감한 시청자에게 영향을 줄 수 있음.
            """,
         year: 2024,
         genre: ["리얼리티"],
         rate: 15,
         directors: ["김태호"],
         actors: ["박명수", "염혜란", "홍진경", "지창욱", "박보검", "덱스"],
         posterImageURLString: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FBnxgI%2FbtsH6f7ND6c%2FWRnOb0FKlm2k9OqLKXSqHK%2Fimg.jpg&f=1&nofb=1&ipt=bf133af5a5de03fe53ab8ad9045998aa9d472b50c0d5271911368ec31044e58e&ipo=images",
         episodes: [
            Episode(season: 1,
                    number: 1,
                    title: "제1화",
                    description: "첫 가브리엘 보검과 명수",
                    runningTime: 119,
                    posterImageURLString: "https://file.kinolights.com/l/content_still_cut/202406/30/0bb3fd52-0b65-4c27-bc05-dab82bd3216a.webp"),
            Episode(season: 1, 
                    number: 2,
                    title: "제2화",
                    description: "더블린에서 또 다른 인연을 만난 보검",
                    runningTime: 109,
                    posterImageURLString: "https://file.kinolights.com/l/content_still_cut/202406/30/dc7ad9f0-2cfa-469e-b96e-c08c2fd08e20.webp"),
            Episode(season: 1, 
                    number: 3,
                    title: "제3화",
                    description: "명수는 과연 장사 첫날 매출 목표 달성에 성공할 것인가",
                    runningTime: 105,
                    posterImageURLString: "https://file.kinolights.com/l/content_still_cut/202406/30/701d4ea1-83d7-4dcb-bf1b-2cf4945c8fcb.webp")
         ]),
    Show(title: "핑크라이",
         description: """
            조건 없이 사랑할 수 있을까?
            직업, 나이, 학벌 등 각자 가장 숨기고 싶은 거짓 한 가지를 안고 핑크 하우스에 입주한 청춘 남녀, 있는 그대로 나를 봐줄 사람을 찾기 위해 모인 이들은 과연 어떤 진실을 마주하게 될까.
            결국 드러날 수밖에 없는 진실 앞에서 휘몰아치는 감정의 소용 돌이. 사랑과 현실 사이, 아슬아슬한 줄타기 속 드러난 그들의 관 계와 민낯.
            그 사람은 당신의 진실을 알고 난 후에도 당신을 사랑할까?
            그리고 당신은... 그럼에도 불구하고 사랑하겠습니까?"
            일부 섬광 장면이 빛에 민감한 시청자에게 영향을 줄 수 있음.
            """,
         year: 2022,
         genre: ["로멘스", "리얼리티", "게임 쇼"],
         rate: 15,
         directors: [],
         actors: ["김희철", "이선빈", "송원석", "랄랄"],
         posterImageURLString: "https://file.kinolights.com/xl/content_poster/202401/16/e625be9a-6a4f-42df-bb2d-d59a0cf15b32.webp",
         episodes: [
            Episode(season: 1, number: 1, title: "누구에게나 한가지 거짓은 있다", description: "저 뒤에 어떤 거짓이 있을까?", runningTime: 74, posterImageURLString: "https://file.kinolights.com/l/content_still_cut/202307/12/9350e7c3-6863-4b08-8495-b2fac2d2831b.webp"),
            Episode(season: 1, number: 2, title: "거짓말은 생각하지마", description: "핑크 라이의 첫 번째 데이트", runningTime: 74, posterImageURLString: "https://file.kinolights.com/l/content_still_cut/202307/12/9bb99c37-e0fc-425c-aa9a-9ff9e2119bf5.webp"),
         ]),
]
