//
//  InvoicesAppButton.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit
import InvoicesHelpers

class InvoicesAppButton: UIButton {

    func addBorders() {
        self.addDashedBorder()
    }
    
    func addCornerRadius(_corners: CGFloat?) {
        self.layer.cornerRadius = _corners ?? CGFloat(0)
    }
}
