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
        
        self.addInvoicesUIView.getTitleField().getInvoicesAppTextField().getField().delegate = self
        self.addInvoicesUIView.getDescriptionField().getInvoicesAppTextField().getField().delegate = self
    }
    
    func setupButtonsMethods() {
        self.addInvoicesUIView.getTitleField().getInvoicesAppTextField().getField().addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.addInvoicesUIView.getDescriptionField().getInvoicesAppTextField().getField().addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func setupStrings() {
        self.addInvoicesUIView.getHeaderView().setupTitleHeader(_titleString: "Add Invoice")
        self.addInvoicesUIView.getTitleField().getInvoicesAppTextField().setPlaceholder(_string: "Title Invoice")
        self.addInvoicesUIView.getTitleField().setPlaceholderTitle(_string: "Title Invoice")
        self.addInvoicesUIView.getDescriptionField().getInvoicesAppTextField().setPlaceholder(_string: "Description")
        self.addInvoicesUIView.getDescriptionField().setPlaceholderTitle(_string: "Description")
    }
}
