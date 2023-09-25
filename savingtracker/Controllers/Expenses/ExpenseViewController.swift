//
//  ExpenseViewController.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import UIKit

class ExpenseViewController: UIViewController, UpdateTableViewProtocol {

    @IBOutlet weak var expenseTableView: UITableView!
    
    var expenses: [Record] = []
    var expenseSection: [String : [Record]] = [:]
    var tracker: Tracker!
    var selectedId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        expenseTableView.dataSource = self
        expenseTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reformatData()
        expenseTableView.reloadData()
    }
    
    func reformatData() {
        expenseSection.removeAll()
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
        goToCreateExpense()
    }
    
}
