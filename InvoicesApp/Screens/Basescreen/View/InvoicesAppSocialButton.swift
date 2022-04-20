//
//  InvoicesAppSocialButton.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 17.04.2022.
//

import UIKit
import InvoicesHelpers

class InvoicesAppSocialButton: InvoicesAppButton {

    private var imgButton = UIImageView()
    private var lblButton = UILabel()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if (self.superview != nil) {
            
            self.setupViews()
            self.setupConstraints()
            self.setupStylingViews()
        }
    }
    
    func setupViews() {
        self.addSubview(self.imgButton)
        self.addSubview(self.lblButton)
    }

    func setupConstraints() {
        self.lblButton.anchor(top: self.topAnchor,
                              left: self.imgButton.rightAnchor,
                              bottom: self.bottomAnchor,
                              right: self.rightAnchor,
                              topConstant: 8,
                              leftConstant: 8,
                              bottomConstant: 8,
                              rightConstant: 26)
        self.imgButton.anchor(top: self.topAnchor,
                              left: self.leftAnchor,
                              bottom: self.bottomAnchor,
                              right: self.lblButton.leftAnchor,
                              topConstant: 20,
                              leftConstant: 8,
                              bottomConstant: 20,
                              rightConstant: 8,
                              widthConstant: 20,
                              heightConstant: 20)
        self.imgButton.anchorToCenterY(centerY: self.centerYAnchor)
    }
    
    func setupStylingViews() {
        self.imgButton.contentMode = .scaleAspectFit
        self.lblButton.textAlignment = .center
    }
    
    func getLabelButton() -> UILabel {
        return self.lblButton
    }
    
    func getImageButton() -> UIImageView {
        return self.imgButton
    }
}
