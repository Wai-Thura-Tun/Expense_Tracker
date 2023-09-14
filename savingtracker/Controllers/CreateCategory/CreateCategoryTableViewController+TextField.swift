//
//  CreateCategoryTableViewController+TextField.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 14/09/2023.
//

import Foundation
import UIKit

extension CreateCategoryTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
