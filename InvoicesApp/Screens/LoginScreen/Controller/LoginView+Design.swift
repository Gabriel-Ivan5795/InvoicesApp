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
        self.loginViewUI.addActionToTwitterButton(_viewController: self, btnTwitterSignIn_onClick: #selector(btnTwitterSignIn_onClick))
        self.loginViewUI.addActionToFacebookButton(_viewController: self, btnFacebookSignIn_onClick: #selector(btnFacebookSignIn_onClick))
        self.loginViewUI.addActionToGoogleButton(_viewController: self, btnGoogleSignIn_onClick: #selector(btnGoogleSignIn_onClick))
        self.loginViewUI.addActionToAppleButton(_viewController: self, btnAppleSignIn_onClick: #selector(btnAppleSignIn_onClick))
        self.loginViewUI.addActionToCustomLoginButton(_viewController: self, btnLogin_onClick: #selector(btnLogin_onClick))
        self.loginViewUI.getUsernameField().getInvoicesAppTextField().getField().addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.loginViewUI.getPasswordField().getInvoicesAppTextField().getField().addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func setupStrings() {
        self.loginViewUI.setupTitleString(_string: "LOGIN")
        
        self.loginViewUI.setupTitlesButtons(_twitterTitle: "Sign in with Twitter",
                                            _facebookTitle: "Sign in with Facebook",
                                            _googleTitle: "Sign in with Google",
                                            _appleTitle: "Sign in with Apple")
        
        self.loginViewUI.getUsernameField().getInvoicesAppTextField().setPlaceholder(_string: "Username")
        self.loginViewUI.getUsernameField().setPlaceholderTitle(_string: "Username")
        self.loginViewUI.getPasswordField().getInvoicesAppTextField().setPlaceholder(_string: "Password")
        self.loginViewUI.getPasswordField().setPlaceholderTitle(_string: "Password")
        
        self.loginViewUI.setupLoginButtonTitle(_string: "Login")
    }
}
