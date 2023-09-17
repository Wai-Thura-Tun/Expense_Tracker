//
//  CategoryDelegate.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 17/09/2023.
//

import Foundation

protocol UpdateTableViewProtocol: AnyObject {
    var selectedId: Int? { get set }
    func updateTableView()
}
