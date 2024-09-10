//
//  HistoryViewController.swift
//  MemberCenter
//
//  Created by Jongwook Park on 8/1/24.
//

import UIKit

class HistoryViewController: UIViewController {

    let authHistoryModel: AuthHistoryModel = AuthHistoryModel.shared
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateLabel()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabel), name: .updateHistory, object: nil)
    }
    
    @objc func updateLabel() {
        messageLabel.text = "\(authHistoryModel.logs.count)개의 기록이 있습니다"
    }
    
    @IBAction func clearHistory(_ sender: Any) {
        authHistoryModel.clear()
    }
    
}
