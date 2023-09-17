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
        categories = tracker.getCategories()
        categoriesPicker.dataSource = self
        categoriesPicker.delegate = self
        amountTextField.delegate = self
        setUp()
        updateSavings()
    }
    
    func setUp() {
        saveBtn.layer.cornerRadius = 10
        savingView.layer.cornerRadius = 10
        savingView.layer.shadowColor = UIColor.gray.cgColor
        savingView.layer.shadowOpacity = 0.7
        savingView.layer.shadowRadius = 5
        savingView.layer.shadowOffset = CGSize(width: 2, height: 0)
        savingView.layer.shadowPath = nil
    }
    
    func updateSavings() {
        let (saving, _, _) = tracker.getCurrentRecords()
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
        let type = RecordType.expense
        if amount > 0 {
            let result = tracker.createRecord(category_id: category_id, amount: amount, description: "", type: type, date: date.toString())
            if result {
                alertAfterSave()
                amountTextField.text = String(1000)
                updateSavings()
            }
        }
    }
    
    func alertAfterSave() {
        let finishAlertController = UIAlertController(title: "Save Expense", message: "Expense has been saved successfully.", preferredStyle: .alert)
        let finishAction = UIAlertAction(title: "Ok", style: .default)
        finishAlertController.addAction(finishAction)
        present(finishAlertController, animated: true)
    }
}
