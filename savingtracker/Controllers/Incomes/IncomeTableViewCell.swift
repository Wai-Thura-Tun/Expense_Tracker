//
//  IncomeTableViewCell.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 09/09/2023.
//

import UIKit

class IncomeTableViewCell: UITableViewCell {

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
    
    func configure(income: Record) {
        categoryLabel.text = income.categoryName
        descripLabel.text = income.description.isEmpty ? "No description" : income.description
        amountLabel.text = "+ \(income.amount)"
    }
}
