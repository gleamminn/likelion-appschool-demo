//
//  ViewController.swift
//  CalcModelKit
//
//  Created by Jongwook Park on 6/14/24.
//

import UIKit

// 우리만의 계산기를 위한 새로운 타입을 만듭시다
class Calc {
    // 숫자 데이터 두 개를 포함시키는 계산기를 만들어 봅시다
    var number1: Int = 0
    var number2: Int = 0
    
    // 위 숫자 데이터 두 개를 덧셈한 결과를 외부에 다시 보내준다
    func add() -> Int {
        let result: Int = number1 + number2
        // print("add: \(result)")
        return result
    }
}

class ViewController: UIViewController {
    
    var myCalc: Calc = Calc()

    @IBOutlet weak var numberLabel1: UILabel!
    @IBOutlet weak var numberLabel2: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCalc.number1 = 0
        myCalc.number2 = 0
        
        numberLabel1.text = "\(myCalc.number1)"
        numberLabel2.text = "\(myCalc.number2)"
        resultLabel.text = "0"
    }

    @IBAction func addNumber1(_ sender: Any) {
        myCalc.number1 += 1
        numberLabel1.text = "\(myCalc.number1)"
    }
    
    @IBAction func subNumber1(_ sender: Any) {
        myCalc.number1 -= 1
        numberLabel1.text = "\(myCalc.number1)"
    }
    
    @IBAction func addNumber2(_ sender: Any) {
        myCalc.number2 += 1
        numberLabel2.text = "\(myCalc.number2)"
    }
    
    @IBAction func subNumber2(_ sender: Any) {
        myCalc.number2 -= 1
        numberLabel2.text = "\(myCalc.number2)"
    }
    
    @IBAction func add(_ sender: Any) {
        let result = myCalc.add()
        resultLabel.text = "\(result)"
    }
    
}

