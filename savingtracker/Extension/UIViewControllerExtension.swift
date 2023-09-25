//
//  UITableViewControllerExtension.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 26/09/2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertController.addAction(okAction)
        if handler != nil {
            let cancelAction = UIAlertAction(title: "Cancel", style: .default)
            alertController.addAction(cancelAction)
        }
        present(alertController, animated: true)
    }
    
}
