//
//  TourManager.swift
//  TouristKVO
//
//  Created by Jongwook Park on 7/30/24.
//

import Foundation

class TourManager: NSObject {
    
    // Singleton 패턴 인스턴스 생성
    static let shared: TourManager = TourManager()
    
    @objc dynamic var selectedMemberIndex: Int = -1
    
    var tours: [Tour] = []
    
    var selectedTour: Tour {
        get {
            return tours[selectedMemberIndex]
        }
    }
    
    var selectedMemberName: String {
        return selectedTour.memberName
    }
    
    override init() {
        tours.append(Tour(memberName: "김승철", nation: "호주", flag: "🇦🇺", capital: "캔버라", greeting: "hi"))
        tours.append(Tour(memberName: "박준영1", nation: "독일", flag: "🇩🇪" , capital: "베를린", greeting: "Hallo!"))
        tours.append(Tour(memberName: "박준영2", nation: "호주", flag: "🇦🇺", capital: "캔버라", greeting: "G Day"))
        tours.append(Tour(memberName: "심현정", nation: "스웨덴", flag: "🇸🇪", capital: "스톡홀름", greeting: "Hej"))
        tours.append(Tour(memberName: "이다영", nation: "스페인", flag: "🇪🇸", capital: "마드리드", greeting: "Mucho gusto"))
        
        super.init()
    }
}
