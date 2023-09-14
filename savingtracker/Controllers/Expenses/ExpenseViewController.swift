//
//  ExpenseViewController.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import UIKit

class ExpenseViewController: UIViewController {

    @IBOutlet weak var expenseTableView: UITableView!
    
    var expenses: [Record] = []
    var expenseSection: [String : [Record]] = [:]
    var tracker: Tracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tracker = Tracker()
        expenseTableView.dataSource = self
        expenseTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reformatData()
        expenseTableView.reloadData()
    }
    
    func updateExpense() {
        expenseSection.removeAll()
        expenses = tracker.getExpenses()
        reformatData()
        expenseTableView.reloadData()
    }
    
    func reformatData() {
        for expense in expenses {
            let year = expense.date.getYear()
            let month = expense.date.getMonth()
            let key = month + ", " + year
            if expenseSection[key] != nil {
                expenseSection[key]!.append(expense)
            }
            else {
                expenseSection[key] = [expense]
            }
        }
    }
    
    @IBAction func createExpense(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "createexpensesegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createexpensesegue" {
            let navVC = segue.destination as! UINavigationController
            if let vc = navVC.topViewController as? CreateTableViewController {
                vc.type = RecordType.expense
            }
        }
        
    }
}
