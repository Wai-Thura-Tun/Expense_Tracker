//
//  HomeViewController.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 15/09/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var savingView: UIView!
    @IBOutlet weak var savingAmountLabel: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var categoriesPicker: UIPickerView!
    @IBOutlet weak var amountTextField: UITextField!
    
    var categories: [Category] = []
    var tracker: Tracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tracker = Tracker()
        setUp()
        NotificationManager.checkForNotificationPermission(tracker: tracker)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        categories = tracker.getCategories()
        categoriesPicker.reloadAllComponents()
        updateSavings()
    }
    
    func setUp() {
        categoriesPicker.dataSource = self
        categoriesPicker.delegate = self
        amountTextField.delegate = self
        amountTextField.keyboardType = UIKeyboardType.decimalPad
        saveBtn.layer.cornerRadius = 10
        savingView.addRadiusAndShadow(radius: 1, offsetHeight: 2)
    }
    
    func updateSavings() {
        let (saving, _, _) = tracker.getCurrentRecords()
        if saving < 0 {
            savingAmountLabel.textColor = UIColor.red
        }
        else {
            savingAmountLabel.textColor = UIColor.green
        }
        savingAmountLabel.text = String(saving)
    }
    
    @IBAction func increaseAmount(_ sender: UIButton) {
        increaseAmount()
    }
    
    @IBAction func decreaseAmount(_ sender: UIButton) {
        decreaseAmount()
    }
    
    @IBAction func saveExpense(_ sender: UIButton) {
        let selectPickerId = categoriesPicker.selectedRow(inComponent: 0)
        let category_id = categories[selectPickerId].id
        let amount = Double(amountTextField.text ?? "") ?? 0.0
        let date = Date()
        let type = RecordType.EXPENSE
        if amount > 0 {
            let result = tracker.createRecord(category_id: category_id, amount: amount, description: "", type: type, date: date.toString())
            if result {
                showAlert(title: "Save Expense", message: "Expense has been saved")
                amountTextField.text = String(1000)
                NotificationManager.checkForNotificationPermission(tracker: tracker)
                updateSavings()
            }
        }
    }
    
    @IBAction func tapView(_ sender: Any) {
        self.view.endEditing(true)
    }
}
