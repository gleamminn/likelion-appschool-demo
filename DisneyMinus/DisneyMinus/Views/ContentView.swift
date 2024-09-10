//
//  ContentView.swift
//  DisneyMinus
//
//  Created by Jongwook Park on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    
    // 최근에 열어본 탭을
    // 앱을 재구동해도 계속 보여주게 한다
    @AppStorage("tabIndex") var tabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $tabIndex) {
            NavigationStack {
                MovieView()
            }
            .tabItem {
                Label("Movie", systemImage: "popcorn")
            }
            .tag(0)
            
            NavigationStack {
                SeriesView()
            }
            .tabItem {
                Label("Series", systemImage: "play.tv")
            }
            .tag(1)
            
            NavigationStack {
                ShowView()
            }
            .tabItem {
                Label("Show", systemImage: "music.note.tv")
            }
            .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
