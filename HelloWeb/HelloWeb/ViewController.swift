//
//  ViewController.swift
//  HelloWeb
//
//  Created by Jongwook Park on 7/12/24.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.navigationDelegate = self
    }

    @IBAction func goTechit(_ sender: Any) {
        let urlString: String = "https://techit.education"
        if let url: URL = URL(string: urlString) {
            let urlRequest: URLRequest = URLRequest(url: url)
            
            myWebView.load(urlRequest)
        }
    }
    
    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("읽기 시작")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("읽어오기 완료")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
        print("\(error.localizedDescription)")
    }
}

