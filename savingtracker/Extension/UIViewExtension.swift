//
//  UIViewExtension.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 26/09/2023.
//

import Foundation
import UIKit

extension UIView {
    func addRadiusAndShadow() {
        self.layer.cornerRadius = 5.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 10
        self.layer.shadowPath = nil
    }
}
