//
//  Category.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import Foundation

class Category {
    
    private var _id: Int
    var id: Int {
        get {
            return _id
        }
        set {
            _id = newValue
        }
    }
    
    private var _name: String
    var name: String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    init(id: Int, name: String) {
        self._id = id
        self._name = name
    }
    
    convenience init(category: [String:Any]) {
        let id = category["id"] as? Int ?? 1
        let name = category["name"] as? String ?? ""
        self.init(id: id, name: name)
    }
}

