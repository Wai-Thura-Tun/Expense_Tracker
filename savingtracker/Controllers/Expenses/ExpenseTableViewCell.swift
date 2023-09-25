//
//  ExpenseTableViewCell.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 10/09/2023.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descripLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(expense: Record) {
        categoryLabel.text = expense.categoryName
        descripLabel.text = expense.description.isEmpty ? "No description" : expense.description
        amountLabel.text = "- \(expense.amount)"
    }
}
