//
//  InvoicesAppSmallButton.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 05.05.2022.
//

import UIKit

class InvoicesAppSmallButton: UIButton {

    private var imgButton = UIImageView()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if (self.superview != nil) {
            self.setupViews()
            self.setupConstraints()
        }
    }
    
    func setupViews() {
        self.addSubview(self.imgButton)
    }
    
    func setupConstraints() {
        self.imgButton.anchor(top: self.topAnchor,
                              left: self.leftAnchor,
                              bottom: self.bottomAnchor,
                              right: self.rightAnchor,
                              topConstant: 8,
                              leftConstant: 8,
                              bottomConstant: 8,
                              rightConstant: 8)
    }
    
    func getImageView() -> UIImageView {
        return self.imgButton
    }
}
