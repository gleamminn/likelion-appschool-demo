//
//  NumberViewController.swift
//  CalcKVO
//
//  Created by Jongwook Park on 7/30/24.
//

import UIKit

class NumberViewController: UIViewController {

    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!

    // class로 만들어진 참조타입이라면
    // 이렇게 부르는 이름을 줄일 수 있다
    let model: NumberModel = NumberModel.shared
    
    // 메모리에 ViewConroller가 할당되어 데이터 자리가 잡혔을때
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 화면에 이 ViewConrollerd의 view가 나타나기 직전에 해줄 일
    // "혹시 KVO를 약간 대체 가능"?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateLabels()
        
        // 화면에 보여지기 전에 관찰을 시작하자
        model.addObserver(self, forKeyPath: #keyPath(NumberModel.firstNumber), options: [.new, .initial], context: nil)
        model.addObserver(self, forKeyPath: #keyPath(NumberModel.secondNumber), options: [.new, .initial], context: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        // 화면에 안보여지면 관찰을 끝내자
        model.removeObserver(self, forKeyPath: #keyPath(NumberModel.firstNumber))
        model.removeObserver(self, forKeyPath: #keyPath(NumberModel.secondNumber))
        
        super.viewDidDisappear(animated)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(NumberModel.firstNumber) {
            updateFirstNumberLabel()
        } else if keyPath == #keyPath(NumberModel.secondNumber) {
            updateSecondNumberLabel()
        }
    }
    
    func updateLabels() {
        updateFirstNumberLabel()
        updateSecondNumberLabel()
    }
    
    func updateFirstNumberLabel() {
        firstNumberLabel.text = "\(model.firstNumber)"
    }
    
    func updateSecondNumberLabel() {
        
        secondNumberLabel.text = "\(model.secondNumber)"
        
        // 1. 이렇게 작생해도 좋구요
        if model.secondNumber == 0 {
            messageLabel.text = "0으로는 나눗셈을 할 수 없습니다"
        } else {
            messageLabel.text = ""
        }
        
        // 2. 이런 방법도 있긴 해요
        messageLabel.text = model.secondNumber == 0 ? "0으로는 나눗셈을 할 수 없습니다" : ""
        
        // 3. 새로운 방법도 있어요
        messageLabel.text = if model.secondNumber == 0 {
                                "0으로는 나눗셈을 할 수 없습니다"
                            } else {
                                ""
                            }
    }
    
    @IBAction func increaseFirstNumber(_ sender: Any) {
        model.firstNumber += 1
    }
    
    @IBAction func decreaseFirstNumber(_ sender: Any) {
        model.firstNumber -= 1
    }
    
    @IBAction func increaseSecondNumber(_ sender: Any) {
        model.secondNumber += 1
    }
    
    @IBAction func decreaseSecondNumber(_ sender: Any) {
        model.secondNumber -= 1
    }
    
    
    
    
}
