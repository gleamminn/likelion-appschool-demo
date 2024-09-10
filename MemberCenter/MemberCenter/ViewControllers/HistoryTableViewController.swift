//
//  HistoryTableViewController.swift
//  MemberCenter
//
//  Created by Jongwook Park on 8/1/24.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    let historyModel: AuthHistoryModel = AuthHistoryModel.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // table view를 새로고침!!!
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyModel.logs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let index: Int = indexPath.row
        
        cell.textLabel?.text = historyModel.logs[index]
        
        return cell
    }
}
