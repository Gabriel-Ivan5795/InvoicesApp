//
//  LoginUIView.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 16.04.2022.
//

import UIKit
import InvoicesHelpers

class LoginUIView: UIView {

    private var gradientLayer: CAGradientLayer!
    private var lblLogin = UILabel()
    private var btnLoginWithFacebook = InvoicesAppSocialButton()
    private var btnLoginWithGoogle = InvoicesAppSocialButton()
    private var btnLoginWithApple = InvoicesAppSocialButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradientLayer.anchorPoint = .zero
        self.gradientLayer.bounds = self.bounds
        self.layer.insertSublayer(self.gradientLayer, at: 0)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if (self.superview != nil) {
            self.setupViews()
            self.setupConstraints()
            self.setupStylingViews()
        }
    }
    
    func setupViews() {
        self.addSubview(self.lblLogin)
        self.addSubview(self.btnLoginWithFacebook)
        self.addSubview(self.btnLoginWithGoogle)
        self.addSubview(self.btnLoginWithApple)
    }
    
    func setupConstraints() {
        if #available(macCatalyst 14.0, *) {
            self.lblLogin.anchor(top: self.topAnchor,
                                 left: self.leftAnchor,
                                 right: self.rightAnchor,
                                 topConstant: 50,
                                 leftConstant: 20,
                                 rightConstant: 20,
                                 heightConstant: 25)
        } else {
            self.lblLogin.anchor(top: self.topAnchor,
                                 left: self.leftAnchor,
                                 right: self.rightAnchor,
                                 topConstant: self.getTopPadding() + 10,
                                 leftConstant: 20,
                                 rightConstant: 20,
                                 heightConstant: 25)
        }
        
        self.btnLoginWithFacebook.anchor(left: self.leftAnchor,
                                         bottom: self.btnLoginWithGoogle.topAnchor,
                                         right: self.rightAnchor,
                                         leftConstant: 25,
                                         bottomConstant: 25,
                                         rightConstant: 25,
                                         heightConstant: 60)
        
        self.btnLoginWithGoogle.anchor(top: self.btnLoginWithFacebook.bottomAnchor,
                                       left: self.leftAnchor,
                                       bottom: self.btnLoginWithApple.topAnchor,
                                       right: self.rightAnchor,
                                       topConstant: 25,
                                       leftConstant: 25,
                                       bottomConstant: 25,
                                       rightConstant: 25,
                                       heightConstant: 60)
        
        self.btnLoginWithApple.anchor(top: self.btnLoginWithGoogle.bottomAnchor,
                                      left: self.leftAnchor,
                                      bottom: self.bottomAnchor,
                                      right: self.rightAnchor,
                                      topConstant: 25,
                                      leftConstant: 25,
                                      bottomConstant: 40,
                                      rightConstant: 25,
                                      heightConstant: 60)
    }
    
    func setupStylingViews() {
        self.initGradientLayer()
        self.btnLoginWithApple.tag = 1
    }
    
    func initGradientLayer() {
        self.gradientLayer = GradientHelper.createGradientLayer(colors: [UIColor.init(named: "SecondaryColor")!,
                                                                         UIColor.init(named: "PrimaryColor")!],
                                                                direction: .vertical)
    }
    
    func setupTitleString(_string: String) {
        self.lblLogin.text = _string
    }
    
    func setupTitlesButtons(_facebookTitle: String, _googleTitle: String, _appleTitle: String) {
        self.btnLoginWithFacebook.getLabelButton().text = _facebookTitle
        self.btnLoginWithGoogle.getLabelButton().text = _googleTitle
        self.btnLoginWithApple.getLabelButton().text = _appleTitle
    }
    
    func setupUIColorsAndFonts(_buttonCornerRadius: CGFloat, _titleFont: UIFont, _buttonFont: UIFont) {
        self.lblLogin.textColor = .white
        self.lblLogin.font = _titleFont
        self.lblLogin.textAlignment = .center

        self.btnLoginWithFacebook.addCornerRadius(_corners: _buttonCornerRadius)
        self.btnLoginWithFacebook.getLabelButton().font = _buttonFont
        
        self.btnLoginWithGoogle.addCornerRadius(_corners: _buttonCornerRadius)
        self.btnLoginWithGoogle.getLabelButton().font = _buttonFont
        
        self.btnLoginWithApple.addCornerRadius(_corners: _buttonCornerRadius)
        self.btnLoginWithApple.getLabelButton().font = _buttonFont
        
        self.setupCustomBackgroundAndStylishForFacebookButton()
        self.setupCustomBackgroundAndStylishForGoogleButton()
        self.setupCustomBackgroundAndStylishForAppleButton()
    }

    private func setupCustomBackgroundAndStylishForFacebookButton() {
        self.btnLoginWithFacebook.backgroundColor = .blue
        self.btnLoginWithFacebook.getImageButton().image = UIImage.init(named: "FacebookIcon")
    }
    
    private func setupCustomBackgroundAndStylishForGoogleButton() {
        self.btnLoginWithGoogle.backgroundColor = .red
        self.btnLoginWithGoogle.getImageButton().image = UIImage.init(named: "GoogleIcon")
    }
    
    private func setupCustomBackgroundAndStylishForAppleButton() {
        self.btnLoginWithApple.backgroundColor = .black
        self.btnLoginWithApple.getImageButton().image = UIImage.init(named: "AppleIcon")
    }
    
    func addActionToFacebookButton(_viewController: BaseViewController, btnFacebookSignIn_onClick: Selector) {
        self.btnLoginWithFacebook.addTarget(_viewController, action: btnFacebookSignIn_onClick, for: .touchUpInside)
    }
    
    func addActionToGoogleButton(_viewController: BaseViewController, btnGoogleSignIn_onClick: Selector) {
        self.btnLoginWithGoogle.addTarget(_viewController, action: btnGoogleSignIn_onClick, for: .touchUpInside)
    }
    
    func addActionToAppleButton(_viewController: BaseViewController, btnAppleSignIn_onClick: Selector) {
        self.btnLoginWithApple.addTarget(_viewController, action: btnAppleSignIn_onClick, for: .touchUpInside)
    }
}
