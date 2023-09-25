//
//  CategoryViewController.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import UIKit

class CategoryViewController: UIViewController, UpdateTableViewProtocol {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    var categories: [Category] = []
    var tracker: Tracker!
    var selectedId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    
    func setUp() {
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
    }
    
    @IBAction func createCategory(_ sender: UIBarButtonItem) {
        goToCreateCategory()
    }
    
}
