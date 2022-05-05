//
//  HomeUIView.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 30.04.2022.
//

import UIKit

class HomeUIView: UIView {

    private var invoicesAppHeader = InvoicesAppHeader()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if (self.superview != nil) {
            self.setupViews()
            self.setupConstraints()
            self.setupStylingViews()
        }
    }
    
    func setupViews() {
        self.addSubview(self.invoicesAppHeader)
    }
    
    func setupConstraints() {
        self.invoicesAppHeader.anchor(top: self.topAnchor,
                                      left: self.leftAnchor,
                                      right: self.rightAnchor,
                                      topConstant: 0,
                                      leftConstant: 0,
                                      rightConstant: 0,
                                      heightConstant: self.getTopPadding() + 80)
    }
    
    func setupStylingViews() {
        self.invoicesAppHeader.backgroundColor = .systemGreen
    }
}
