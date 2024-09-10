//
//  LogsStore.swift
//  MyLog
//
//  Created by Jongwook Park on 7/25/24.
//

import Foundation

class LogsStore: ObservableObject {
    @Published var logs: [Log] = [
        Log(text: "반갑습니다", emotion: "😍"),
        Log(text: "이것이 시작이다!", emotion: "😎"),
        Log(text: "매일밤 디스코드에서 만나요!", emotion: "🥺"),
        Log(text: """
        이거 켜놓고 아웃풋 뽑는거 구경만 해도 재밌다구
        어차피 모델이야 남들이 전기세 빵빵 써가면서 트레이닝 시켜놓은거 찾아쓰면되고...
        우리집 전기세는 안전합니다!
        """, emotion: "🥵")
    ]
    
    // 날짜 기준으로 정렬된 Log 배열을 만들어주는 연산 프로퍼티
    var displayLog: [Log] {
        get {
            logs.sorted {
                $0.date > $1.date
            }
        }
    }
    
    func addLog(text: String, emotion: String) {
        let log: Log = Log(text: text, emotion: emotion)
        logs.append(log)
        
        // 추가로 여기서, 파일이나 데이터베이스에 저장하는 코드를
        // 여기에서 구현할 수 있다
    }
    
    func removeLog(_ log: Log) {
        /*
         지울 대상의 Log 타입의 인스턴스 데이터가 갖고 있는 id값과
         똑같은 id값을 가지고 있는 데이터가
         배열 안에서 발견되면, 지우자!
         */
        for (index, tempLog) in logs.enumerated() {
            if log.id == tempLog.id {
                logs.remove(at: index)
                break
            }
        }
    }
}
