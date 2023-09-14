//
//  CreateTableViewController+TextField.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 12/09/2023.
//

import Foundation
import UIKit

extension CreateTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
