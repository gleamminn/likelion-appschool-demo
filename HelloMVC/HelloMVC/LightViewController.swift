//
//  ViewController.swift
//  HelloMVC
//
//  Created by Jongwook Park on 7/23/24.
//

import UIKit

class LightViewController: UIViewController {

    // ViewController에는 이미 view 프로퍼티가 있다
    // let view: UIView
    
    // ViewController가 제어할 Model을 프로퍼티로 만들어보자
    var lightModel: LightModel = LightModel()
    
    @IBOutlet weak var lightStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayModel()
    }

    func displayModel() {
        lightStatusLabel.text = if lightModel.isOn {
                                    "On"
                                } else {
                                    "Off"
                                }
    }
    
    @IBAction func toggleLight(_ sender: Any) {
        // MVC 패턴에서는
        // Model에 영향을 주는 것도 Controller의 역할이고
        lightModel.isOn.toggle()
        
        // View에 영향을 주는 것 역시 Controller의 역할이다
        displayModel()
        
        // 그래서 MVC 패턴에서는
        // ViewController가 계속 할 일이 많아지고
        // 코드도 길어진다.
    }
    
}

