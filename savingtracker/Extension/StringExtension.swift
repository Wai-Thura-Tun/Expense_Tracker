//
//  StringExtension.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import Foundation

extension String {
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
    
    func toDate() -> Date? {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy-MM-dd"
        let date = dateFomatter.date(from: self)
        return date
    }
}
