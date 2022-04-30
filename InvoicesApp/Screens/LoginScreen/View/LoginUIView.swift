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
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var txtUsername = InvoicesAppField()
    private var txtPassword = InvoicesAppField()
    private var btnLogin = InvoicesAppButton()
    private var btnLoginWithTwitter = InvoicesAppSocialButton()
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
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.txtUsername)
        self.contentView.addSubview(self.txtPassword)
        self.contentView.addSubview(self.btnLogin)
        self.contentView.addSubview(self.btnLoginWithTwitter)
        self.contentView.addSubview(self.btnLoginWithFacebook)
        self.contentView.addSubview(self.btnLoginWithGoogle)
        self.contentView.addSubview(self.btnLoginWithApple)
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
        
        self.scrollView.anchor(top: self.lblLogin.bottomAnchor,
                               left: self.leftAnchor,
                               bottom: self.bottomAnchor,
                               right: self.rightAnchor,
                               topConstant: 10,
                               leftConstant: 0,
                               bottomConstant: 10,
                               rightConstant: 0)
        self.contentView.anchor(top: self.scrollView.topAnchor,
                                left: self.scrollView.leftAnchor,
                                bottom: self.scrollView.bottomAnchor,
                                right: self.scrollView.rightAnchor,
                                topConstant: 0,
                                leftConstant: 0,
                                bottomConstant: 0,
                                rightConstant: 0)
        
        self.contentView.anchorToCenterX(centerX: self.scrollView.centerXAnchor)
        
        self.txtUsername.anchor(top: self.contentView.topAnchor,
                                left: self.contentView.leftAnchor,
                                bottom: self.txtPassword.topAnchor,
                                right: self.contentView.rightAnchor,
                                topConstant: 40,
                                leftConstant: 25,
                                bottomConstant: 25,
                                rightConstant: 25,
                                heightConstant: 86)
        self.txtPassword.anchor(top: self.txtUsername.bottomAnchor,
                                left: self.contentView.leftAnchor,
                                bottom: self.btnLogin.topAnchor,
                                right: self.contentView.rightAnchor,
                                topConstant: 25,
                                leftConstant: 25,
                                bottomConstant: 25,
                                rightConstant: 25,
                                heightConstant: 86)
        
        self.btnLogin.anchor(top: self.txtPassword.bottomAnchor,
                                left: self.contentView.leftAnchor,
                                bottom: self.btnLoginWithTwitter.topAnchor,
                                right: self.contentView.rightAnchor,
                                topConstant: 25,
                                leftConstant: 25,
                                bottomConstant: 25,
                                rightConstant: 25,
                                heightConstant: 60)
        
        self.btnLoginWithTwitter.anchor(top: self.btnLogin.bottomAnchor,
                                        left: self.contentView.leftAnchor,
                                        bottom: self.btnLoginWithFacebook.topAnchor,
                                        right: self.contentView.rightAnchor,
                                        topConstant: 25,
                                        leftConstant: 25,
                                        bottomConstant: 25,
                                        rightConstant: 25,
                                        heightConstant: 60)
        
        self.btnLoginWithFacebook.anchor(top: self.btnLoginWithTwitter.bottomAnchor,
                                         left: self.contentView.leftAnchor,
                                         bottom: self.btnLoginWithGoogle.topAnchor,
                                         right: self.contentView.rightAnchor,
                                         topConstant: 25,
                                         leftConstant: 25,
                                         bottomConstant: 25,
                                         rightConstant: 25,
                                         heightConstant: 60)
        
        self.btnLoginWithGoogle.anchor(top: self.btnLoginWithFacebook.bottomAnchor,
                                       left: self.contentView.leftAnchor,
                                       bottom: self.btnLoginWithApple.topAnchor,
                                       right: self.contentView.rightAnchor,
                                       topConstant: 25,
                                       leftConstant: 25,
                                       bottomConstant: 25,
                                       rightConstant: 25,
                                       heightConstant: 60)
        
        self.btnLoginWithApple.anchor(top: self.btnLoginWithGoogle.bottomAnchor,
                                      left: self.contentView.leftAnchor,
                                      bottom: self.contentView.bottomAnchor,
                                      right: self.contentView.rightAnchor,
                                      topConstant: 25,
                                      leftConstant: 25,
                                      bottomConstant: 40,
                                      rightConstant: 25,
                                      heightConstant: 60)
    }
    
    func setupStylingViews() {
        self.initGradientLayer()
        self.btnLoginWithApple.tag = 1
        self.btnLoginWithGoogle.tag = 2
        self.btnLoginWithFacebook.tag = 3
        self.btnLoginWithTwitter.tag = 4
        
        self.btnLogin.tag = 5
        
        self.txtUsername.backgroundColor = .white
        self.txtUsername.getInvoicesAppTextField().getField().autocapitalizationType = .none
        self.txtUsername.getInvoicesAppTextField().getField().keyboardType = .emailAddress
        self.txtPassword.backgroundColor = .white
        self.txtPassword.getInvoicesAppTextField().getField().isSecureTextEntry = true
    }
    
    func initGradientLayer() {
        self.gradientLayer = GradientHelper.createGradientLayer(colors: [UIColor.init(named: "SecondaryColor")!,
                                                                         UIColor.init(named: "PrimaryColor")!],
                                                                direction: .vertical)
    }
    
    func setupTitleString(_string: String) {
        self.lblLogin.text = _string
    }
    
    func setupTitlesButtons(_twitterTitle: String, _facebookTitle: String, _googleTitle: String, _appleTitle: String) {
        self.btnLoginWithTwitter.getLabelButton().text = _twitterTitle
        self.btnLoginWithFacebook.getLabelButton().text = _facebookTitle
        self.btnLoginWithGoogle.getLabelButton().text = _googleTitle
        self.btnLoginWithApple.getLabelButton().text = _appleTitle
    }
    
    func setupLoginButtonTitle(_string: String) {
        self.btnLogin.setTitle(_string, for: .normal)
    }
    
    func setupUIColorsAndFonts(_buttonCornerRadius: CGFloat, _titleFont: UIFont, _buttonFont: UIFont) {
        self.lblLogin.textColor = .white
        self.lblLogin.font = _titleFont
        self.lblLogin.textAlignment = .center
        
        self.btnLogin.titleLabel?.font = _buttonFont
        self.btnLogin.setTitleColor(.white, for: .normal)

        self.btnLoginWithTwitter.addCornerRadius(_corners: _buttonCornerRadius)
        self.btnLoginWithTwitter.getLabelButton().font = _buttonFont
        self.btnLoginWithTwitter.getLabelButton().textColor = .white
        
        self.btnLoginWithFacebook.addCornerRadius(_corners: _buttonCornerRadius)
        self.btnLoginWithFacebook.getLabelButton().font = _buttonFont
        self.btnLoginWithFacebook.getLabelButton().textColor = .white
        
        self.btnLoginWithGoogle.addCornerRadius(_corners: _buttonCornerRadius)
        self.btnLoginWithGoogle.getLabelButton().font = _buttonFont
        self.btnLoginWithGoogle.getLabelButton().textColor = .white
        
        self.btnLoginWithApple.addCornerRadius(_corners: _buttonCornerRadius)
        self.btnLoginWithApple.getLabelButton().font = _buttonFont
        self.btnLoginWithApple.getLabelButton().textColor = .white
        
        self.setupCustomBackgroundAndStylishForLoginButton()
        self.setupCustomBackgroundAndStylishForTwitterButton()
        self.setupCustomBackgroundAndStylishForFacebookButton()
        self.setupCustomBackgroundAndStylishForGoogleButton()
        self.setupCustomBackgroundAndStylishForAppleButton()
    }
    
    func getUsernameValue() -> String {
        return self.txtUsername.getInvoicesAppTextField().getContentField()
    }
    
    func getUsernameField() -> InvoicesAppField {
        return self.txtUsername
    }
    
    func getPasswordValue() -> String {
        return self.txtPassword.getInvoicesAppTextField().getContentField()
    }
    
    func getPasswordField() -> InvoicesAppField {
        return self.txtPassword
    }
    
    private func setupCustomBackgroundAndStylishForLoginButton() {
        self.btnLogin.addCornerRadius(_corners: 20)
        self.btnLogin.initGradientLayer()
    }
    
    private func setupCustomBackgroundAndStylishForTwitterButton() {
        self.btnLoginWithTwitter.backgroundColor = .systemBlue
        self.btnLoginWithTwitter.getImageButton().image = UIImage.init(named: "TwitterIcon")
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
    
    func addActionToTwitterButton(_viewController: BaseViewController, btnTwitterSignIn_onClick: Selector) {
        self.btnLoginWithTwitter.addTarget(_viewController, action: btnTwitterSignIn_onClick, for: .touchUpInside)
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
    
    func addActionToCustomLoginButton(_viewController: BaseViewController, btnLogin_onClick: Selector) {
        self.btnLogin.addTarget(_viewController, action: btnLogin_onClick, for: .touchUpInside)
    }
}
