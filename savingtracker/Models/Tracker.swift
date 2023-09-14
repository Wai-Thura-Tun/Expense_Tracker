//
//  Tracker.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import Foundation

class Tracker {
    private let _dbManager = DBManager.shared
    
    func getRecords() -> [Record] {
        return _dbManager.fetchRecords().map { record in
            return Record(recordDist: record)
        }
    }
    
    func getIncomes() -> [Record] {
        return getRecords().filter { record in
            return record.type == RecordType.income
        }
    }
    
    func getExpenses() -> [Record] {
        return getRecords().filter { record in
            return record.type == RecordType.expense
        }
    }
    
    func getCurrentRecords() -> (Double, Double, Double) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let month = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: date)
        
        let currentRecordList = getRecords().filter { record in
            return (month == record.date.getMonth()) && (year == record.date.getYear())
        }
        let currentIncome = currentRecordList.filter { record in
            return record.type == RecordType.income
        }.reduce(0) { partialResult, record in
            return partialResult + record.amount
        }
        
        let currentExpense = currentRecordList.filter { record in
            return record.type == RecordType.expense
        }.reduce(0) { partialResult, record in
            return partialResult + record.amount
        }
        
        let currentSavings = currentIncome - currentExpense
        return (currentSavings,currentIncome,currentExpense)
    }
    
    func getCategories() -> [Category] {
        return _dbManager.fetchCategories().map { category in
            return Category(category: category)
        }
    }
    
    func getCateogryByID(id: Int) -> Category {
        let rawCategory = _dbManager.fetchCategoryByID(id: id)
        guard let rawCategory = rawCategory else {
            return Category(id: 1, name: "Breakfast")
        }
        return Category(category: rawCategory)
    }
    
    func createRecord(category_id: Int, amount: Double, description: String, type: RecordType, date: String) -> Bool {
        let result = _dbManager.createRecord(category_id: category_id, amount: amount, descrip: description, type: type, date: date)
        return result
    }
    
    func deleteRecord(id: Int) -> Bool {
        let result = _dbManager.deleteRecord(id: id)
        return result
    }
    
    func createCategory(name: String) -> Bool {
        let result = _dbManager.createCategory(name: name)
        return result
    }
    
    func deleteCategory(id: Int) -> Bool {
        let result = _dbManager.deleteCategory(id: id)
        return result
    }
}
