//
//  HomeViewController+Router.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import Foundation
import UIKit

extension DetailViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "savingsegue":
            let vc = segue.destination as! SavingViewController
            vc.tracker = self.tracker
        case "incomesegue":
            let vc = segue.destination as! IncomeViewController
            vc.tracker = self.tracker
        case "expensesegue":
            let vc = segue.destination as! ExpenseViewController
            vc.tracker = self.tracker
        case "categorysegue":
            let vc = segue.destination as! CategoryViewController
            vc.tracker = self.tracker
        default:
            break
        }
    }
    
    func goToSaving() {
        performSegue(withIdentifier: "savingsegue", sender: nil)
    }
    
    func goToIncome() {
        performSegue(withIdentifier: "incomesegue", sender: nil)
    }
    
    func goToExpense() {
        performSegue(withIdentifier: "expensesegue", sender: nil)
    }
    
    func goToCategory() {
        performSegue(withIdentifier: "categorysegue", sender: nil)
    }
}
