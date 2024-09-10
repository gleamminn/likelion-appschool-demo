//
//  NaverViewController.swift
//  HelloWebKit
//
//  Created by Jongwook Park on 8/16/24.
//

import UIKit
import WebKit

class NaverViewController: UIViewController, WKNavigationDelegate {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.text = "Hello"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.backward.fill"), for: .normal)
        
        // iOS 14버전부터 가능
        let action = UIAction(handler: { action in
            self.webView.goBack()
        })
        
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupInterface()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myURL = URL(string:"https://www.naver.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    func setupInterface() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(webView)
        stackView.addArrangedSubview(button)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 50),
            
            webView.widthAnchor.constraint(equalTo: safeLayoutGuide.widthAnchor),
            webView.heightAnchor.constraint(equalTo: safeLayoutGuide.heightAnchor, constant: -100),
            
            button.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.centerXAnchor.constraint(equalTo: safeLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeLayoutGuide.centerYAnchor),
        ])
    }
    
    
    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("로딩 완료")
        
        label.text = webView.title
        
        /*
        let script = """
            document.getElementsByTagName("title")[0].innerText
        """
        
        // 안타깝지만 await는 사용 불가
        // extension을 만들면 가능
        Task {
            do {
                let title: Any? = try await webView.asyncEvaluateJavaScript(script)
                
                if let title = title as? String {
                    label.text = title
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        */
    }
}

extension WKWebView {
    func asyncEvaluateJavaScript(_ script: String) async throws -> Any? {
        return try await withCheckedThrowingContinuation { continuation in
            self.evaluateJavaScript(script) { result, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: result)
                }
            }
        }
    }
}

#Preview {
    NaverViewController()
}
