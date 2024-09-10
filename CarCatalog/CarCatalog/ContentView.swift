//
//  ContentView.swift
//  CarCatalog
//
//  Created by Jongwook Park on 7/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(cars) { car in
                    VStack(alignment: .leading) {
                        // Car 타입의 내용으로 활용을 바로 진행 가능
                        Text(car.name)
                            .font(.headline)
                        Text("\(car.brand) \(car.door) 도어 \(car.seat) 시트")
                        
                        VStack(alignment: .leading) {
                            
                            // Car의 서브클래스 타입들로 활용하려면
                            // 구분을 해줘야한다
                            if car is GasCar {
                                Text("가솔린")
                                    .foregroundStyle(Color.gray)
                                Text("연비 \((car as! GasCar).gasMileage.formatted())km/l")
                            } else if car is ElectricCar {
                                Text("전기")
                                    .foregroundStyle(Color.blue)
                                Text("제로백 \((car as! ElectricCar).zeroback.formatted())초")
                            } else if car is HybridCar {
                                Text("하이브리드")
                                    .foregroundStyle(Color.green)
                                Text("제로백 \((car as! HybridCar).zeroback.formatted())초")
                            }
                        }
                        .font(.headline)
                        
                    }
                }
            }
            .navigationTitle("자동차")
        }
    }
}

#Preview {
    ContentView()
}
