//
//  InvoicesAppField.swift.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 23.04.2022.
//

import UIKit
import InvoicesHelpers

class InvoicesAppField: UIView {

    private var lblTitlePlaceholder = PaddingLabel()
    private var invoicesAppTextField = InvoicesAppTextField()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if (self.superview != nil) {
            self.setupViews()
            self.setupConstraints()
            self.setupStylingViews()
            self.hideLabelPlaceholder()
        }
    }
    
    func setupViews() {
        self.addSubview(self.invoicesAppTextField)
        self.addSubview(self.lblTitlePlaceholder)
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
                                        heightConstant: 16)
    }
    
    func setupStylingViews() {
        self.addBorders()
        self.addCornerRadius(_corners: 20)
        self.addShadow()
        
        self.lblTitlePlaceholder.backgroundColor = .white
        self.lblTitlePlaceholder.textColor = UIColor.init(named: "PrimaryColor")
    }
    
    func addBorders() {
        self.addDashedBorder()
    }
    
    func showLabelPlaceholder() {
        self.lblTitlePlaceholder.isHidden = false
    }
    
    func hideLabelPlaceholder() {
        self.lblTitlePlaceholder.isHidden = true
    }
    
    func addCornerRadius(_corners: CGFloat?) {
        self.clipsToBounds = true
        self.layer.cornerRadius = _corners ?? CGFloat(0)
    }
    
    func getInvoicesAppTitlePlaceholder() -> PaddingLabel {
        return self.lblTitlePlaceholder
    }
    
    func getInvoicesAppTextField() -> InvoicesAppTextField {
        return self.invoicesAppTextField
    }
    
    func setPlaceholderTitle(_string: String) {
        self.lblTitlePlaceholder.text = _string
    }
    
    func setValueField(_value: String) {
        self.getInvoicesAppTextField().setValueField(_value: _value)
    }
}
