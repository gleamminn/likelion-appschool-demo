//
//  BaseStackViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/21/24.
//

import UIKit

class BaseStackViewController: BaseViewController {
    
    public lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupInterface() {
        super.setupInterface()
        
        view.addSubview(stackView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        let margin: CGFloat = 8.5
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
            stackView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -1 * margin),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -1 * margin),
        ])
    }
}

#Preview {
    BaseStackViewController()
}
