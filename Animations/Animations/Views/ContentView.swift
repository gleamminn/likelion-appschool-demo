//
//  ContentView.swift
//  Animations
//
//  Created by Jongwook Park on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                PororoView()
            }
            .tabItem {
                Label("뽀롱뽀롱 뽀로로", systemImage: "teddybear.fill")
            }
            
            NavigationStack {
                TayoView()
            }
            .tabItem {
                Label("꼬마버스 타요", systemImage: "bus.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}
