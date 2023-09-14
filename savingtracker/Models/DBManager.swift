//
//  DataManager.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import Foundation

class DBManager {
    static let shared = DBManager()
    private let _db = SQLiteDB.shared
    
    private var isConnectionOpen: Bool = true
    
    init() {
        openDB()
    }
    
    func openDB() {
        isConnectionOpen =  _db.open(copyFile: true)
    }
    
    func closeDB() {
        _db.closeDB()
    }
    
    public func createRecord(category_id: Int,amount: Double, descrip: String, type: RecordType, date: String) -> Bool {
        let query = "INSERT INTO records ('category_id','amount','description','date','type') VALUES ('\(category_id)','\(amount)','\(descrip)','\(date)', '\(type.rawValue)')";
        let result = _db.execute(sql: query)
        return result != 0
    }
    
    public func createCategory(name: String) -> Bool {
        let query = "INSERT INTO categories ('name') VALUES ('\(name)')"
        let result = _db.execute(sql: query)
        return result != 0
    }
    
    public func fetchRecords() -> [[String: Any]] {
        let query = "SELECT r.*, c.id as category_id, c.name as category_name FROM records r INNER JOIN categories c ON c.id = r.category_id";
        let result = _db.query(sql: query)
        return result
    }
    
    public func fetchCategories() -> [[String: Any]] {
        let query = "SELECT * FROM categories";
        let result = _db.query(sql: query)
        return result
    }
    
    public func fetchCategoryByID(id: Int) -> [String:Any]? {
        let query = "SELECT * FROM categories WHERE id='\(id)'"
        let result = _db.query(sql: query)
        return result.first
    }
    
    public func deleteRecord(id: Int) -> Bool {
        let query = "DELETE FROM records WHERE id='\(id)'"
        let result = _db.execute(sql: query)
        return result != 0
    }
    
    public func deleteCategory(id: Int) -> Bool {
        let query = "DELETE FROM categories WHERE id='\(id)'"
        let result = _db.execute(sql: query)
        return result != 0
    }
    
}
