//
//  ContentView.swift
//  CounterPhone
//
//  Created by Jongwook Park on 9/9/24.
//

import SwiftUI
import CounterCore

struct ContentView: View {
    var counter = Counter()
    
    var body: some View {
        VStack(spacing: 35) {
            Spacer()
            
            Text("\(counter.count)")
                .font(.system(size: 120))
            
            Spacer()
            
            Button {
                counter.increase()
            } label: {
                Label("incease", systemImage: "plus.app")
            }
            
            Button {
                counter.decrease()
            } label: {
                Label("decrease", systemImage: "minus.square")
            }
            
            Button {
                counter.reset()
            } label: {
                Label("reset", systemImage: "0.square")
            }

        }
        .font(.largeTitle)
        .padding()
    }
}

#Preview {
    ContentView()
}
