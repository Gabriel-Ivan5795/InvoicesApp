//
//  AddInvoicesUIView.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 09.05.2022.
//

import UIKit

class AddInvoicesUIView: UIView {

    private var invoicesAppHeader = InvoicesAppHeader()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if (self.superview != nil) {
            
            self.setupViews()
            self.setupConstraints()
        }
    }
    
    func setupViews() {
        self.addSubview(self.invoicesAppHeader)
    }
    
    func setupConstraints() {
        self.invoicesAppHeader.anchor(top: self.topAnchor,
                                      left: self.leftAnchor,
                                      right: self.rightAnchor,
                                      topConstant: 0,
                                      leftConstant: 0,
                                      rightConstant: 0,
                                      heightConstant: 60 + self.getTopPadding())
    }
    
    func setupBackgroundColors(_color: UIColor) {
        self.invoicesAppHeader.backgroundColor = _color
    }
    
    func getHeaderView() -> InvoicesAppHeader {
        return self.invoicesAppHeader
    }
}
