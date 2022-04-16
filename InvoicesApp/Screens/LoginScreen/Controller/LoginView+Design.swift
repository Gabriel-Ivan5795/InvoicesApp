//
//  LoginView+Design.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 16.04.2022.
//

import UIKit

extension LoginViewController: BaseInterface {
    
    func setupNavBar() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func setupViews() {
        self.view.addSubview(self.loginViewUI)
    }
    
    func setupConstraints() {
        self.loginViewUI.anchor(top: self.view.topAnchor,
                                left: self.view.leftAnchor,
                                bottom: self.view.bottomAnchor,
                                right: self.view.rightAnchor)
    }
    
    func setupStylingViews() {
        self.loginViewUI.setupUIColorsAndFonts(_buttonCornerRadius: 20,
                                               _titleFont: UIFont.init(name: "Roboto-Bold", size: 24)!,
                                               _buttonFont: UIFont.init(name: "Roboto-Bold", size: 14)!)
    }
    
    func setupButtonsMethods() {
        
    }
    
    func setupStrings() {
        self.loginViewUI.setupTitleString(_string: "LOGIN")
    }
}
