//
//  SavingViewController.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 07/09/2023.
//

import UIKit

class SavingViewController: UIViewController {

    @IBOutlet weak var savingTableView: UITableView!
    
    var records: [Record] = []
    var savings: [String: [String:Double]] = [:]
    var tracker: Tracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        self.records = tracker.getRecords()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reStructureData()
        savingTableView.reloadData()
    }
    
    func setUp() {
        savingTableView.dataSource = self
        savingTableView.delegate = self
    }
    
    func reStructureData() {
        savings.removeAll()
        for record in records {
            let year = record.date.getYear()
            let month = record.date.getMonth()
            var amount:Double = record.amount
            amount = record.type == RecordType.EXPENSE ? -1 * amount : amount
            
            if var saving = savings[year] {
                if saving.keys.contains(month) {
                    let currentAmount = saving[month]!
                    amount += currentAmount
                }
                saving[month] = amount
                savings[year] = saving
                continue
            }
            savings[year] = [month:amount]
            
        }
    }
    
}
