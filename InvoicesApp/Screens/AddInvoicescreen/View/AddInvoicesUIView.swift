//
//  AddInvoicesUIView.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 09.05.2022.
//

import UIKit

class AddInvoicesUIView: UIView {

    private var invoicesAppHeader = InvoicesAppHeader()
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var invoicesAppTitleField = InvoicesAppField()
    private var invoicesAppDescriptionField = InvoicesAppField()
    private var invoicesAppAddDocumentButton = InvoicesAppButton()
    private var scannedImageView = UIImageView()
    
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
        self.addSubview(self.scrollView)
        self.addSubview(self.contentView)
        self.contentView.addSubview(self.invoicesAppTitleField)
        self.contentView.addSubview(self.invoicesAppDescriptionField)
        self.contentView.addSubview(self.invoicesAppAddDocumentButton)
        self.contentView.addSubview(self.scannedImageView)
    }
    
    func setupConstraints() {
        self.invoicesAppHeader.anchor(top: self.topAnchor,
                                      left: self.leftAnchor,
                                      right: self.rightAnchor,
                                      topConstant: 0,
                                      leftConstant: 0,
                                      rightConstant: 0,
                                      heightConstant: 60 + self.getTopPadding())
        self.scrollView.anchor(top: self.invoicesAppHeader.bottomAnchor,
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
        self.invoicesAppTitleField.anchor(top: self.contentView.topAnchor,
                                          left: self.contentView.leftAnchor,
                                          right: self.contentView.rightAnchor,
                                          topConstant: 10,
                                          leftConstant: 20,
                                          rightConstant: 20,
                                          heightConstant: 86)
        self.invoicesAppDescriptionField.anchor(top: self.invoicesAppTitleField.bottomAnchor,
                                                left: self.contentView.leftAnchor,
                                                right: self.contentView.rightAnchor,
                                                topConstant: 20,
                                                leftConstant: 20,
                                                rightConstant: 20,
                                                heightConstant: 86)
        self.invoicesAppAddDocumentButton.anchor(top: self.invoicesAppDescriptionField.bottomAnchor,
                                                  left: self.contentView.leftAnchor,
                                                  right: self.contentView.rightAnchor,
                                                  topConstant: 20,
                                                  leftConstant: 25,
                                                  rightConstant: 25,
                                                  heightConstant: 60)
        self.scannedImageView.anchor(top: self.invoicesAppAddDocumentButton.bottomAnchor,
                                     left: self.contentView.leftAnchor,
                                     bottom: self.contentView.bottomAnchor,
                                     right: self.contentView.rightAnchor,
                                     topConstant: 10,
                                     leftConstant: 20,
                                     bottomConstant: 10,
                                     rightConstant: 20)
    }
    
    func setupStylingViews() {
        self.invoicesAppTitleField.backgroundColor = .white
        self.invoicesAppTitleField.getInvoicesAppTextField().getField().autocapitalizationType = .words
        
        self.invoicesAppDescriptionField.backgroundColor = .white
        self.invoicesAppDescriptionField.getInvoicesAppTextField().getField().autocapitalizationType = .sentences
        
        self.invoicesAppAddDocumentButton.layer.cornerRadius = 20
    }
    
    func setupBackgroundColors(_color: UIColor, _buttonColor: UIColor) {
        self.invoicesAppHeader.backgroundColor = _color
        self.invoicesAppAddDocumentButton.backgroundColor = _buttonColor
    }
    
    func setupUIColorsAndFonts(_mainFont: UIFont) {
    }
    
    func addActionToScanningButton(_viewController: BaseViewController, btnScanDocument_onClick: Selector) {
        self.invoicesAppAddDocumentButton.addTarget(_viewController, action: btnScanDocument_onClick, for: .touchUpInside)
    }
    
    func getHeaderView() -> InvoicesAppHeader {
        return self.invoicesAppHeader
    }
    
    func getScannedImageView() -> UIImageView {
        return self.scannedImageView
    }
    
    func getTitleField() -> InvoicesAppField {
        return self.invoicesAppTitleField
    }
    
    func getDescriptionField() -> InvoicesAppField {
        return self.invoicesAppDescriptionField
    }
    
    func getSaveDocumentButton() -> InvoicesAppButton {
        return self.invoicesAppAddDocumentButton
    }
}
