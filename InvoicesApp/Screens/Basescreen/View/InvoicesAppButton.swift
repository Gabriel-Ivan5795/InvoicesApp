//
//  InvoicesAppButton.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit
import InvoicesHelpers

class InvoicesAppButton: UIButton {
    
    private var gradientLayer: CAGradientLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradientLayer.anchorPoint = .zero
        self.gradientLayer.bounds = self.bounds
        self.layer.insertSublayer(self.gradientLayer, at: 0)
    }
    
    func initGradientLayer() {
        self.gradientLayer = GradientHelper.createGradientLayer(colors: [UIColor.init(named: "ButtonsPrimaryColor")!,
                                                                         UIColor.init(named: "ButtonsSecondaryColor")!],
                                                                direction: .horizontal)
    }
    
    func addBorders() {
        self.addDashedBorder()
    }
    
    func addCornerRadius(_corners: CGFloat?) {
        self.clipsToBounds = true
        self.layer.cornerRadius = _corners ?? CGFloat(0)
    }
}
