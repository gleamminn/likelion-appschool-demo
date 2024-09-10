//
//  HistoryViewController.swift
//  LoginCenter
//
//  Created by Jongwook Park on 7/31/24.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var historyLabel: UILabel!
    
    let model: AuthHistoryModel = AuthHistoryModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabel), name: .clearHistory, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        
        super.viewDidDisappear(animated)
    }
    
    @objc func updateLabel() {
        
        if let username: String = model.username {
            let description: String = if model.isLogin {
                "님이 로그인했습니다"
            } else {
                "님이 로그아웃했습니다"
            }
            historyLabel.text = "\(username) \(description)"
        } else {
            historyLabel.text = "기록이 없습니다"
        }
    }
    
    @IBAction func clearHistory(_ sender: Any) {
        model.clear()
        
    }
    
}
