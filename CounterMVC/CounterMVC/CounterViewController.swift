//
//  CounterViewController.swift
//  CounterMVC
//
//  Created by Jongwook Park on 7/24/24.
//

import UIKit

/*
 이 class는 MVC의 Controller 역할을 합니다
 */
class CounterViewController: UIViewController {
    
    /*
     MVC의 Model은...직접 만들어 프로퍼티로 선언!
     */
    var model: CounterModel = CounterModel()
    
    /*
     MVC의 View는...?
     UIViewController에서 상속받은 것으로 활용
     */
    // var view: UIView = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        displayCount()
    }
    
    /*
     Controller가 View에게 보일 내용을 정해준다
     */
    func displayCount() {
        /*
         IBOutlet으로 직접 연결해오지 않아도
         이미 Label은 이 ViewController의 View 안에
         특정한 tag 값으로 확인해서 꺼내쓸 수도 있다!
         */
        if let label = view.viewWithTag(1001) as? UILabel {
            label.text = "\(model.count)"
        }
    }

    /*
     View의 이벤트를 받아서 Controller가 처리한다
     */
    @IBAction func plusOne(_ sender: Any) {
        model.count += 1
        
        displayCount()
    }
    
}

