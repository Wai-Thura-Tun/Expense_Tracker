//
//  ExpenseViewController+TableView.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 10/09/2023.
//

import Foundation
import UIKit

extension ExpenseViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return expenseSection.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey = [String](expenseSection.keys)[section]
        return expenseSection[sectionKey]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expensecell") as! ExpenseTableViewCell
        let sectionKey = [String](expenseSection.keys)[indexPath.section]
        
        if let expenses = expenseSection[sectionKey] {
            cell.configure(expense: expenses[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return [String](expenseSection.keys)[section]
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
        let sectionKey = [String](expenseSection.keys)[indexPath.section]
        if let expenses = expenseSection[sectionKey] {
            self.selectedId = expenses[indexPath.row].id
        }
        
        performSegue(withIdentifier: "createexpensesegue", sender: nil)
    }
    
    func alertBeforeDelete(indexPath: IndexPath) {
        let deleteAlertController = UIAlertController(title: "Delete Expense", message: "Are you sure to delete the expense record", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            let sectionKey: String = [String](self.expenseSection.keys)[indexPath.section]
            if let expenses = self.expenseSection[sectionKey] {
                let result = self.tracker.deleteRecord(id: expenses[indexPath.row].id)
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
