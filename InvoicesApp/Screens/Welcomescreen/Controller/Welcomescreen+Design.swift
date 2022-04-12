//
//  Welcomescreen+Design.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit
import InvoicesHelpers

extension WelcomeScreenViewController: BaseInterface {
    
    func setupNavBar() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func setupViews() {
        self.view.addSubview(self.welcomeViewUI)
    }
    
    func setupConstraints() {
        self.welcomeViewUI.anchor(top: self.view.topAnchor,
                                  left: self.view.leftAnchor,
                                  bottom: self.view.bottomAnchor,
                                  right: self.view.rightAnchor)
    }
    
    func setupStylingViews() {
        self.welcomeViewUI.setupUIColorsAndFonts(_primaryColor: UIColor.init(named: "PrimaryColor")!,
                                                 _buttonColor: .red,
                                                 _buttonCornerRadius: 20)
    }
    
    func setupButtonsMethods() {
        
    }
    
    func setupStrings() {
        self.welcomeViewUI.setupWelcomeString(_string: "Welcome")
    }
}
