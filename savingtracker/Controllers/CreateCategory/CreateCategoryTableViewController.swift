//
//  CreateCategoryTableViewController.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 14/09/2023.
//

import UIKit

class CreateCategoryTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    weak var delegate:UpdateTableViewProtocol?
    var tracker: Tracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        if let id = delegate?.selectedId {
            nameTextField.text = tracker.getCateogryByID(id: id).name
        }
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delegate?.selectedId = nil
        self.dismiss(animated: true)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if nameTextField.text != nil && nameTextField.text != "" {
            var result: Bool = false
            if let id = delegate?.selectedId {
                result = tracker.updateCategory(id: id, name: nameTextField.text!)
            }
            else {
                result = tracker.createCategory(name: nameTextField.text!)
            }
            
            if result {
                delegate?.updateTableView()
            }
            delegate?.selectedId = nil
            self.dismiss(animated: true)
        }
    }

}
