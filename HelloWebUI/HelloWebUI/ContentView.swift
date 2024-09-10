//
//  ContentView.swift
//  HelloWebUI
//
//  Created by Jongwook Park on 8/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            PapagoView()
                .tabItem {
                    Label("Papago", systemImage: "bird.fill")
                }.tag(1)
            
            
            CatView()
                .tabItem {
                    Label("Cat", systemImage: "cat.fill")
                }.tag(2)
            
            LionView()
                .tabItem {
                    Label("Lion", systemImage: "laptopcomputer.and.iphone")
                }.tag(3)
        }
    }
}

#Preview {
    ContentView()
}
