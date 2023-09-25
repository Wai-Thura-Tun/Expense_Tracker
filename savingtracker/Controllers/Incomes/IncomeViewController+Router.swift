//
//  IncomeViewController+Router.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 26/09/2023.
//

import Foundation
import UIKit

extension IncomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createincomesegue" {
            let navVC = segue.destination as! UINavigationController
            if let vc = navVC.topViewController as? CreateRecordTableViewController {
                vc.tracker = self.tracker
                vc.type = RecordType.income
                vc.delegate = self
            }
        }
    }
    
    func goToCreateIncome() {
        performSegue(withIdentifier: "createincomesegue", sender: nil)
    }
}
