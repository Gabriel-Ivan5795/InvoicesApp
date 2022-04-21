//
//  InvoicesAppTextField.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 21.04.2022.
//

import UIKit

class InvoicesAppTextField: UIView {

    private var textField = UITextField()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if (self.superview != nil) {
            
            self.setupViews()
            self.setupConstraints()
            self.addBorders()
            self.addCornerRadius(_corners: 20)
        }
    }
    
    func setupViews() {
        self.addSubview(self.textField)
    }
    
    func setupConstraints() {
        self.textField.anchor(top: self.topAnchor,
                              left: self.leftAnchor,
                              bottom: self.bottomAnchor,
                              right: self.rightAnchor,
                              topConstant: 8,
                              leftConstant: 0,
                              bottomConstant: 8,
                              rightConstant: 0)
    }
    
    func addBorders() {
        self.addDashedBorder()
    }
    
    func addCornerRadius(_corners: CGFloat?) {
        self.clipsToBounds = true
        self.layer.cornerRadius = _corners ?? CGFloat(0)
    }
    
    func getContentField() -> String {
        return self.textField.text!
    }
}
