//
//  DateExtension.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 13/09/2023.
//

import Foundation

extension Date {
    
    //Get string of date = e.g 2023-03-03
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    //Get string of date e.g Oct 20 2023
    func toStringShort() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: self)
    }
}
