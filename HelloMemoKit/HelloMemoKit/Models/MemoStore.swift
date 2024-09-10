//
//  MemoStore.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

final class MemoStore {
    // Singleton 인스턴스
    public static let shared = MemoStore()
    
    private var originMemoList: [Memo] = []
    
    public var queryString: String = ""
    
    public var memoList: [Memo] {
        get {
            if queryString.isEmpty {
                originMemoList
                    .sorted { $0.createdAt > $1.createdAt }
            } else {
                originMemoList
                    .filter { $0.text.contains(queryString) }
                    .sorted { $0.createdAt > $1.createdAt }
            }
        }
    }
    
    
    init() {
        // 아래 내용은 시뮬레이터 같은 디버깅 모드일 때만 적용된다. (다른 모드는 Release모드)
        #if DEBUG
        originMemoList = [
            Memo(text: "Hello World", createdAt: Date()),
            Memo(text: "Good morning", createdAt: Date()),
            Memo(text: "가는말이 고우면 얕본다", createdAt: Date()),
            Memo(text: "세번 참으면 호구된다", createdAt: Date()),
            Memo(text: "어려운 길은 길이 아니다", createdAt: Date()),
            Memo(text: "잘생긴 놈은 얼굴 값하고 못생긴 놈은 꼴값한다", createdAt: Date()),
            Memo(text: "늦었다고 생각할때가 늦은거다 그러니 지금당장 시작해라", createdAt: Date()),
            Memo(text: "지금 공부 안하면 더울때 더운데서 일하고 추울때 추운데서 일한다", createdAt: Date()),
            Memo(text: "고생 끝에 골병난다", createdAt: Date()),
            Memo(text: "포기하면 편하다", createdAt: Date()),
            Memo(text: "성공은 1%재능과 99% 빽이다", createdAt: Date()),
            Memo(text: "새벽에 먹는 맥주와 치킨은 0칼로리다", createdAt: Date()),
            Memo(text: "하나를 보고 열을 알면 무당", createdAt: Date()),
            Memo(text: "시작은 반이다가아니라 시작은 시작일 뿐 ", createdAt: Date()),
            Memo(text: "헌신하면 헌신짝된다", createdAt: Date()),
            Memo(text: "내일도 할 수 있는 일을 굳이 오늘 할 필요가 없다", createdAt: Date()),
            Memo(text: "일찍 일어나는 새가 피곤하다", createdAt: Date()),
            Memo(text: "즐길수 없으면 피해라", createdAt: Date()),
            Memo(text: "내 너 그럴줄 알았다- 알았으면 제발 미리 말을 해줘라", createdAt: Date()),
            Memo(text: "세상은 넓고 할일은 많지 않다", createdAt: Date()),
            Memo(text: "살빼고 싶으면 줄넘기를 해서 뛰든지 운동을 해라 운동이 싫으면 바지치수 큰 거를 사입든지 해라", createdAt: Date()),
            Memo(text: "내일도 할 수 있는 일을 굳이 오늘 할 필요가 없다", createdAt: Date()),
            Memo(text: "오는 건 순서 있어도 가는 건 순서 없다", createdAt: Date()),
            Memo(text: "죽음과 결혼은 뒤로 미룰수록 좋다", createdAt: Date()),
            Memo(text: "내 아버지를 욕하는 건 참을 수 있어도, 날 욕하는 건 참을 수 없다", createdAt: Date()),
            Memo(text: "많이 사랑을 안 했으니 프로그램이 없어지는 거에요. 많이 사랑해 줬으면 왜 없어집니까?", createdAt: Date()),
            Memo(text: "안되는 놈은 뭘 해도 안됩니다", createdAt: Date()),
            Memo(text: "돈 드는 거 하지 마라", createdAt: Date()),
            Memo(text: "돈 벌려고 일하는데 돈을 거꾸로 가져가...", createdAt: Date()),
            Memo(text: "타고나야 돼. 백날 해봤자", createdAt: Date()),
            Memo(text: "꿈은 없고요 그냥 놀고 싶습니다", createdAt: Date()),
            Memo(text: "열심히 일해서 그걸로 먹고 살란 말이야", createdAt: Date()),
            Memo(text: "숨을 쉰다고 다 살아 있는 게 아니야", createdAt: Date()),
            Memo(text: "사람이 배고파야 뭐가 나온다", createdAt: Date()),
            Memo(text: "예술은 비싸고 인생은 더럽다", createdAt: Date()),
            Memo(text: "일찍 일어난 벌레는 잡아먹힙니다", createdAt: Date()),
            Memo(text: "시작은 미진할지언정 다만 사라질 뿐이다", createdAt: Date()),
            Memo(text: "빨리 달궈진 쇠가 매우 뜨겁다", createdAt: Date()),
            Memo(text: "외계인은 외계에서 1등이다", createdAt: Date()),
            Memo(text: "백문이 불효", createdAt: Date()),
            Memo(text: "early bird가 very tired 하다.(일찍 일어난 새가 피곤하다)", createdAt: Date()),
        ]
        #endif
    }
    
    public func memoForId(_ id: UUID) -> Memo? {
        for memo in memoList {
            if memo.id == id {
                return memo
            }
        }
        
        return nil
    }
    
    public func addMemo(_ text: String, emoji: MemoEmoji, color: UIColor) {
        var memo = Memo(text: text, createdAt: Date())
        memo.emoji = emoji
        memo.color = color
        originMemoList.append(memo)
    }
    
    public func updateMemo(_ memo: Memo) {
        var memo = memo // shadow copy
        
        removeMemo(memo)
        memo.createdAt = Date()
        originMemoList.append(memo)
    }
    
    public func removeMemo(_ memo: Memo) {
        originMemoList = originMemoList.filter { $0.id != memo.id }
    }
}
