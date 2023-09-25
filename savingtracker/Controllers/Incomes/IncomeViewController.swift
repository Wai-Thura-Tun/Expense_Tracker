//
//  IncomeViewController.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 08/09/2023.
//

import UIKit

class IncomeViewController: UIViewController, UpdateTableViewProtocol {
    
    @IBOutlet weak var incomeTableView: UITableView!

    var incomes: [Record] = []
    var incomeSection: [String : [Record]] = [:]
    var tracker: Tracker!
    var selectedId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.incomes = tracker.getIncomes()
        setUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reformatData()
        incomeTableView.reloadData()
    }
    
    func setUp() {
        incomeTableView.dataSource = self
        incomeTableView.delegate = self
    }
    
    func reformatData() {
        incomeSection.removeAll()
        for income in incomes {
            let year = income.date.getYear()
            let month = income.date.getMonth()
            let key = month + ", " + year
            if incomeSection[key] != nil {
                incomeSection[key]?.append(income)
            }
            else {
                incomeSection[key] = [income]
            }
        }
    }
    
    @IBAction func createIncome(_ sender: UIBarButtonItem) {
        goToCreateIncome()
    }
    
}
