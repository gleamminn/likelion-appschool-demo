//
//  Models.swift
//  CarCatalog
//
//  Created by Jongwook Park on 7/8/24.
//

import Foundation

class Car: Identifiable {
    var id: UUID = UUID()
    
    var brand: String
    var name: String
    
    var seat: Int
    var door: Int
    
    init(brand: String, name: String, seat: Int, door: Int) {
        self.brand = brand
        self.name = name
        self.seat = seat
        self.door = door
    }
    
    func drive() {
        print("부릉부릉~")
    }
    
    func charge() {
        print("연료 주입중")
    }
}

class GasCar: Car {
    var gasMileage: Int
    
    init(brand: String, name: String, seat: Int, door: Int, gasMileage: Int) {
        self.gasMileage = gasMileage
        super.init(brand: brand, name: name, seat: seat, door: door)
    }
    
    override func charge() {
        print("기름을 넣고 있습니다")
    }
}

class ElectricCar: Car {
    var zeroback: Double
    
    init(brand: String, name: String, seat: Int, door: Int, zeroback: Double ) {
        self.zeroback = zeroback
        super.init(brand: brand, name: name, seat: seat, door: door)
    }
    
    override func drive() {
        print("윙~")
    }
    
    override func charge() {
        print("충전중")
    }
}

class HybridCar: Car {
    var gasMileage: Int
    var zeroback: Double
    
    init(brand: String, name: String, seat: Int, door: Int, gasMileage: Int, zeroback: Double ) {
        self.gasMileage = gasMileage
        self.zeroback = zeroback
        super.init(brand: brand, name: name, seat: seat, door: door)
    }
    
    override func drive() {
        print("윙~ 또는 부릉부릉")
    }
    
    override func charge() {
        print("전기 충전중 또는 기름 채우는 중")
    }
}
