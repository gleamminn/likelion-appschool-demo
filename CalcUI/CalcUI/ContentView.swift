//
//  ContentView.swift
//  CalcUI
//
//  Created by Jongwook Park on 6/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var number1: Int = 0
    @State var number2: Int = 0
    @State var result: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Button("-") {
                    // - 버튼을 누르면 해야할 일들
                    number1 = number1 - 1
                }
                Spacer()
                Text("\(number1)")
                Spacer()
                Button("+") {
                    // + 버튼을 누르면 해야할 일들
                    number1 = number1 + 1
                }
            }
            .padding()
            
            HStack {
                Button("-") {
                    // - 버튼을 누르면 해야할 일들
                    number2 = number2 - 1
                }
                Spacer()
                Text("\(number2)")
                Spacer()
                Button("+") {
                    // + 버튼을 누르면 해야할 일들
                    number2 = number2 + 1
                }
            }
            .padding()
            
            Button("Plus") {
                // 덧셈을 누르면 해야 할 일
                result = number1 + number2
            }
            .padding()
            
            Text("\(result)")
                .padding()
        }
        .padding()
        .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
