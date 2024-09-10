//
//  CatView.swift
//  HelloWebUI
//
//  Created by Jongwook Park on 8/16/24.
//

import SwiftUI
import WebKit

struct CatView: View {
    @State private var title: String = "hello"
    
    var body: some View {
        VStack {
            Text(title)
                .padding()
            WebView(address: "https://www.nyan.cat/", title: $title)
        }
        
    }
}

// UIView를 View처럼 가져와 사용하려면
// UIViewRepresentable 프로토콜을 따라야한다
struct WebView: UIViewRepresentable {
    var address: String
    
    @Binding var title: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        let url = URL(string: address)!
        let request = URLRequest(url: url)
        webView.load(request)
        
        return webView
    }
    
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // 업데이트는 따로 대응할 일 지금 없음
    }
    
    // WKNavigationDelegate 프로토콜 구현을 위해서는
    // Coordinator를 만들어 활용해야 한다
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            Task {
                do {
                    let title = try await webView.evaluateJavaScript("""
                        document.getElementsByTagName("title")[0].innerText
                    """)
                    
                    if let title = title as? String {
                        print("HTML Title: \(title)")
                        
                        parent.title = title
                    } else {
                        print("Title not found or unexpected result.")
                    }
                } catch {
                    
                }
            }
        }
        
        
    }
}


#Preview {
    CatView()
}
