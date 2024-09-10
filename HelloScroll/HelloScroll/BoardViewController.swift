//
//  ViewController.swift
//  HelloScroll
//
//  Created by Jongwook Park on 8/19/24.
//

import UIKit

class BoardViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemMint
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupInterface()
    }

    func setupInterface() {
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeGuide: UILayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: safeGuide.centerYAnchor),
            
            scrollView.widthAnchor.constraint(equalTo: safeGuide.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: safeGuide.heightAnchor),
        ])
        
        // ScrollView가 가진 content의 크기를 정한다
        // scrollView의 너비보다 conentSize의 너비가 크면, 좌우 스크롤이 가능
        // scrollView의 높보다 conentSize의 높이가 크면, 상하 스크롤이 가능
        scrollView.contentSize = CGSize(width: 1024, height: 1024)
        
        // scrollView 안에 내용 추가
        let label = UILabel()
        label.text = "Hello World!"
        label.textAlignment = .center
        label.backgroundColor = .magenta
        label.frame = CGRect(x: 50, y: 100, width: 160, height: 300)
        scrollView.addSubview(label)
        
        let label2 = UILabel()
        label2.text = "Hello World!"
        label2.textAlignment = .center
        label2.backgroundColor = .orange
        label2.frame = CGRect(x: 200, y: 550, width: 150, height: 300)
        scrollView.addSubview(label2)
        
        let label3 = UILabel()
        label3.text = "Hello World!"
        label3.textAlignment = .center
        label3.backgroundColor = .purple
        label3.frame = CGRect(x: 350, y: 100, width: 160, height: 300)
        scrollView.addSubview(label3)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppDev")
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 130, y: 300, width: 300, height: 300)
        scrollView.addSubview(imageView)
        
        // 현재 보여질 내용의 위치를 지정
        scrollView.contentOffset = CGPoint(x: 80, y: 70)
    }
}

#Preview {
    BoardViewController()
}
