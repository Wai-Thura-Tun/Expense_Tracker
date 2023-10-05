//
//  StringExtension.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import Foundation

extension String {
    // Get long form of month = e.g January
    func getMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: self)
        guard let date = date else {
            return ""
        }
        
        let monthFormatter = dateFormatter
        monthFormatter.dateFormat = "MMMM"
        return monthFormatter.string(from: date)
    }
    
    // Get year = e.g. 2023
    func getYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: self)
        guard let date = date else {
            return ""
        }
        
        let yearFormatter = dateFormatter
        yearFormatter.dateFormat = "yyyy"
        return yearFormatter.string(from: date)
    }
    
    // Get date = e.g Date
    func toDate() -> Date? {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy-MM-dd"
        let date = dateFomatter.date(from: self)
        return date
    }
    
    // Get integer form of month = e.g 04
    func toMonthInt() -> Int {
        var month:Int = 1
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        if let date = dateFormatter.date(from: self) {
            let calendar = Calendar.current
            let dateComponent = calendar.dateComponents([.month], from: date)
            month = dateComponent.month ?? 1
        }
        return month
    }
}
