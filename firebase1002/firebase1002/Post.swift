//
//  Post.swift
//  firebase1002
//
//  Created by 김수민 on 10/2/24.
//

import Foundation

struct Post: Identifiable, Codable {
    var id: String = UUID().uuidString
    var content: String
    var author: String
    var date: Date = Date()
    var heartCount: Int = 0
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
