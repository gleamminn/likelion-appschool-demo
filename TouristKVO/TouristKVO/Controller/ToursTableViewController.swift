//
//  ToursTableViewController.swift
//  TouristKVO
//
//  Created by Jongwook Park on 7/30/24.
//

import UIKit

class ToursTableViewController: UITableViewController {
    
    let manager: TourManager = TourManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // 섹션 숫자를 결정하자
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 섹션마다 몇개의 항목이 있는지 결정하자
        return manager.tours.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // indexPath 값에 맞춰서 Table의 Cell을 만들어주자
        // indexPath 정보로 몇 번째 section의 몇 번째 row인지를 알 수 있다
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let tour: Tour = manager.tours[indexPath.row]
        
        cell.textLabel?.text = tour.memberName

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section)에서 \(indexPath.row)번째 내용 선택!")
        
        manager.selectedMemberIndex = indexPath.row
    }
}
