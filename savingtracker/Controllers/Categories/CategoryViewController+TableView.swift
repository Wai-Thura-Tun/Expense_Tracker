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
            alertBeforeDelete(indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedId = categories[indexPath.row].id
        performSegue(withIdentifier: "createcategorysegue", sender: nil)
    }
    
    func alertBeforeDelete(indexPath: IndexPath) {
        let deleteAlertController = UIAlertController(title: "Delete Category", message: "Are you sure to delete the category", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            let id = self.categories[indexPath.row].id
            let result = self.tracker.deleteCategory(id: id)
            if result {
                self.updateTableView()
            }
        }
        deleteAlertController.addAction(cancelAction)
        deleteAlertController.addAction(okAction)
        present(deleteAlertController, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createcategorysegue" {
            let navVC = segue.destination as! UINavigationController
            if let createCategoryVC = navVC.topViewController as? CreateCategoryTableViewController {
                createCategoryVC.delegate = self
            }
        }
    }
}
