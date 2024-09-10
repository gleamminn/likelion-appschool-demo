//
//  ContentView.swift
//  MultiplyQuizUI
//
//  Created by Jongwook Park on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var count: Int = 0
    
    @State var number1: Int = 0
    @State var number2: Int = 0
    @State var result: Int = 0
    @State var resultOk: Int = 0
    
    var body: some View {
        VStack {
            if count < 10 {
                Text("\(count + 1) / 10 진행")
                
                Text("\(number1) ✕ \(number2) = \(result)")
                    .padding()
                
                HStack {
                    Button("O") {
                        solveOk()
                    }
                    .padding()
                    
                    Button("X") {
                        solveWrong()
                    }
                    .padding()
                }
            } else {
                Text("맞춤 \(resultOk) : \(10 - resultOk)틀림")
                    .padding()
                
                Button("다시 시작") {
                    resetQuiz()
                }
                .padding()
            }
        }
        .padding()
        .font(.largeTitle)
        .onAppear(perform: {
            makeQuiz()
        })
    }
    
    func makeQuiz() {
        number1 = Int.random(in: 2...9)
        number2 = Int.random(in: 1...9)
        
        if Bool.random() {
            result = number1 * number2
        } else {
            repeat {
                result = Int.random(in: 2...81)
            } while result == number1 * number2
        }
    }
    
    func solveOk() {
        count += 1
        
        if number1 * number2 == result {
            resultOk += 1
        }
        
        makeQuiz()
    }
    
    func solveWrong() {
        count += 1
        
        if number1 * number2 != result {
            resultOk += 1
        }
        
        makeQuiz()
    }
    
    func resetQuiz() {
        count = 0
        resultOk = 0
        makeQuiz()
    }
}

#Preview {
    ContentView()
}
