//
//  UIViewExtension.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 26/09/2023.
//

import Foundation
import UIKit

extension UIView {
    func addRadiusAndShadow(radius: CGFloat, offsetHeight: Int) {
        self.layer.cornerRadius = 5.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: offsetHeight)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = radius
        self.layer.shadowPath = nil
    }
}
