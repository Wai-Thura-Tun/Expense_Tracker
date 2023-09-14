//
//  HomeViewController+Router.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import Foundation
import UIKit

extension HomeViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "savingsegue":
            let vc = segue.destination as! SavingViewController
            vc.records = tracker.getRecords()
        case "incomesegue":
            let vc = segue.destination as! IncomeViewController
            vc.incomes = tracker.getIncomes()
        case "expensesegue":
            let vc = segue.destination as! ExpenseViewController
            vc.expenses = tracker.getExpenses()
        case "categorysegue":
            let vc = segue.destination as! CategoryViewController
            vc.categories = tracker.getCategories()
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
