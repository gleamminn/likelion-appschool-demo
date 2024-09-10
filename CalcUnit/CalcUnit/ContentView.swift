//
//  ContentView.swift
//  CalcUnit
//
//  Created by Jongwook Park on 7/4/24.
//

import SwiftUI

struct ContentView: View {
    @State var origin: String = ""
    
    // 연산 프로퍼티! 앞으로 많이 애용해주세요!
    var length: Double {
        get {
            return Double(origin) ?? 0.0
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                TextField("cm길이를 입력하세요", text: $origin)
                Text("cm")
            }
            
            Text("\(showConverted(cm: length, converter: convertMm))")
            
            Text("\(showConverted(cm: length, converter: convertM))")
            
            Text("\(showConverted(cm: length, converter: convertKm))")
            
            Text("\(showConverted(cm: length, converter: convertInch))")
            
            Text("\(showConverted(cm: length, converter: convertFt))")
        }
        .padding()
        .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
