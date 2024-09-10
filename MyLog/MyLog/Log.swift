//
//  Log.swift
//  MyLog
//
//  Created by Jongwook Park on 7/25/24.
//

import Foundation

struct Log: Identifiable {
    /*
     저장 프로퍼티들
     */
    var id: UUID = UUID()
    
    var text: String
    var emotion: String
    
    // Log 데이터가 생길 때, 현재 날짜와 시각을 기본으로 담게 한다
    var date: Date = Date()
    
    
    /*
     연산 프로퍼티들
     */
    // 타입 연산프로퍼티
    static var emotions: [String] {
        get {
            // 혹시 우리 서버에서 감정 목록을 가져올 가능성은 없을까?
            // 여기에 구현할 수 있도록 연산프로퍼티로 만든 것입니다.
            return ["😀", "😁", "😆", "🥹", "😅", "😂", "🤣", "😇", "😍", "🥰", "🥶"]
        }
    }
    
    // 날짜를 더 깔끔하게 보여주기 위한 연산 프로퍼티
    var displayDate: String {
        get {
            let formetter: DateFormatter = DateFormatter()
            formetter.dateStyle = .medium
            formetter.timeStyle = .short
            return formetter.string(from: date)
        }
    }
    
    // 외부 공유를 위한 문자열 만들기
    var sharedString: String {
        get {
            return """
                \(text) \(emotion)
                \(displayDate)
            """
        }
    }
    
    /*
     메서드들 - 타입, 인스턴스 ...
     */
    
}
