//
//  ViewController.swift
//  ClosureCalc
//
//  Created by Jongwook Park on 6/18/24.
//

import UIKit


class ViewController: UIViewController {
    
    var number1: Int = 0
    var number2: Int = 0
    var result: Int = 0
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    let add = { (num1: Int, num2: Int) -> Int in
        return num1 + num2
    }
    
    let sub = { (num1: Int, num2: Int) -> Int in
        return num1 - num2
    }
    
    
    func updateNumbers() {
        firstNumberLabel.text = "\(number1)"
        secondNumberLabel.text = "\(number2)"
        resultLabel.text = "\(result)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateNumbers()
    }
    
    
    @IBAction func decreseFirstNumber(_ sender: Any) {
        number1 -= 1
        updateNumbers()
    }
    
    @IBAction func increaseFirstNumber(_ sender: Any) {
        number1 += 1
        updateNumbers()
    }
    
    @IBAction func decreaseSecondNumber(_ sender: Any) {
        number2 -= 1
        updateNumbers()
    }
    
    @IBAction func increaseSecondNumber(_ sender: Any) {
        number2 += 1
        updateNumbers()
    }
    
    @IBAction func addTwoNumbers(_ sender: Any) {
        
        let work: (Int, Int) -> Int = add
        
        result = work(number1, number2)
        
        updateNumbers()
    }
    
}

