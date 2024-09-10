//
//  Converts.swift
//  CalcUnit
//
//  Created by Jongwook Park on 7/4/24.
//

import Foundation

func convertMm(cm: Double) -> (length: Double, unit: String) {
    return (cm * 10.0, "mm")
}

func convertM(cm: Double) -> (length: Double, unit: String) {
    return (cm / 100.0, "m")
}

func convertKm(cm: Double) -> (length: Double, unit: String) {
    return (cm / 100000.0, "km")
}

func convertInch(cm: Double) -> (length: Double, unit: String) {
    return (cm * 0.393701, "inch")
}

func convertFt(cm: Double) -> (length: Double, unit: String) {
    return (cm * 0.032808, "ft")
}

// 외부에선 궁국적으로 이 함수를 실행하도록 하자

func showConverted(cm: Double, converter: (Double) -> (Double, String)) -> String {
    let result = converter(cm)
    return "\(result.0) \(result.1)"
}

// 테스트를 위한 코드
/*
var length: Double = 1.0 // cm단위의 길이

print("\(length)cm")
print("\(convertMm(cm: length))mm")
print("\(convertM(cm: length))m")
print("\(convertKm(cm: length))km")
print("\(convertInch(cm: length))inch")
print("\(convertFt(cm: length))ft")

print(showConverted(cm: 100, converter: convertMm))
print(showConverted(cm: 10000, converter: convertKm))

print(showConverted(cm: 1, converter: { cm in
    (cm * 0.010936, "yd")
}))
*/
