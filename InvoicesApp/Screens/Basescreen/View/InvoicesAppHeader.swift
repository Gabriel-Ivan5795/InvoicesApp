//
//  InvoicesAppHeader.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 05.05.2022.
//

import UIKit
import InvoicesHelpers

class InvoicesAppHeader: UIView {

    private var btnLeft = InvoicesAppSmallButton()
    private var btnRight = InvoicesAppSmallButton()
    private var lblTitleHeader = UILabel()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if (self.superview != nil) {
            self.setupViews()
            self.setupConstraints()
            self.setupStylingViews()
        }
    }
    
    func setupViews() {
        self.addSubview(self.btnLeft)
        self.addSubview(self.btnRight)
        self.addSubview(self.lblTitleHeader)
    }
    
    func setupConstraints() {
        self.btnLeft.anchor(top: self.topAnchor,
                            left: self.leftAnchor,
                            topConstant: self.getTopPadding() + 10,
                            leftConstant: 16,
                            widthConstant: 40,
                            heightConstant: 40)
        self.btnRight.anchor(top: self.topAnchor,
                             right: self.rightAnchor,
                             topConstant: self.getTopPadding() + 10,
                             rightConstant: 16,
                             widthConstant: 40,
                             heightConstant: 40)
        self.lblTitleHeader.anchor(top: self.topAnchor,
                                   left: self.btnLeft.rightAnchor,
                                   right: self.btnRight.leftAnchor,
                                   topConstant: self.getTopPadding() + 10,
                                   leftConstant: 8,
                                   rightConstant: 8,
                                   heightConstant: 21)
    }
    
    func setupStylingViews() {
        self.lblTitleHeader.font = UIFont.init(name: "Roboto-Bold", size: 18)
        self.lblTitleHeader.textColor = .white
        self.lblTitleHeader.text = "Home"
        self.lblTitleHeader.textAlignment = .center
        
        self.btnLeft.getImageView().backgroundColor = .red
        self.btnRight.getImageView().backgroundColor = .blue
        
        self.btnLeft.backgroundColor = .systemBlue
        self.btnRight.backgroundColor = .systemRed
    }
}
