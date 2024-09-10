//
//  WideWideViewController.swift
//  HelloScroll
//
//  Created by Jongwook Park on 8/19/24.
//

import UIKit

class WideWideViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        buildInterface()
    }
    
    func buildInterface() {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .cyan
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
        ])
        
        // 좌우로는 화면 폭을 그대로 쓰면서, 상하로만 스크롤 되도록 만들기
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2500)
        
        // 스크롤 뷰 안에 StackView 만들기
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        scrollView.addSubview(contentStackView)
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView에 Label 추가
        let label1 = UILabel()
        label1.text = "Hello World!"
        contentStackView.addArrangedSubview(label1)
        
        
        // 다시 작은 scrollView를 만들어서 StackView에 추가
        let miniScrollView = UIScrollView()
        miniScrollView.backgroundColor = .clear // 배경을 투명하게
        miniScrollView.contentSize = CGSize(width: 1024, height: 150)
//        miniScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 150)
        
        miniScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniScrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            miniScrollView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        contentStackView.addArrangedSubview(miniScrollView)
        
        // 작은 ScrollView 안에 이미지 추가하기
        
        for index in 0...6 {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "AppDev")
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 150 * index, y: 0, width: 150, height: 150)
            miniScrollView.addSubview(imageView)
            
            let button = UIButton()
            button.backgroundColor = .clear
            button.frame = CGRect(x: 150 * index, y: 0, width: 150, height: 150)
            button.addAction(UIAction { _ in
                print("\(index)가 선택되었습니다.")
            }, for: .touchUpInside)
            miniScrollView.addSubview(button)
        }
        
        
        // StackView에 Label 추가
        let label2 = UILabel()
        label2.text = "Hello World!"
        contentStackView.addArrangedSubview(label2)
    }
    
}

#Preview {
    WideWideViewController()
}
