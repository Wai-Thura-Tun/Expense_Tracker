//
//  UITextFieldExtension.swift
//  savingtracker
//
//  Created by Wai Thura Tun on 07/10/2023.
//

import Foundation
import UIKit

extension UITextField {
    func addPaddingViewToTextField() {
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
