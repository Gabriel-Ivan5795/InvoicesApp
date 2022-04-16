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
        self.welcomeViewUI.setupUIColorsAndFonts(_buttonCornerRadius: 20,
                                                 _titleFont: UIFont.init(name: "Roboto-Bold", size: 24)!,
                                                 _buttonFont: UIFont.init(name: "Roboto-Bold", size: 14)!)
        self.welcomeViewUI.setupDelegatesCollectionViewAndDataSource(_viewController: self)
    }
    
    func setupButtonsMethods() {
        self.welcomeViewUI.addActionToButton(_viewController: self, btnGetStarted_onClick: #selector(btnGetStarted_onClick))
    }
    
    func setupStrings() {
        self.welcomeViewUI.setupWelcomeString(_string: "WELCOME")
        self.welcomeViewUI.setupButtonText(_string: "Get Started")
    }
}
