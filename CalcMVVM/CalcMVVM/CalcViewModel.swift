//
//  CalcViewModel.swift
//  CalcMVVM
//
//  Created by Jongwook Park on 7/24/24.
//

import Foundation

class CalcViewModel: ObservableObject {
    @Published private(set) var model: CalcModel = CalcModel()
    
    var firstNumber: Int {
        get {
            model.firstNumber
        }
    }
    
    var secondNumber: Int {
        model.secondNumber
    }
    
    var result: String { model.result }
    
    func increaseFirstNumber() {
        model.firstNumber += 1
    }
    
    func decreaseFirstNumber() {
        model.firstNumber -= 1
    }
    
    func increaseSecondNumber() {
        model.secondNumber += 1
    }
    
    func decreaseSecondNumber() {
        model.secondNumber -= 1
    }
    
    func add() {
        model.result = "\(model.firstNumber + model.secondNumber)"
    }
}
