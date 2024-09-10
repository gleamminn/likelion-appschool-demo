//
//  MemoNavigationController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/21/24.
//

import UIKit

class MemoNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigationBar.barTintColor = .memoThemeColor // 배경색
        navigationBar.tintColor = .memoThemeColor // 버튼 색상 (예, Back버튼)
    }
}
