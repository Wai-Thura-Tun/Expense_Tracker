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
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    //MARK: - INDEXPATH
    private let categoryCellIndexPath = IndexPath(row: 0, section: 1)
    private let categoryPickerViewIndexPath = IndexPath(row: 1, section: 1)
    private let dateCellIndexPath = IndexPath(row: 0, section: 2)
    private let datePickerIndexPath = IndexPath(row: 1, section: 2)
    private let descriptionTextViewIndexPath = IndexPath(row: 0, section: 3)
    
    //MARK: - PICKER STATE
    private var isPickerViewHidden: Bool = true
    private var isDatePickerHidden: Bool = true
    
    weak var delegate: UpdateTableViewProtocol?
    var tracker: Tracker!
    var categories: [Category] = []
    var type: RecordType?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = tracker.getCategories()
        updateNavigationTitle()
        setUp()
        updateUI()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case categoryPickerViewIndexPath:
            return isPickerViewHidden ? 0 : categoryPickerView.frame.height
        case datePickerIndexPath:
            return isDatePickerHidden ? 0 : datePicker.frame.height
        case descriptionTextViewIndexPath:
            return 200
        default:
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == categoryCellIndexPath {
            isPickerViewHidden = !isPickerViewHidden
            isDatePickerHidden = true
        }
        else if indexPath == dateCellIndexPath {
            isDatePickerHidden = !isDatePickerHidden
            isPickerViewHidden = true
        }
        self.view.endEditing(true)
        tableView.beginUpdates()
        tableView.endUpdates()
            
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delegate?.selectedId = nil
        self.dismiss(animated: true)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        let selectRow = categoryPickerView.selectedRow(inComponent: 0)
        let amountString = amountTextField.text
        let category_id = categories[selectRow].id
        let description = descriptionTextView.text
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
            delegate?.selectedId = nil
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
        updateDateLabel()
    }
        
    @IBAction func tapView(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    func setUp() {
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        descriptionTextView.delegate = self
        amountTextField.delegate = self
        amountTextField.keyboardType = UIKeyboardType.decimalPad
        amountTextField.addPaddingViewToTextField()
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
    func updateNavigationTitle() {
        var title = ""
        if let type = type {
            if type == RecordType.INCOME {
                title = "Add Income"
            }
            else {
                title = "Add Expense"
            }
        }
        self.navigationItem.title = title
    }
    
    func updateUI() {
        if let id = delegate?.selectedId {
            let record = tracker.getRecordById(id: id)
            amountTextField.text = String(record.amount)
            descriptionTextView.text = record.description
            type = record.type
            let index = categories.firstIndex { category in
                category.name == record.categoryName
            }
            categoryPickerView.selectRow(index ?? 0, inComponent: 0, animated: true)
            categoryLabel.text = record.categoryName
            if let date = record.date.toDate() {
                datePicker.setDate(date, animated: true)
                dateLabel.text = datePicker.date.toStringShort()
            }
        }
        else {
            updateDateLabel()
            updateCategoryLabel()
        }
    }
    
    func updateDateLabel() {
        dateLabel.text = datePicker.date.toStringShort()
    }
    
    func updateCategoryLabel() {
        let index = categoryPickerView.selectedRow(inComponent: 0)
        categoryLabel.text = categories[index].name
    }
}
