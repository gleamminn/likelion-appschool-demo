//
//  ViewController.swift
//  HelloPlus
//
//  Created by Jongwook Park on 8/13/24.
//

import UIKit

class ViewController: UIViewController {

    // UIViewController는 매우 복잡해서
    // init 메서드를 재정의하기 어렵다
    /*
    override init(number: Int) {
        super.init()
    }
    */
    
    var count: Int = 0
    
    var number: Int = 0 {
        didSet {
            // 현재 ViewController가 NavigationController안에 있다면
            // 아래 제목 표시줄이 나타난다
            title = "plus \(number)"
        }
    }
    
    var themeColor: UIColor = .black
    
    // 위 number 프로퍼티의 didSet 처리로 밖에서 지정하게 하든
    // 아래 메서드로 지정하게 하든 상관은 없지만
    // 아래 메서드를 활용하면, 한번에 더 많은 파라미터 값들을 가져와
    // 설정도 가능하다
    /*
    public func setNumber(_ number: Int) {
        // 현재 ViewController가 NavigationController안에 있다면
        // 아래 제목 표시줄이 나타난다
        title = "plus \(number)"
    }
     */
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "\(count)"
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Plus \(number) ", for: .normal)
        button.backgroundColor = themeColor
        button.addTarget(self, action: #selector(plus), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Reset ", for: .normal)
        button.backgroundColor = themeColor
        button.addTarget(self, action: #selector(reset), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // systemBackground를 사용하면 Light/Dark 모드에 맞춰 배경생을 지정할 수 있다
        view.backgroundColor = .systemBackground
        
        setupInterface()
    }
    
    func setupInterface() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 25
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(plusButton)
        stackView.addArrangedSubview(resetButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    @objc func plus() {
        count += number
        label.text = "\(count)"
    }
    
    @objc func reset() {
        count = 0
        label.text = "\(count)"
    }
}

