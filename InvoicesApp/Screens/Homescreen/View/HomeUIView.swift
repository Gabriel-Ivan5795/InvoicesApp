//
//  HomeUIView.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 30.04.2022.
//

import UIKit
import MaterialComponents.MaterialButtons

class HomeUIView: UIView {

    private var invoicesAppHeader = InvoicesAppHeader()
    private var invoicesAppFabButton = MDCFloatingButton()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if (self.superview != nil) {
            self.setupViews()
            self.setupConstraints()
            self.setupStylingViews()
        }
    }
    
    func setupViews() {
        self.addSubview(self.invoicesAppHeader)
        self.addSubview(self.invoicesAppFabButton)
    }
    
    func setupConstraints() {
        self.invoicesAppHeader.anchor(top: self.topAnchor,
                                      left: self.leftAnchor,
                                      right: self.rightAnchor,
                                      topConstant: 0,
                                      leftConstant: 0,
                                      rightConstant: 0,
                                      heightConstant: self.getTopPadding() + 80)
        self.invoicesAppFabButton.anchor(bottom: self.bottomAnchor,
                                      right: self.rightAnchor,
                                      bottomConstant: 30,
                                      rightConstant: 30,
                                      widthConstant: 60,
                                      heightConstant: 60)
    }
    
    func setupStylingViews() {
        self.invoicesAppFabButton.minimumSize = CGSize(width: 64, height: 48)
        self.invoicesAppFabButton.accessibilityLabel = "Create"
    }
    
    func setupBackgroundColors(_color: UIColor) {
        self.invoicesAppHeader.backgroundColor = _color
        self.invoicesAppFabButton.backgroundColor = _color
    }
    
    func addActionToLogoutButton(_viewController: BaseViewController, btnLogout_onClick: Selector) {
        self.invoicesAppHeader.getButtonLeft().addTarget(_viewController, action: btnLogout_onClick, for: .touchUpInside)
    }
    
    func addActionToCreateFabButton(_viewController: BaseViewController, btnCreateInvoice_onClick: Selector) {
        self.invoicesAppFabButton.addTarget(_viewController, action: btnCreateInvoice_onClick, for: .touchUpInside)
    }
    
    func getHeaderView() -> InvoicesAppHeader {
        return self.invoicesAppHeader
    }
}
