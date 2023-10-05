//
//  CreateRecordTableViewController+TextView.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 04/10/2023.
//

import Foundation
import UIKit

extension CreateRecordTableViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
