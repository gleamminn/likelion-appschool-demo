//
//  InfoViewController.swift
//  TouristKVO
//
//  Created by Jongwook Park on 7/30/24.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var memberLabel: UILabel!
    @IBOutlet weak var nationLabel: UILabel!
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateLabels()
    }
    
    func updateLabels() {
        let manager: TourManager = TourManager.shared
        
        if manager.selectedMemberIndex < 0 {
            memberLabel.text = ""
            nationLabel.text = ""
            flagLabel.text = ""
            capitalLabel.text = ""
            greetingLabel.text = ""
        } else {
            memberLabel.text = "선택된 멤버는 \(manager.selectedMemberName)입니다."
            nationLabel.text = manager.selectedTour.nation
            flagLabel.text = manager.selectedTour.flag
            capitalLabel.text = manager.selectedTour.capital
            greetingLabel.text = manager.selectedTour.greeting
        }
    
    
    }

}
