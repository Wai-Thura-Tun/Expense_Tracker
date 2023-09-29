//
//  ExpenseViewController+Router.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 26/09/2023.
//

import Foundation
import UIKit

extension ExpenseViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createexpensesegue" {
            let navVC = segue.destination as! UINavigationController
            if let vc = navVC.topViewController as? CreateRecordTableViewController {
                vc.tracker = self.tracker
                vc.type = RecordType.EXPENSE
                vc.delegate = self
            }
        }
        
    }
    
    func goToCreateExpense() {
        performSegue(withIdentifier: "createexpensesegue", sender: nil)
    }
}
