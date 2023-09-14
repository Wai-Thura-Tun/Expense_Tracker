//
//  ViewController.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 06/09/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var currentSavingLabel: UILabel!
    @IBOutlet weak var currentIncomeLabel: UILabel!
    @IBOutlet weak var currentExpenseLabel: UILabel!
    
    @IBOutlet weak var savingBtn: UIButton!
    @IBOutlet weak var incomeBtn: UIButton!
    @IBOutlet weak var expenseBtn: UIButton!
    @IBOutlet weak var categoryBtn: UIButton!
    
    var tracker: Tracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tracker = Tracker()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    func setUp() {
        configureBtn(savingBtn)
        configureBtn(incomeBtn)
        configureBtn(expenseBtn)
        configureBtn(categoryBtn)
    }
    
    func updateUI() {
        let (saving,income,expense) = tracker.getCurrentRecords()
        currentSavingLabel.text = String(saving)
        currentIncomeLabel.text = String(income)
        currentExpenseLabel.text = String(expense)
    }
    
    func configureBtn(_ sender: UIButton) {
        sender.layer.cornerRadius = 5.0
        sender.layer.shadowColor = UIColor.gray.cgColor
        sender.layer.shadowOffset = CGSize(width: 0, height: 5)
        sender.layer.shadowOpacity = 0.7
        sender.layer.shadowRadius = 10
        sender.layer.shadowPath = nil
    }

    @IBAction func clickSavings(_ sender: UIButton) {
        goToSaving()
    }
    
    @IBAction func clickIncomes(_ sender: UIButton) {
        goToIncome()
    }
    
    @IBAction func clickExpenses(_ sender: UIButton) {
        goToExpense()
    }
    
    @IBAction func clickCategories(_ sender: UIButton) {
        goToCategory()
    }
}

