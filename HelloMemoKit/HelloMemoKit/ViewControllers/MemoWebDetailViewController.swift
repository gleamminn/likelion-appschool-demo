//
//  MemoWebDetailViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/21/24.
//

import UIKit
import WebKit

class MemoWebDetailViewController: BaseViewController {
    
    var memo: Memo? // = Memo(text: "Hello World", createdAt: Date())
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        
        // 영역확인을 위해 테두리를 둘러보는 것도 좋다
        webView.layer.borderWidth = 1.0
        webView.layer.borderColor = UIColor.lightGray.cgColor
        
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Memo Detail"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        webView.loadHTMLString("""
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
        </head>
        <body>
            <h1>\(memo?.text ?? "")</h1>
            <h2>\(memo?.createdAtString ?? "")</h2>
        </body>
        </html>
        """, baseURL: nil)
    }
    
    override func setupInterface() {
        super.setupInterface()
        
        view.addSubview(webView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 10),
            webView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -10)
        ])
    }
}

#Preview {
    MemoWebDetailViewController()
}
