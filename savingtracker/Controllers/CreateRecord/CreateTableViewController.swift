//
//  CreateTableViewController.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 12/09/2023.
//

import UIKit

class CreateTableViewController: UITableViewController {

    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    var tracker: Tracker!
    var categories: [Category] = []
    var type: RecordType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tracker = Tracker()
        categories = tracker.getCategories()
        
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        descriptionTextField.delegate = self
        amountTextField.delegate = self
        
        amountTextField.keyboardType = .numberPad
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        let selectRow = categoryPickerView.selectedRow(inComponent: 0)
        let amountString = amountTextField.text
        let category_id = categories[selectRow].id
        let description = descriptionTextField.text
        let date = datePicker.date
        if let amountString = amountString, let description = description, let type = type {
            let amount: Double = Double(amountString) ?? 0.0
            let result = tracker.createRecord(category_id: category_id, amount: amount, description: description, type: type, date: date.toString())
            if result {
                if let navVC = presentingViewController as? UINavigationController {
                    if let incomeVC = navVC.topViewController as? IncomeViewController {
                        incomeVC.updateIncome()
                    }
                    else if let expenseVC = navVC.topViewController as? ExpenseViewController {
                        expenseVC.updateExpense()
                    }
                }
            }
            self.dismiss(animated: true)
        }
    }
}
