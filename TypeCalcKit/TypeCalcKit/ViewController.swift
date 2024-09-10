//
//  ViewController.swift
//  TypeCalcKit
//
//  Created by Jongwook Park on 6/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var number1Field: UITextField!
    @IBOutlet weak var number2Field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func plus(_ sender: Any) {
        // 텍스트필드의 문자열을 가져오는 데 실패하면 빈 내용의 문자열이라고 생각하자
        let number1Text: String = number1Field.text ?? ""
        let number2Text: String = number2Field.text ?? ""
        
        // 가져온 문자열을 정수의 숫자 타입으로 변환하자. 실패하면 0
        let number1: Int = Int(number1Text) ?? 0
        let number2: Int = Int(number2Text) ?? 0
        
        let result: Int = number1 + number2
        
        print("\(result)")
        
        resultLabel.text = "\(result)"
    }
}

