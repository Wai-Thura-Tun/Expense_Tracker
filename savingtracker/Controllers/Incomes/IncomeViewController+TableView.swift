//
//  IncomeViewController+TableView.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import Foundation
import UIKit

extension IncomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return incomeSection.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey = [String](incomeSection.keys)[section]
        return incomeSection[sectionKey]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "incomecell") as! IncomeTableViewCell
        let sectionKey: String = [String](incomeSection.keys)[indexPath.section]
        
        if let incomes = incomeSection[sectionKey] {
            cell.configure(income: incomes[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return [String](incomeSection.keys)[section]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alertBeforeDelete(indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionKey = [String](incomeSection.keys)[indexPath.section]
        if let incomes = incomeSection[sectionKey] {
            self.selectedId = incomes[indexPath.row].id
        }
    }
    
    func alertBeforeDelete(indexPath: IndexPath) {
        let deleteAlertController = UIAlertController(title: "Delete Income", message: "Are you sure to delete the income record", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            let sectionKey: String = [String](self.incomeSection.keys)[indexPath.section]
            if let incomes = self.incomeSection[sectionKey] {
                let result = self.tracker.deleteRecord(id: incomes[indexPath.row].id)
                if result {
                    self.updateTableView()
                }
            }
        }
        deleteAlertController.addAction(cancelAction)
        deleteAlertController.addAction(okAction)
        present(deleteAlertController, animated: true)
    }
    
}
