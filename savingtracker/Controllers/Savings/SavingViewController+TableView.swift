//
//  SavingViewController+TableView.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 10/09/2023.
//

import Foundation
import UIKit

extension SavingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return savings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey = [String](savings.keys)[section]
        return savings[sectionKey]?.keys.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savingcell") as! SavingTableViewCell
        let sectionKey = [String](savings.keys)[indexPath.section]
        if let savings = savings[sectionKey] {
            let month = [String](savings.keys)[indexPath.row]
            if let amount = savings[month] {
                cell.configure(month: month, amount: amount)
                cell.selectionStyle = .none
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return [String](savings.keys)[section]
    }
}
