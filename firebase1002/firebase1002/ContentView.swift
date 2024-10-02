//
//  ContentView.swift
//  firebase1002
//
//  Created by 김수민 on 10/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("사용자 이름", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                NavigationLink(destination: PostListView(username: username), isActive: $isLoggedIn) {
                    Button("게시판 보기") {
                        if !username.isEmpty {
                            isLoggedIn = true
                        }
                    }
                    .padding()
                    .disabled(username.isEmpty)
                }
            }
            .navigationTitle("사용자 이름 입력")
        }
    }
}

#Preview {
    ContentView()
}
