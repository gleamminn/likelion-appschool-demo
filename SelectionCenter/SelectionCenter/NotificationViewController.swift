//
//  NotificationViewController.swift
//  SelectionCenter
//
//  Created by Jongwook Park on 7/31/24.
//

import UIKit

class CityManager: NSObject {
    // Singleton 인스턴스 생성
    static let shared: CityManager = CityManager()
    
    var year: Int = 0 {
        didSet {
            // year가 바뀌면 NotificationCenter를 통해
            // 여기저기 변경 사실을 알리자!
            NotificationCenter.default.post(name: .yearDidChange, object: nil, userInfo: ["year": year])
        }
    }
    
    var city: String {
        get {
            return switch year {
            case 2024:
                "Paris"
            case 2028:
                "LA"
            default:
                "(none)"
            }
        }
    }
}

extension Notification.Name {
    // 알려줄 이벤트의 이름 짓기
    static let yearDidChange = Notification.Name("yearDidChange")
}

class NotificationViewController: UIViewController {

    let manager: CityManager = CityManager.shared
    
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 화면에 나타나면 일단 최신 내용으로 보이게 만들자!
        updateLabel()
        
        // NotificationCenter에서 받는 특정 이벤트 처리 준비 시키기
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabel), name: .yearDidChange, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // NotificationCenter에서 받는 특정 이벤트 처리 준비 해제
        NotificationCenter.default.removeObserver(self)
        
        super.viewDidDisappear(animated)
    }
    
    @objc func updateLabel() {
        cityLabel.text = manager.city
    }
    
    @IBAction func select2024(_ sender: Any) {
        manager.year = 2024
    }
    
    @IBAction func select2028(_ sender: Any) {
        manager.year = 2028
    }
}
