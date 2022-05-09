//
//  AddInvoicesView+Design.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 09.05.2022.
//

import UIKit

extension AddInvoicesViewController: BaseInterface {
    
    func setupNavBar() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    func setupViews() {
        self.view.addSubview(self.addInvoicesUIView)
    }
    
    func setupConstraints() {
        self.addInvoicesUIView.anchor(top: self.view.topAnchor,
                                      left: self.view.leftAnchor,
                                      bottom: self.view.bottomAnchor,
                                      right: self.view.rightAnchor,
                                      topConstant: 0,
                                      leftConstant: 0,
                                      bottomConstant: 0,
                                      rightConstant: 0)
    }
    
    func setupStylingViews() {
        self.view.backgroundColor = .white
        self.addInvoicesUIView.setupBackgroundColors(_color: UIColor.init(named: "PrimaryColor")!)
        
        self.addInvoicesUIView.getHeaderView().hideRightButton()
        self.addInvoicesUIView.getHeaderView().getButtonLeft().setupImageView(_imageName: "ImgBack")
    }
    
    func setupButtonsMethods() {
        
    }
    
    func setupStrings() {
        self.addInvoicesUIView.getHeaderView().setupTitleHeader(_titleString: "Add Invoice")
    }
}
