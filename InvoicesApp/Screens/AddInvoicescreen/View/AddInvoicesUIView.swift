//
//  AddInvoicesUIView.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 09.05.2022.
//

import UIKit

class AddInvoicesUIView: UIView {

    private var invoicesAppHeader = InvoicesAppHeader()
    private var scannedImageView = UIImageView()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if (self.superview != nil) {
            
            self.setupViews()
            self.setupConstraints()
        }
    }
    
    func setupViews() {
        self.addSubview(self.invoicesAppHeader)
        self.addSubview(self.scannedImageView)
    }
    
    func setupConstraints() {
        self.invoicesAppHeader.anchor(top: self.topAnchor,
                                      left: self.leftAnchor,
                                      right: self.rightAnchor,
                                      topConstant: 0,
                                      leftConstant: 0,
                                      rightConstant: 0,
                                      heightConstant: 60 + self.getTopPadding())
        self.scannedImageView.anchor(top: self.invoicesAppHeader.bottomAnchor,
                                     left: self.leftAnchor,
                                     bottom: self.bottomAnchor,
                                     right: self.rightAnchor,
                                     topConstant: 20,
                                     leftConstant: 20,
                                     bottomConstant: 20,
                                     rightConstant: 20)
    }
    
    func setupBackgroundColors(_color: UIColor) {
        self.invoicesAppHeader.backgroundColor = _color
    }
    
    func getHeaderView() -> InvoicesAppHeader {
        return self.invoicesAppHeader
    }
    
    func getScannedImageView() -> UIImageView {
        return self.scannedImageView
    }
}
