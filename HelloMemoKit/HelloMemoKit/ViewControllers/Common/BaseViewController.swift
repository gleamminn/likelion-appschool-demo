//
//  BaseViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupInterface()
        setupLayout()
    }
    
    // addSubview 작업들...
    func setupInterface() { }
    
    // NSLayoutConstraint 설정 ...
    func setupLayout() {
        for subview in view.subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

#Preview {
    BaseViewController()
}
