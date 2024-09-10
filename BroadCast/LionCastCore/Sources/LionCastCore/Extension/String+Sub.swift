//
//  String+Sub.swift
//  LionCast
//
//  Created by Jongwook Park on 9/6/24.
//

import Foundation

extension String {
    
    func subStringBetween(_ startString: String, _ endString: String) -> String {

        if let firstOne = self.subStringsBetween(startString, endString).first {
            return firstOne
        }
        
        return ""
    }
    
    func subStringsBetween(_ startString: String, _ endString: String) -> [String] {
        var results = [String]()
            var searchRange = self.startIndex..<self.endIndex
            
            while let firstRange = self.range(of: startString, options: [], range: searchRange),
                  let secondRange = self.range(of: endString, options: [], range: firstRange.upperBound..<self.endIndex) {
                
                let substring = String(self[firstRange.upperBound..<secondRange.lowerBound])
                results.append(substring)
                
                // 다음 검색 범위를 갱신해 반복
                searchRange = secondRange.upperBound..<self.endIndex
            }
            
            return results
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
