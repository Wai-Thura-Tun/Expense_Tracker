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

        tracker = Tracker()
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
    }
    
    @IBAction func createCategory(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "createcategorysegue", sender: nil)
    }
    
    func updateTableView() {
        categories = tracker.getCategories()
        categoryTableView.reloadData()
    }
}
