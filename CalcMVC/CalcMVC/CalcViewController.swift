//
//  ViewController.swift
//  CalcMVC
//
//  Created by Jongwook Park on 7/24/24.
//

import UIKit

// MVC의 Controller 부분
class CalcViewController: UIViewController {

    // MVC의 Model 부분
    var model: CalcModel = CalcModel()
    
    // MVC의 View 부분
    // UIViewController에서 상속받은 view로 퉁치기
    // var view: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayModel()
    }

    func displayModel() {
        if let label = view.viewWithTag(101) as? UILabel {
            label.text = "\(model.firstNumber)"
        }
        
        if let label = view.viewWithTag(102) as? UILabel {
            label.text = "\(model.secondNumber)"
        }
    
        if let label = view.viewWithTag(103) as? UILabel {
            label.text = model.result
        }
    }
    
    @IBAction func upDownNumber(_ sender: Any) {
        guard let button = sender as? UIButton else {
            print("button은 UIButton 타입으로 변환 불가!")
            return
        }
        
        switch button.tag {
        case 201:
            model.increaseFirstNumber()
        case 202:
            model.decreaseFirstNumber()
        case 203:
            model.increaseSecondNumber()
        case 204:
            model.decreaseSecondNumber()
        default:
            break
        }
        
        displayModel()
    }
    
    @IBAction func add(_ sender: Any) {
        model.add()
        displayModel()
    }
    
}

