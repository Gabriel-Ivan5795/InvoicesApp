//
//  WelcomeUIView.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit
import InvoicesHelpers
import QuartzCore

class WelcomeUIView: UIView {

    private var gradientLayer: CAGradientLayer!
    private var lblWelcome = UILabel()
    var gridViewWelcome = InvoicesAppGridView()
    private var btnGetStarted = InvoicesAppButton()
    
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
            self.setupRegisterCustomCell()
        }
    }
    
    func initGradientLayer() {
        self.gradientLayer = GradientHelper.createGradientLayer(colors: [UIColor.init(named: "SecondaryColor")!,
                                                                         UIColor.init(named: "PrimaryColor")!],
                                                                direction: .vertical)
    }
    
    func setupViews() {
        self.addSubview(self.lblWelcome)
        self.addSubview(self.gridViewWelcome)
        self.addSubview(self.btnGetStarted)
    }
    
    func setupConstraints() {
        if #available(macCatalyst 14.0, *) {
            self.lblWelcome.anchor(top: self.topAnchor,
                                   left: self.leftAnchor,
                                   right: self.rightAnchor,
                                   topConstant: 50,
                                   leftConstant: 25,
                                   rightConstant: 25)
        } else {
            self.lblWelcome.anchor(top: self.topAnchor,
                                   left: self.leftAnchor,
                                   right: self.rightAnchor,
                                   topConstant: self.getTopPadding() + 10,
                                   leftConstant: 25,
                                   rightConstant: 25)
        }
        
        self.gridViewWelcome.anchor(top: self.lblWelcome.bottomAnchor,
                                    left: self.leftAnchor,
                                    bottom: self.btnGetStarted.topAnchor,
                                    right: self.rightAnchor,
                                    topConstant: 60,
                                    leftConstant: 25,
                                    bottomConstant: 60,
                                    rightConstant: 25)
        
        self.btnGetStarted.anchor(left: self.leftAnchor,
                                  bottom: self.bottomAnchor,
                                  right: self.rightAnchor,
                                  leftConstant: 25,
                                  bottomConstant: 40,
                                  rightConstant: 25,
                                  heightConstant: 60)
    }
    
    func setupStylingViews() {
        self.initGradientLayer()
        self.btnGetStarted.tag = 1
        
        self.gridViewWelcome.setupBackgroundColor(_color: UIColor.white)
        self.gridViewWelcome.setupCornerRadiu(_cornerRadius: 20)
        self.gridViewWelcome.setupShadow()
    }
    
    func setupRegisterCustomCell() {
        self.gridViewWelcome.registerCollectionViewCell(_type: WelcomePageItemCell.self,
                                                        _reuseIdentifier: "WelcomePageItemCell")
    }
    
    func setupWelcomeString(_string: String) {
        self.lblWelcome.text = _string
    }
    
    func setupButtonText(_string: String) {
        self.btnGetStarted.setTitle(_string, for: .normal)
    }
    
    func setupUIColorsAndFonts(_buttonCornerRadius: CGFloat, _titleFont: UIFont, _buttonFont: UIFont) {
        self.lblWelcome.textColor = .white
        self.lblWelcome.font = _titleFont
        self.lblWelcome.textAlignment = .center
    
        self.btnGetStarted.addCornerRadius(_corners: _buttonCornerRadius)
        self.btnGetStarted.titleLabel?.font = _buttonFont
        self.btnGetStarted.initGradientLayer()
    }
    
    func setupDelegatesCollectionViewAndDataSource(_viewController: WelcomeScreenViewController) {
        self.gridViewWelcome.getCollectionView().dataSource = _viewController
        self.gridViewWelcome.getCollectionView().delegate = _viewController
    }
    
    func addActionToButton(_viewController: UIViewController, btnGetStarted_onClick: Selector) {
        self.btnGetStarted.addTarget(_viewController, action: btnGetStarted_onClick, for: .touchUpInside)
    }
    
//    func getInvoicesAppGridView() -> InvoicesAppGridView {
//        return self.getInvoicesAppGridView()
//    }
}
