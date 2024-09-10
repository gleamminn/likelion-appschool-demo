//
//  CalcView.swift
//  CalcMVVM
//
//  Created by Jongwook Park on 7/24/24.
//

import SwiftUI

struct CalcView: View {
    @ObservedObject private var viewModel: CalcViewModel = CalcViewModel()
    
    var body: some View {
        VStack(spacing: 85.0) {
            HStack {
                Button("-") {
                    viewModel.decreaseFirstNumber()
                }
                Spacer()
                Text("\(viewModel.firstNumber)")
                Spacer()
                Button("+") {
                    viewModel.increaseFirstNumber()
                }
            }
            
            HStack {
                Button("-") {
                    viewModel.decreaseSecondNumber()
                }
                Spacer()
                Text("\(viewModel.secondNumber)")
                Spacer()
                Button("+") {
                    viewModel.increaseSecondNumber()
                }
            }
            
            Button("Add") {
                viewModel.add()
            }
            
            Text(viewModel.result)
        }
        .font(.largeTitle)
        .padding()
    }
}

#Preview {
    CalcView()
}
