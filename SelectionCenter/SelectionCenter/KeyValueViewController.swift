//
//  KeyValueViewController.swift
//  SelectionCenter
//
//  Created by Jongwook Park on 7/31/24.
//

import UIKit


class TutorManager: NSObject {
    // Singleton 인스턴스 생성
    static let manager: TutorManager = TutorManager()
    
    @objc dynamic var tutor: String = ""
}

class KeyValueViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    // Singleton 인스턴스 이름 짧게 부르기
    let manager: TutorManager = TutorManager.manager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.text = "Select a tutor!"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Singleton 인스턴스 특정 KeyPath 내용 변화에 관심 두기
        manager.addObserver(self, forKeyPath: #keyPath(TutorManager.tutor), context: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        // Singleton 인스턴스 특정 KeyPath 내용 변화에 관심 끄기
        manager.removeObserver(self, forKeyPath: #keyPath(TutorManager.tutor))
        
        super.viewDidDisappear(animated)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        // 변화된 내용이 관심 두던 것이라면 화면 업데이트
        if keyPath == #keyPath(TutorManager.tutor) {
            updateTutorLabel()
        }
    }
    
    func updateTutorLabel() {
        messageLabel.text = "Hello \(manager.tutor)!"
    }
    
    @IBAction func selectNed(_ sender: Any) {
        // Singleton 인스턴스 데이터 바꾸기
        manager.tutor = "Ned"
    }
    
    @IBAction func selectTuna(_ sender: Any) {
        // Singleton 인스턴스 데이터 바꾸기
        manager.tutor = "Tuna"
    }
}
