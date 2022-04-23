//
//  InvoicesAppField.swift.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 23.04.2022.
//

import UIKit

class InvoicesAppField: UIView {

    private var lblTitlePlaceholder = UILabel()
    private var invoicesAppTextField = InvoicesAppTextField()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if (self.superview != nil) {
            self.setupViews()
            self.setupConstraints()
            self.setupStylingViews()
        }
    }
    
    func setupViews() {
        self.addSubview(self.invoicesAppTextField)
        self.addSubview(self.lblTitlePlaceholder)
        self.lblTitlePlaceholder.text = "Test"
    }
    
    func setupConstraints() {
        self.invoicesAppTextField.anchor(top: self.topAnchor,
                                         left: self.leftAnchor,
                                         bottom: self.bottomAnchor,
                                         right: self.rightAnchor,
                                         topConstant: 14,
                                         leftConstant: 8,
                                         bottomConstant: 8,
                                         rightConstant: 8)
        self.lblTitlePlaceholder.anchor(top: self.topAnchor,
                                        left: self.leftAnchor,
                                        topConstant: 8,
                                        leftConstant: 24,
                                        widthConstant: 40,
                                        heightConstant: 12)
    }
    
    func setupStylingViews() {
        self.addBorders()
        self.addCornerRadius(_corners: 20)
        
        self.lblTitlePlaceholder.backgroundColor = .white
        self.lblTitlePlaceholder.textColor = UIColor.init(named: "PrimaryColor")
    }
    
    func addBorders() {
        self.addDashedBorder()
    }
    
    func addCornerRadius(_corners: CGFloat?) {
        self.clipsToBounds = true
        self.layer.cornerRadius = _corners ?? CGFloat(0)
    }
    
    func getInvoicesAppTextField() -> InvoicesAppTextField {
        return self.invoicesAppTextField
    }
}
