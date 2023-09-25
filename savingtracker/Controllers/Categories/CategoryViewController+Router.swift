//
//  CategoryViewController+Router.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 26/09/2023.
//

import Foundation
import UIKit

extension CategoryViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createcategorysegue" {
            let navVC = segue.destination as! UINavigationController
            if let createCategoryVC = navVC.topViewController as? CreateCategoryTableViewController {
                createCategoryVC.tracker = self.tracker
                createCategoryVC.delegate = self
            }
        }
    }
    
    func goToCreateCategory() {
        performSegue(withIdentifier: "createcategorysegue", sender: nil)
    }
}
