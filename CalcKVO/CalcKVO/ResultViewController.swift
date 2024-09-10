//
//  ResultViewController.swift
//  CalcKVO
//
//  Created by Jongwook Park on 7/30/24.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var plusResultLabel: UILabel!
    @IBOutlet weak var minusResultLabel: UILabel!
    @IBOutlet weak var multiplyResultLabel: UILabel!
    @IBOutlet weak var divideResultLabel: UILabel!
    
    let model: NumberModel = NumberModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 1회성 화면 업데이트라면
        // viewWillAppear에서 반영하는 것으로
        // KVO 활용 없이도 결과를 얻어낼 수도 있다.
        updateLabels()
    }
    
    func updateLabels() {
        plusResultLabel.text = model.plusNumbers
        minusResultLabel.text = model.minusNumbers
        multiplyResultLabel.text = model.multiplyNumbers
        divideResultLabel.text = model.divideNumbers
    }
    
}
