//
//  SavingTableViewCell.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 10/09/2023.
//

import UIKit

class SavingTableViewCell: UITableViewCell {

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(month: String, amount: Double) {
        amountLabel.text = String(amount)
        
        if amount < 1 {
            amountLabel.textColor = UIColor.red
        }
        else {
            amountLabel.textColor = UIColor.green
        }
        
        monthLabel.text = month
    }
}
