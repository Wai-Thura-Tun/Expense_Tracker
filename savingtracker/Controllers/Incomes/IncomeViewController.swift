//
//  IncomeViewController.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 08/09/2023.
//

import UIKit

class IncomeViewController: UIViewController {
    
    @IBOutlet weak var incomeTableView: UITableView!

    var incomes: [Record] = []
    var incomeSection: [String : [Record]] = [:]
    var tracker: Tracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tracker = Tracker()
        incomeTableView.dataSource = self
        incomeTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reformatData()
        incomeTableView.reloadData()
    }
    
    func updateIncome() {
        incomeSection.removeAll()
        incomes = tracker.getIncomes()
        reformatData()
        incomeTableView.reloadData()
    }
    
    func reformatData() {
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
        performSegue(withIdentifier: "createincomesegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createincomesegue" {
            let navVC = segue.destination as! UINavigationController
            if let vc = navVC.topViewController as? CreateTableViewController {
                vc.type = RecordType.income
            }
        }
    }
    
    
}
