//
//  ContentView.swift
//  TypeCalcUI
//
//  Created by Jongwook Park on 6/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstNumberField: String = ""
    @State var secondNumberField: String = ""
    
    @State var resultText: String = "결과"
    
    var body: some View {
        VStack {
            TextField("첫번째 숫자", text: $firstNumberField)
                .keyboardType(.numberPad)
                .padding()
            
            TextField("두번째 숫자", text: $secondNumberField)
                .keyboardType(.numberPad)
                .padding()
            
            Button(action: {
                // 버튼이 눌렸을 때 처리할 Swift 코드
                
                print("덧셈")
                
                let firstNumber: Int = Int(firstNumberField) ?? 0
                let seconNumber: Int = Int(secondNumberField) ?? 0
                
                let resultNumber: Int = firstNumber + seconNumber
                resultText = String(resultNumber)
                
                
            }, label: {
                // 버튼으로 타나날 내용 - SwiftUI 코드
                Label("덧셈", systemImage: "plus.square")
            })
            .padding()
            
            Text("\(resultText)")
                .padding()
        }
        .font(.largeTitle)
        .padding()
    }
}

#Preview {
    ContentView()
}
