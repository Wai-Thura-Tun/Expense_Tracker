//
//  DateExtension.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 13/09/2023.
//

import Foundation

extension Date {
    
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
