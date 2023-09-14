//
//  CreateCategoryTableViewController.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 14/09/2023.
//

import UIKit

class CreateCategoryTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    var tracker: Tracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tracker = Tracker()
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if nameTextField.text != nil && nameTextField.text != "" {
            let result = tracker.createCategory(name: nameTextField.text!)
            if result {
                let navVC = presentingViewController as! UINavigationController
                if let categoryVC = navVC.topViewController as? CategoryViewController {
                    categoryVC.updateTableView()
                }
                
            }
            self.dismiss(animated: true)
        }
    }

}
