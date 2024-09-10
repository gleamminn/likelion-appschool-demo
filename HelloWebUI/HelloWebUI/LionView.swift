//
//  LionView.swift
//  HelloWebUI
//
//  Created by Jongwook Park on 8/16/24.
//

import SwiftUI
import WebKit

struct LionView: View {
    @State private var webViewOpen: Int = 0
    @State private var webViewReady: Int = 0
    
    var body: some View {
        VStack {
            Text("모집중 \(webViewOpen)개")
                .padding()
            Text("사전알림신청 \(webViewReady)개")
                .padding()
            ScriptWebView(url: URL(string: "https://techit.education"), webViewOpen: $webViewOpen, webViewReady: $webViewReady)
        }
    }
}

struct ScriptWebView: UIViewRepresentable {
    
    let url: URL?
    @Binding var webViewOpen: Int
    @Binding var webViewReady: Int
    
    func makeUIView(context: Context) -> WKWebView {
        let webView: WKWebView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        if let url {
            webView.load(URLRequest(url: url))
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Update UI if needed
    }
    
    // WKNavigationDelegate 프로토콜 구현을 위해서는
    // Coordinator를 만들어 활용해야 한다
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: ScriptWebView
        
        init(_ parent: ScriptWebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish: WKNavigation!) {
            
            webView.evaluateJavaScript("""
                var text = document.body.innerText
                var occurrences = (text.match(/모집중/g) || [])
                occurrences.length
            """) { (result, error) in
                guard error == nil else {
                    return
                }
                
                print("result: \(String(describing: result))") // Optional(TECHIT BY LIKELION)
                
                if let count = result as? Int {
                    print(count)
                    self.parent.webViewOpen = count
                }
            }
            
            Task {
                do {
                    let readyCount = try await webView.evaluateJavaScript("""
                        var text = document.body.innerText
                        var occurrences = (text.match(/사전알림신청/g) || [])
                        occurrences.length
                    """)
                    if let count = readyCount as? Int {
                        print(count)
                        self.parent.webViewReady = count
                    }
                    
                } catch {
                    print("error")
                }
            }
        }
    }
}

#Preview {
    LionView()
}
