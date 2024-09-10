//
//  CounterViewModel.swift
//  CounterMVVM
//
//  Created by Jongwook Park on 7/24/24.
//

import Foundation

/*
 이 ViewModel은 ObservableObject 프로토콜에 따라서
 내용에 변경이 생기면 관찰자에게 알려줄 준비를 한다.
 */
class CounterViewModel: ObservableObject {
    
    /*
     View는 ViewModel 안에 있는 Model을 get으로 확인해 값을 꺼내 볼수는 있지만
     직접 새로운 값을 할당시켜 덮어쓰기 업데이트는 못한다.
     
     @Published 프로퍼티 래퍼를 활용해, 이 프로퍼티 값에 변화가 생기면
     관찰자에게 알리는 이벤트가 생긴다!
     */
    @Published private(set) var model: CounterModel = CounterModel()
    
    /*
     아니면 위 model 프로퍼티를 전체적으로 get/ set 모두 private로 만들고
     다음의 연산 프로퍼티로 간접 접근해서 get 처리하는 것도 괜찮다
     */
    var count: Int {
        get {
            return model.count
        }
    }
    
    /*
     View는 ViewModel의 메서드를 통해서
     간접적인 방법으로 Model을 접근해야한다
     */
    func plusOne() {
        model.count += 1
    }
}
