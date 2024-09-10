//
//  MemberViewController.swift
//  TouristKVO
//
//  Created by Jongwook Park on 7/30/24.
//

import UIKit

class MemberViewController: UIViewController {
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    let manager: TourManager = TourManager.shared
    
    // ViewController가 메모리에 로드 될때
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    // 화면에 보여지기 직전
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 관찰자 추가
        manager.addObserver(self, forKeyPath: #keyPath(TourManager.selectedMemberIndex), options: [.new, .initial], context: nil)
    }
    
    // 화면에서 사라진 직후
    override func viewDidDisappear(_ animated: Bool) {
        // 관찰자 제거
        manager.removeObserver(self, forKeyPath: #keyPath(TourManager.selectedMemberIndex))
        
        super.viewDidDisappear(animated)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == #keyPath(TourManager.selectedMemberIndex) {
            updateLabels()
        }
    }
    
    func updateLabels() {
        messageLabel.text = if manager.selectedMemberIndex < 0 {
            ""
        } else {
            "선택된 멤버는 \(manager.selectedMemberName)입니다."
        }
    }
    
    @IBAction func selectMember(_ sender: Any) {
        
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case 100...104: // 김승철
            manager.selectedMemberIndex = button.tag - 100
        default:
            break
        }
    }
    
}
