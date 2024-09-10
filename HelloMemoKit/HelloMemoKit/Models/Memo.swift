//
//  Memo.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

enum MemoEmoji: String, CaseIterable {
    case smile = "😊"
    case sad = "😢"
    case wink = "😉"
    case fun = "🤪"
    case lovely = "😍"
    
    static func getIndex(from emoji: MemoEmoji) -> Int {
        var index: Int = 0
        
        for memoEmoji in MemoEmoji.allCases {
            if memoEmoji == emoji {
                return index
            }
            
            index += 1
        }
        
        return 0
    }
}

struct Memo {
    var id: UUID = UUID()
    var text: String
    var createdAt: Date
    
    var color: UIColor = MemoColor.allCases.randomElement()?.uiColor ?? .clear
    var emoji: MemoEmoji = MemoEmoji.allCases.randomElement() ?? .smile
    var image: UIImage? = UIImage(named: "\((0...3).randomElement() ?? 0)")
    
    var createdAtString: String {
        createdAt.formatted(date: .numeric, time: .shortened)
    }
}
