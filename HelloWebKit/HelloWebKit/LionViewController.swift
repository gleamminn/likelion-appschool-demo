//
//  LionViewController.swift
//  HelloWebKit
//
//  Created by Jongwook Park on 8/16/24.
//

import UIKit
import WebKit

class LionViewController: UIViewController, WKNavigationDelegate {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.text = "Hello"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupInterface()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myURL = URL(string:"https://www.likelion.net")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    func setupInterface() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(webView)
        stackView.addArrangedSubview(label)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            webView.widthAnchor.constraint(equalTo: safeLayoutGuide.widthAnchor),
            webView.heightAnchor.constraint(equalTo: safeLayoutGuide.heightAnchor, constant: -100),
            
            label.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.centerXAnchor.constraint(equalTo: safeLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeLayoutGuide.centerYAnchor),
        ])
    }
    
    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("로딩 완료")
        
        let script = """
            document.getElementsByTagName("title")[0].innerText
        """
        
        webView.evaluateJavaScript(script) { (result, error) in
            if let error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let title = result as? String {
                print("title: \(title)")
                
                self.label.text = title
            } else {
                print("Unexpected result: \(String(describing: result))")
            }
        }
    }
}

#Preview {
    LionViewController()
}
