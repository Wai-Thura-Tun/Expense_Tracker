//
//  Tracker.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import Foundation

class Tracker {
    private let _dbManager = DBManager.shared
    
    //MARK: - Records
    
    func getRecords() -> [Record] {
        return _dbManager.fetchRecords().map { record in
            return Record(recordDist: record)
        }
    }
    
    func getIncomes() -> [Record] {
        return getRecords().filter { record in
            return record.type == RecordType.INCOME
        }
    }
    
    func getExpenses() -> [Record] {
        return getRecords().filter { record in
            return record.type == RecordType.EXPENSE
        }
    }
    
    func getCurrentRecords() -> (Int, Int, Int){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let month = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: date)
        
        let currentRecordList = getRecords().filter { record in
            return (month == record.date.getMonth()) && (year == record.date.getYear())
        }
        let currentIncome = Int(currentRecordList.filter { record in
            return record.type == RecordType.INCOME
        }.reduce(0) { partialResult, record in
            return partialResult + record.amount
        })
        
        let currentExpense = Int(currentRecordList.filter { record in
            return record.type == RecordType.EXPENSE
        }.reduce(0) { partialResult, record in
            return partialResult + record.amount
        })
        
        let currentSavings = currentIncome - currentExpense
        return (currentSavings,currentIncome,currentExpense)
    }
    
    func getRecordById(id: Int) -> Record {
        let rawRecord = _dbManager.fetchRecordById(id: id)
        guard let record = rawRecord else { return Record() }
        return Record(recordDist: record)
    }
    
    func createRecord(category_id: Int, amount: Double, description: String, type: RecordType, date: String) -> Bool {
        let result = _dbManager.createRecord(category_id: category_id, amount: amount, descrip: description, type: type, date: date)
        return result
    }
    
    func updateRecord(id: Int, category_id: Int, amount: Double, description: String, type: RecordType, date: String) -> Bool {
        let result = _dbManager.updateRecord(id: id, category_id: category_id, amount: amount, descrip: description, type: type, date: date)
        return result
    }
    
    func deleteRecord(id: Int) -> Bool {
        let result = _dbManager.deleteRecord(id: id)
        return result
    }
    
    func deleteRecordByDate(date: String) -> Bool {
        let result = _dbManager.deleteRecordByDate(date: date)
        return result
    }
    
    //MARK: - Categories
    
    func getCategories() -> [Category] {
        return _dbManager.fetchCategories().map { category in
            return Category(category: category)
        }
    }
    
    func getCateogryByID(id: Int) -> Category {
        let rawCategory = _dbManager.fetchCategoryByID(id: id)
        guard let rawCategory = rawCategory else {
            return Category(id: 1, name: "")
        }
        return Category(category: rawCategory)
    }
    
    func createCategory(name: String) -> Bool {
        let result = _dbManager.createCategory(name: name)
        return result
    }
    
    func updateCategory(id: Int, name: String) -> Bool {
        let result = _dbManager.updateCategory(id: id, name: name)
        return result
    }
    
    func deleteCategory(id: Int) -> Bool {
        let result = _dbManager.deleteCategory(id: id)
        return result
    }
}
