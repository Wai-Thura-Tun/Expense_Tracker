//
//  File.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 10/09/2023.
//

import Foundation
import UIKit

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categorycell")!
        cell.textLabel?.text = categories[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            showAlert(title: "Delete Category", message: "Are you sure to delete the category? Income and expense with that cateogry will also be deleted.") { _ in
                let id = self.categories[indexPath.row].id
                let result = self.tracker.deleteCategory(id: id)
                if result {
                    self.updateTableView()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedId = categories[indexPath.row].id
        goToCreateCategory()
    }
    
    func updateTableView() {
        categories = tracker.getCategories()
        categoryTableView.reloadData()
    }
}
