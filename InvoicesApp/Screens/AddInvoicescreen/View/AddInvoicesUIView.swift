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
    private var invoicesAppScanDocumentButton = InvoicesAppButton()
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
        self.scannedImageView.anchor(top: self.invoicesAppDescriptionField.bottomAnchor,
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
    }
    
    func setupBackgroundColors(_color: UIColor) {
        self.invoicesAppHeader.backgroundColor = _color
    }
    
    func setupUIColorsAndFonts(_mainFont: UIFont) {
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
}
