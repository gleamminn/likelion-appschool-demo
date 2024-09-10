//
//  ContentView.swift
//  TestDrive
//
//  Created by Jongwook Park on 8/5/24.
//

import SwiftUI

struct ContentView: View {
    let myData: MyData = MyData()
    
    @State var result: Double = 0.0
    
    var body: some View {
        VStack {
            Text("\(result)")
                .padding()
            Button("Add") {
                result = myData.addTwoNumbers(3.14, 4.21)
            }
        }
        .font(.largeTitle)
        .padding()
    }
}

#Preview {
    ContentView()
}
