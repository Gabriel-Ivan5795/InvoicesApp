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
            self.setupStylingViews()
            self.addBorders()
            self.addCornerRadius(_corners: 20)
            self.addBorderColorAndWidth()
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
                              topConstant: 16,
                              leftConstant: 16,
                              bottomConstant: 16,
                              rightConstant: 16)
    }
    
    func setupStylingViews() {
        self.textField.textColor = .black
    }
    
    func addBorders() {
        self.addDashedBorder()
    }
    
    func addCornerRadius(_corners: CGFloat?) {
        self.clipsToBounds = true
        self.layer.cornerRadius = _corners ?? CGFloat(0)
    }
    
    func addBorderColorAndWidth() {
        self.layer.borderColor = UIColor.init(named: "PrimaryColor")?.cgColor
        self.layer.borderWidth = 2.0
    }
    
    func getContentField() -> String {
        return self.textField.text!
    }
    
    func getField() -> UITextField {
        return self.textField
    }
    
    func setPlaceholder(_string: String) {
        self.textField.placeholder = _string
    }
}
