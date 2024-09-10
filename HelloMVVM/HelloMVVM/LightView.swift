//
//  LightView.swift
//  HelloMVVM
//
//  Created by Jongwook Park on 7/23/24.
//

import SwiftUI

struct LightView: View {
    
    // View는 ViewModel을 관찰하겠다는 뜻으로
    // @ObervedObject 프로퍼티 래퍼를 붙여서
    // 프로퍼티로 선언한다
    // 또는 @StateObject도 있다
    
    @ObservedObject var viewModel: LightViewModel = LightViewModel()
    
    var lightStatus: String {
        return if viewModel.lightModel.isOn {
            "On"
        } else {
            "Off"
        }
    }
    
    var body: some View {
        VStack {
            Text(lightStatus)
                .padding()
            Button(action: {
                viewModel.toggleLight()
            }, label: {
                Text("on/off")
            })
        }
        .font(.largeTitle)
        .padding()
    }
}

#Preview {
    LightView()
}
