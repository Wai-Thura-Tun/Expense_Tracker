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
        configureUIView(savingAmountView)
        configureUIView(incomeAmountView)
        configureUIView(expenseAmountView)
        configureBtn(savingBtn)
        configureBtn(incomeBtn)
        configureBtn(expenseBtn)
        configureBtn(categoryBtn)
    }
    
    func updateAmount() {
        let (saving,income,expense) = tracker.getCurrentRecords()
        savingAmountLabel.text = String(saving)
        incomeAmountLabel.text = String(income)
        expenseAmountLabel.text = String(expense)
    }
    
    func configureUIView(_ sender: UIView) {
        sender.layer.cornerRadius = 5
        sender.layer.shadowColor = UIColor.gray.cgColor
        sender.layer.shadowOffset = CGSize(width: 0, height: 4)
        sender.layer.shadowRadius = 10
        sender.layer.shadowOpacity = 0.7
        sender.layer.shadowPath = nil
    }
    
    func configureBtn(_ sender: UIControl) {
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

