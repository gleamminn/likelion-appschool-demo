//
//  ViewController.swift
//  Lotto
//
//  Created by Jongwook Park on 7/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var requestView: UITextView!
    @IBOutlet weak var resultView: UITextView!
    
    var requests: [[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestView.text = """
        로또 번호를 생성해드립니다.
        아래의 번호 생성 버튼을 눌러주세요.
        """
        
        resultView.text = """
        당첨 확인 결과를 보여드립니다.
        위의 당첨 확인 버튼을 눌러주세요.
        """
    }

    @IBAction func makeRequests(_ sender: Any) {
        requests = getRequests()
        
        requestView.text = "응모번호 모음:\n"
        
        for request in requests {
            // requestView.text += "\(request)\n"
            
            for reqeustNumber in request {
                requestView.text += "\(reqeustNumber)\t\t"
            }
            
            requestView.text += "\n\n"
        }
    }
    
    @IBAction func makeResult(_ sender: Any) {
        
        guard requests.count > 0 else {
            resultView.text = "번호부터 생성해주세요"
            return
        }
        
        let (results, bonus) = getResults()

        resultView.text = """
            당첨번호 : \(results)
            보너스번호 : \(bonus)\n
            """
        
        var isNone: Bool = true
        
        for request in requests {
            // 이 변수는 해당 for문이 한바퀴 돌면
            // 메모리에서 사라진다
            var count: Int = 0
            var isBonus: Bool = false
            
            for requestNumber in request {
                // print("응모번호 : \(requestNumber)")
                
                // 해당 응모번호가 당첨번호 안에 있는지 확인
                for resultNumber in results {
                    if requestNumber == resultNumber {
                        // print("같은 번호 확인! \(requestNumber)")
                        count += 1
                    }
                    
                    if requestNumber == bonus {
                        isBonus = true
                    }
                }
            }
            
            // print("\(count)개의 같은 번호 확인함")
            
            if count > 2 {
                if count == 6 {
                    resultView.text += "1등 \(request)\n"
                } else if count == 5 && isBonus {
                    resultView.text += "2등 \(request)\n"
                } else if count == 5 {
                    resultView.text += "3등 \(request)\n"
                } else if count == 4 {
                    resultView.text += "4등 \(request)\n"
                } else if count == 3 {
                    resultView.text += "5등 \(request)\n"
                }
                
                isNone = false
            }
        }
        
        if isNone {
            resultView.text += "우리가 함께 모은 복권기금, 한해 약 3조900억원! 한장의 복권이, 모두의 이로운 내일을 만들어갑니다."
        }
    }
}

