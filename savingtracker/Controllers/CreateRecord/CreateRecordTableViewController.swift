//
//  CreateTableViewController.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 12/09/2023.
//

import UIKit

class CreateRecordTableViewController: UITableViewController {

    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    weak var delegate: UpdateTableViewProtocol?
    var tracker: Tracker!
    var categories: [Category] = []
    var type: RecordType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = tracker.getCategories()
        setUp()
        updateUI()
    }
    
    func setUp() {
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        descriptionTextField.delegate = self
        amountTextField.delegate = self
        amountTextField.keyboardType = .numberPad
    }
    
    func updateUI() {
        if let id = delegate?.selectedId {
            let record = tracker.getRecordById(id: id)
            amountTextField.text = String(record.amount)
            descriptionTextField.text = record.description
            type = record.type
            let index = categories.firstIndex { category in
                category.name == record.categoryName
            }
            categoryPickerView.selectRow(index ?? 0, inComponent: 0, animated: true)
            if let date = record.date.toDate() {
                datePicker.setDate(date, animated: true)
            }
        }
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
        var result: Bool = false;
        if let amountString = amountString, !amountString.isEmpty, let description = description, !description.isEmpty, let type = type {
            let amount: Double = Double(amountString) ?? 0.0
            if let id = delegate?.selectedId {
                result = tracker.updateRecord(id: id, category_id: category_id, amount: amount, description: description, type: type, date: date.toString())
            }
            else {
                result = tracker.createRecord(category_id: category_id, amount: amount, description: description, type: type, date: date.toString())
            }
            
            if result {
                NotificationManager.checkForNotificationPermission(tracker: tracker)
                delegate?.updateTableView()
            }
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func tapView(_ sender: Any) {
        self.view.endEditing(true)
    }
}
