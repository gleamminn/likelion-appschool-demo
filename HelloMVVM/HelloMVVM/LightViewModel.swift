//
//  LigthViewModel.swift
//  HelloMVVM
//
//  Created by Jongwook Park on 7/23/24.
//

import Foundation

// ViewModel이 관찰이 가능한 대상임을 알리기 위해
// ObservableObject 프로토콜을 따르자!

class LightViewModel: ObservableObject {
    
    // 이 모델 프로퍼티가 바뀌면 관찰자에게 알리겠다는 표시로
    // @Published 프로퍼티 래퍼를 붙인다
    
    @Published var lightModel: LightModel = LightModel()
    
    // ViewModel을 통해
    // Model을 간접적으로 접근하도록
    // 메서드 만들기
    
    func toggleLight() {
        lightModel.isOn.toggle()
    }
}
