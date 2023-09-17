//
//  HomeViewController+TextField.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 16/09/2023.
//

import Foundation
import UIKit

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func increaseAmount() {
        let amount = Double(amountTextField.text ?? "") ?? 0
        amountTextField.text = String(amount + 1)
    }
    
    func decreaseAmount() {
        let amount = Double(amountTextField.text ?? "") ?? 0
        if amount > 0 {
            amountTextField.text = String(amount - 1)
        }
    }
}
