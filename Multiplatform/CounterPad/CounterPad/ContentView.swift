//
//  ContentView.swift
//  CounterPad
//
//  Created by Jongwook Park on 9/9/24.
//

import SwiftUI
import CounterCore

struct ContentView: View {
    var counter = Counter()
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(counter.count)")
                .font(.system(size: 250))
            Spacer()

            HStack(spacing: 34) {
                Button {
                    counter.increase()
                } label: {
                    Label("increase", systemImage: "plus.app")
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
            
            Spacer()
        }
        .font(.largeTitle)
        .padding()
    }
}

#Preview {
    ContentView()
}
