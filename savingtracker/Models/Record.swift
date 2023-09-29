//
//  Record.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import Foundation

class Record {
    
    private var _id: Int
    var id: Int {
        get {
             return _id
        }
        set {
            _id = newValue
        }
    }
    
    private var _amount: Double
    var amount: Double {
        get {
            return _amount
        }
        set {
            _amount = newValue
        }
    }
    
    private var _description: String
    var description: String {
        get {
            return _description
        }
        set {
            _description = newValue
        }
    }
    
    private var _date: String
    var date: String {
        get {
            return _date
        }
        set {
            _date = newValue
        }
    }
    
    private var _type: RecordType
    var type: RecordType {
        get {
            return _type
        }
        set {
            _type = newValue
        }
    }
    
    private var _category_id: Int
    var categoryId: Int {
        get {
            return _category_id
        }
        set {
            _category_id = newValue
        }
    }
    
    private var _category_name: String
    var categoryName: String {
        get {
            return _category_name
        }
        set {
            _category_name = newValue
        }
    }
    
    init() {
        self._id = 1
        self._amount = 0.0
        self._description = ""
        self._type = RecordType.EXPENSE
        self._date = ""
        self._category_id = 1
        self._category_name = ""
    }
    
    init(_id: Int, _amount: Double, _description: String, _date: String, _type: RecordType, _category_id: Int, _category_name: String) {
        self._id = _id
        self._amount = _amount
        self._description = _description
        self._type = _type
        self._date = _date
        self._category_id = _category_id
        self._category_name = _category_name
    }
    
    convenience init(recordDist: [String: Any]) {
        let id: Int = recordDist["id"] as? Int ?? 1
        let amount: Double = recordDist["amount"] as? Double ?? 0.0
        let description: String = recordDist["description"] as? String ?? ""
        let date: String = recordDist["date"] as? String ?? ""
        let typeString: String = recordDist["type"] as? String ?? ""
        let type: RecordType = RecordType(rawValue: typeString) ?? RecordType.EXPENSE
        let categoryId: Int = recordDist["category_id"] as? Int ?? 1
        let categoryName: String = recordDist["category_name"] as? String ?? ""
        self.init(_id: id, _amount: amount, _description: description, _date: date, _type: type, _category_id: categoryId, _category_name: categoryName)
    }
    
}
