//
//  ViewController.swift
//  MultiplyQuizKit
//
//  Created by Jongwook Park on 7/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var selectionButton1: UIButton!
    @IBOutlet weak var selectionButton2: UIButton!
    @IBOutlet weak var selectionButton3: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var number1: Int = 0
    var number2: Int = 0
    var selections: [Int] = [0, 0, 0]
    var resultOk: Int = 0
    var resultWrong: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeQuiz()
    }

    func makeQuiz() {
        number1 = Int.random(in: 2...9)
        number2 = Int.random(in: 1...9)
        
        let numberOk: Int = number1 * number2
        
        var numberWrong1: Int = 0
        var numberWrong2: Int = 0
        
        repeat {
            numberWrong1 = Int.random(in: 2...81)
            numberWrong2 = Int.random(in: 2...81)
        } while numberWrong1 == numberOk
            || numberWrong2 == numberOk
            || numberWrong1 == numberWrong2
        
        selections = [numberOk, numberWrong1, numberWrong2]
        selections.shuffle()
        
        questionLabel.text = "\(number1) ✕ \(number2)"
        selectionButton1.setTitle("\(selections[0])", for: .normal)
        selectionButton2.setTitle("\(selections[1])", for: .normal)
        selectionButton3.setTitle("\(selections[2])", for: .normal)
        resultLabel.text = "맞춤 \(resultOk) : \(resultWrong) 틀림"
    }
    
    func solveQuiz(selection: Int) {
        if number1 * number2 == selection {
            resultOk += 1
        } else {
            resultWrong += 1
        }
        
        makeQuiz()
    }
    
    @IBAction func selectButton1(_ sender: Any) {
        solveQuiz(selection: selections[0])
    }
    
    @IBAction func selectButton2(_ sender: Any) {
        solveQuiz(selection: selections[1])
    }
    
    @IBAction func selectButton3(_ sender: Any) {
        solveQuiz(selection: selections[2])
    }
}

