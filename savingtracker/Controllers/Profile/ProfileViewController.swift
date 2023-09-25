//
//  ViewController.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 06/09/2023.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var savingAmountLabel: UILabel!
    @IBOutlet weak var incomeAmountLabel: UILabel!
    @IBOutlet weak var expenseAmountLabel: UILabel!
    
    @IBOutlet weak var savingAmountView: UIView!
    @IBOutlet weak var incomeAmountView: UIView!
    @IBOutlet weak var expenseAmountView: UIView!
    
    @IBOutlet weak var savingBtn: UIButton!
    @IBOutlet weak var incomeBtn: UIButton!
    @IBOutlet weak var expenseBtn: UIButton!
    @IBOutlet weak var categoryBtn: UIButton!
    
    var tracker: Tracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tracker = Tracker()
        setUp()
        updateAmount()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateAmount()
    }
    
    func setUp() {
        savingAmountView.addRadiusAndShadow()
        incomeAmountView.addRadiusAndShadow()
        expenseAmountView.addRadiusAndShadow()
        savingBtn.addRadiusAndShadow()
        incomeBtn.addRadiusAndShadow()
        expenseBtn.addRadiusAndShadow()
        categoryBtn.addRadiusAndShadow()
    }
    
    func updateAmount() {
        let (saving,income,expense) = tracker.getCurrentRecords()
        savingAmountLabel.text = String(saving)
        incomeAmountLabel.text = String(income)
        expenseAmountLabel.text = String(expense)
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

