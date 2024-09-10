//
//  Data.swift
//  LionSchool
//
//  Created by Jongwook Park on 6/17/24.
//

import Foundation

// 학교 > 학년(~3) > 학급(~8) > 학생(~35)
// School > Level > Class > Student

// 이 프로토콜을 따르는 타입들은 이름 항목이 꼭 있어야 한다
protocol NameExist {
    var name: String { get set }
}

protocol CampaignExist {
    var campaign: String { get set }
}


struct School: NameExist, CampaignExist {
    var name: String
    var campaign: String
    var levels: [Level]
}

struct Level: NameExist, Identifiable {
    var id: UUID = UUID()
    var name: String
    var schoolClasses: [SchoolClass]
}

struct SchoolClass: NameExist, CampaignExist, Identifiable {
    var id: UUID = UUID()
    var name: String
    var campaign: String
    var students: [Student]
}

struct Student: NameExist, Identifiable {
    var id: UUID = UUID()
    var name: String
}

// 애니메이션 반 만들기

let animationStudents: [Student] = [
    Student(name: "짱구"),
    Student(name: "도라에몽"),
    Student(name: "흰둥이"),
    Student(name: "큐티니"),
    Student(name: "하니"),
    Student(name: "하츄핑"),
]

let animationClass: SchoolClass = SchoolClass(name: "애니메이션반",
                                              campaign: "웹툰으로 대박나자!",
                                              students: animationStudents)

// 스포츠 반 만들기
let sportClass: SchoolClass = SchoolClass(name: "스포츠반",
                                          campaign: "올림픽 금메달을 향하여!",
                                          students: [
                                            Student(name: "박태환"),
                                            Student(name: "이상혁"),
                                            Student(name: "손흥민"),
                                            Student(name: "김연아"),
                                            Student(name: "김연경"),
                                            Student(name: "강호동"),
                                            Student(name: "장미란"),
                                          ])

// 1학년을 만듭시다

let levelOne: Level = Level(name: "1학년", schoolClasses: [animationClass, sportClass])

// 학교를 만듭시다

let mySchool: School = School(name: "멋쟁이고등학교",
                              campaign: "멋쟁이가 됩시다!",
                              levels: [
    levelOne,
    Level(name: "2학년", schoolClasses: [
        SchoolClass(name: "배우반",
                    campaign: "인생은 영화처럼",
                    students: [
                        Student(name: "변우석"),
                        Student(name: "손석구"),
                        Student(name: "이채민"),
                        Student(name: "김지원"),
                        Student(name: "공효진"),
                        Student(name: "김지미"),
                    ])
    ])
])










