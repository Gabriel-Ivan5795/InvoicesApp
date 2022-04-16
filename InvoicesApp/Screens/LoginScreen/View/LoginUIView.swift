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
    private var btnLoginWithApple = InvoicesAppButton()
    
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
    
    func initGradientLayer() {
        self.gradientLayer = GradientHelper.createGradientLayer(colors: [UIColor.init(named: "SecondaryColor")!,
                                                                         UIColor.init(named: "PrimaryColor")!],
                                                                direction: .vertical)
    }
    
    func setupViews() {
        self.addSubview(self.lblLogin)
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
    }
    
    func setupStylingViews() {
        self.initGradientLayer()
        self.btnLoginWithApple.tag = 1
    }
    
    func setupTitleString(_string: String) {
        self.lblLogin.text = _string
    }
    
    func setupUIColorsAndFonts(_buttonCornerRadius: CGFloat, _titleFont: UIFont, _buttonFont: UIFont) {
        self.lblLogin.textColor = .white
        self.lblLogin.font = _titleFont
        self.lblLogin.textAlignment = .center
    
        self.btnLoginWithApple.addCornerRadius(_corners: _buttonCornerRadius)
        self.btnLoginWithApple.titleLabel?.font = _buttonFont
        self.btnLoginWithApple.initGradientLayer()
    }
}
