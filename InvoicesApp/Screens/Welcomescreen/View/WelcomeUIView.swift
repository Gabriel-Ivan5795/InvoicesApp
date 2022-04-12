//
//  WelcomeUIView.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit
import InvoicesHelpers

class WelcomeUIView: UIView {

    private var btnGetStarted = InvoicesAppButton()
    private var lblWelcome = UILabel()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if (self.superview != nil) {
            self.setupViews()
            self.setupConstraints()
        }
    }
    
    func setupViews() {
        self.addSubview(self.lblWelcome)
        self.addSubview(self.btnGetStarted)
    }
    
    func setupConstraints() {
        self.lblWelcome.anchor(top: self.topAnchor,
                               left: self.leftAnchor,
                               right: self.rightAnchor,
                               topConstant: self.getTopPadding(),
                               leftConstant: 20,
                               rightConstant: 20)
        self.btnGetStarted.anchor(left: self.leftAnchor,
                                  bottom: self.bottomAnchor,
                                  right: self.rightAnchor,
                                  leftConstant: 20,
                                  bottomConstant: 40,
                                  rightConstant: 20,
                                  heightConstant: 60)
    }
    
    func setupWelcomeString(_string: String) {
        self.lblWelcome.text = _string
    }
    
    
    func setupButtonText(_string: String) {
        self.btnGetStarted.setTitle(_string, for: .normal)
    }
    
    func setupUIColorsAndFonts(_primaryColor: UIColor, _buttonColor: UIColor, _buttonCornerRadius: CGFloat, _titleFont: UIFont, _buttonFont: UIFont) {
        self.backgroundColor = _primaryColor
        self.lblWelcome.textColor = .white
        self.lblWelcome.font = _titleFont
        self.lblWelcome.textAlignment = .center
        
        self.btnGetStarted.backgroundColor = _buttonColor
        self.btnGetStarted.addCornerRadius(_corners: _buttonCornerRadius)
        self.btnGetStarted.titleLabel?.font = _buttonFont
    }
    
    func addActionToButton(btnGetStarted_onClick() -> Void) {
        self.btnGetStarted.addTarget(self, action: btnGetStarted_onClick(), for: .touchUpInside)
    }
}
