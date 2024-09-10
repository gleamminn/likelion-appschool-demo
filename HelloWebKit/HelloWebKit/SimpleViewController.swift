//
//  SimpleViewController.swift
//  HelloWebKit
//
//  Created by Jongwook Park on 8/16/24.
//

import UIKit
import WebKit

class SimpleViewController: UIViewController, WKNavigationDelegate {

    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupInterface()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        webView.loadHTMLString("""
        <html>
        <head>
            <title>Hello World</title>
        </head>
        <body>
            <h1>Hello World</h1>
        </body>
        </html>
        """, baseURL: nil)
    }
    
    func setupInterface() {
        view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            webView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            webView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            webView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
        ])
    }

    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("웹 페이지 다 읽었음")
        
        let script: String = """
            document.body.style.backgroundColor = 'yellow'
        """
        
        // JS 코드 단순히 실행만 시키기
        webView.evaluateJavaScript(script)
    }
}

#Preview {
    SimpleViewController()
}
