//
//  ContentView.swift
//  HelloWebUI
//
//  Created by Jongwook Park on 8/16/24.
//

import SwiftUI
import SafariServices

struct PapagoView: View {
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        VStack {
            Button("Open Papago") {
                isShowingSheet.toggle()
            }
        }
        .sheet(isPresented: $isShowingSheet, content: {
            SafariView(address: "https://papago.naver.com/?sk=ko&tk=en")
                .edgesIgnoringSafeArea(.all)
        })
    }
}

// UIViewController를 View처럼 가져와 사용하려면
// UIViewControllerRepresentable 프로토콜을 따라야한다
struct SafariView: UIViewControllerRepresentable {
    var address: String
    
    // 어떤 UIViewController 계열을 가져와서 SwiftUI의 View로 만들지 결정
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let url = URL(string: address)!
        let viewController = SFSafariViewController(url: url)
        
        return viewController
    }
    
    // 화면에 업데이트 상황이 발생하면 대응해줄 코드
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // 현재는 따로 해줄 일이 없음
    }
    
}

#Preview {
    PapagoView()
}
