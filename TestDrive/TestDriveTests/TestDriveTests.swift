//
//  TestDriveTests.swift
//  TestDriveTests
//
//  Created by Jongwook Park on 8/5/24.
//

import XCTest
@testable import TestDrive

final class TestDriveTests: XCTestCase {
    
    func testAddTwoIntegers() {
        let myData: MyData = MyData()
        
        var result: Int = myData.addTwoNumbers(0, 0)
        XCTAssertEqual(result, 0)
        
        result = myData.addTwoNumbers(1, 2)
        XCTAssertEqual(result, 3)
    }
    
    func testAddTwoDoubles() {
        let myData: MyData = MyData()
        
        let result: Double = myData.addTwoNumbers(1.5, 2.3)
        XCTAssertEqual(result, 3.8)
    }
}
