//
//  Data.swift
//  CarCatalog
//
//  Created by Jongwook Park on 7/8/24.
//

import Foundation

let gasCars: [GasCar] = [
    GasCar(brand: "제네시스", name: "G80", seat: 4, door: 4, gasMileage: 9),
    GasCar(brand: "현대자동차", name: "캐스퍼", seat: 4, door: 4, gasMileage: 13),
    GasCar(brand: "기아자동차", name: "K5", seat: 4, door: 4, gasMileage: 9)
]

let elecricCars: [ElectricCar] = [
    ElectricCar(brand: "테슬라", name: "모델3", seat: 4, door: 4, zeroback: 6.1),
    ElectricCar(brand: "쉐보레", name: "볼트EV", seat: 4, door: 4, zeroback: 7),
]

let hybridCars: [HybridCar] = [
    HybridCar(brand: "도요타", name: "프리우스", seat: 4, door: 2, gasMileage: 20, zeroback: 7.6)
]

// 신기하게도 이게 됩니다!!

let cars: [Car] = [
    GasCar(brand: "제네시스", name: "G80", seat: 4, door: 4, gasMileage: 9),
    GasCar(brand: "현대자동차", name: "캐스퍼", seat: 4, door: 4, gasMileage: 13),
    GasCar(brand: "기아자동차", name: "K5", seat: 4, door: 4, gasMileage: 9),
    ElectricCar(brand: "테슬라", name: "모델3", seat: 4, door: 4, zeroback: 6.1),
    ElectricCar(brand: "쉐보레", name: "볼트EV", seat: 4, door: 4, zeroback: 7),
    HybridCar(brand: "도요타", name: "프리우스", seat: 4, door: 2, gasMileage: 20, zeroback: 7.6)
]

