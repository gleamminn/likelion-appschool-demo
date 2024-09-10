//
//  CalcModel.swift
//  CalcMVVM
//
//  Created by Jongwook Park on 7/24/24.
//

import Foundation

/*
 이번 MVVM에선 MVC로 만들었던 Model의 기능들을
 대부분 ViewModel에 떠넘겨보겠습니다.
 */
struct CalcModel {
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var result: String = ""
}
