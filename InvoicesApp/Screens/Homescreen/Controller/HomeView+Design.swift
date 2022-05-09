//
//  HomeView+Design.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 30.04.2022.
//

import UIKit

extension HomeViewController: BaseInterface {
    
    func setupNavBar() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.homeUIView)
    }
    
    func setupConstraints() {
        self.homeUIView.anchor(top: self.view.topAnchor,
                               left: self.view.leftAnchor,
                               bottom: self.view.bottomAnchor,
                               right: self.view.rightAnchor,
                               topConstant: 0,
                               leftConstant: 0,
                               bottomConstant: 0,
                               rightConstant: 0)
    }
    
    func setupStylingViews() {
        self.homeUIView.setupBackgroundColors(_color: UIColor.init(named: "PrimaryColor")!)
    }
    
    func setupButtonsMethods() {
        self.homeUIView.addActionToCreateFabButton(_viewController: self, btnCreateInvoice_onClick: #selector(btnCreateInvoice_onClick))
        self.homeUIView.addActionToLogoutButton(_viewController: self, btnLogout_onClick: #selector(btnLogout_onClick))
    }
    
    func setupStrings() {
        self.homeUIView.getHeaderView().setupTitleHeader(_titleString: "Home")
    }
}
