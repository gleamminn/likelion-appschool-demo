//
//  StickerStore.swift
//  Stickers
//
//  Created by Jongwook Park on 2/6/24.
//

import Foundation
import Observation
import SwiftUI
import FirebaseCore
import FirebaseFirestore

@Observable
class StickerStore {
    var stickers: [Sticker] = []
    
    // 날짜와 시간에 의해 정렬을 시킨 배열 만들어주는 연산 프로퍼티
    var stickersDataSorted: [Sticker] {
        get {
            stickers.sorted {
                $0.date > $1.date
            }
        }
    }
    
    // Preview에서 활용할 수 있는 샘플 스티커 만들기 연산 프로퍼티
    static var sampleSticker: Sticker {
        Sticker(memo: "Hello World", colorIndex: 0)
    }
    
    init() {
        // 테스트를 위한 준비 코드
        /*
        stickers = [
            Sticker(memo: "Hello World"),
            Sticker(memo: "Good morning"),
            Sticker(memo: """
                    동해물과 백두산이 마르고 닳도록
                    하느님이 보우하사 우리나라 만세
                    무궁화 삼천리 화려강산
                    대한사람 대한으로 길이 보전하세
                    """),
            Sticker(memo: "튜나마요김밥은 과학이자 진리입니다"),
        ]
        */
    }
    
    private func loadStickers() async {
        // Firebase의 Cloud Firestore에서 읽기
        do {
            let db = Firestore.firestore()
            let snapshots = try await db.collection("Stickers").getDocuments()
            
            var savedStickers: [Sticker] = []
            
            for document in snapshots.documents {
                let id: String = document.documentID
                
                let docData = document.data()
                let memo: String = docData["memo"] as? String ?? ""
                let colorIndex: Int = docData["colorIndex"] as? Int ?? 0
                
                let sticker: Sticker = Sticker(id: id, memo: memo, colorIndex: colorIndex)
                savedStickers.append(sticker)
            }
            
            stickers = savedStickers
            
        } catch {
            print("Error getting documents: \(error)")
        }
    }
    
    func fetchStickers() async {
        await loadStickers()
    }
    
    func addSticker(memo: String, color: Color) {
        guard !memo.isEmpty else {
            return
        }
        
        let colorIndex: Int = Sticker.getColorIndex(color: color)

        let sticker = Sticker(memo: memo, colorIndex: colorIndex)
        stickers.append(sticker)
        
        // Firebase의 Cloud Firestore에 새로운 스티커 메모 추가
        Task {
            do {
                let db = Firestore.firestore()
                try await db.collection("Stickers").document("\(sticker.id)").setData([
                    "memo": sticker.memo,
                    "colorIndex": sticker.colorIndex
                  ])
                
                print("Document successfully written!")
            } catch {
                print("Error writing document: \(error)")
            }
        }
    }
    
    func updateSticker(_ sticker: Sticker) {
        // Firebase의 Cloud Firestore에 새로운 스티커 메모 업데이트
        Task {
            do {
                let db = Firestore.firestore()
                try await db.collection("Stickers").document("\(sticker.id)").setData([
                    "memo": sticker.memo,
                    "colorIndex": sticker.colorIndex
                  ])
                
                print("Document successfully written!")
            } catch {
                print("Error writing document: \(error)")
            }
        }
        
        removeSticker(sticker)
        stickers.append(sticker)
    }
    
    func removeSticker(_ sticker: Sticker) {
        // Firebase의 Cloud Firestore에 새로운 스티커 메모 삭제
        Task {
            do {
                let db = Firestore.firestore()
                try await db.collection("Stickers").document("\(sticker.id)").delete()
                print("Document successfully removed!")
            } catch {
                print("Error writing document: \(error)")
            }
        }
        
        var index: Int = 0
        
        for tempSticker in stickers {
            
            if tempSticker.id == sticker.id {
                stickers.remove(at: index)
                break
            }
            
            index += 1
        }
    }
}
