//
//  WelcomePageItemCell.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 14.04.2022.
//

import UIKit

class WelcomePageItemCell: InvoicesAppCollectionViewCell {
    
    var imageViewPage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageViewPage = UIImageView()
        self.addSubview(self.imageViewPage)
        self.imageViewPage.contentMode = .scaleAspectFill
        
        self.imageViewPage.anchor(top: self.topAnchor,
                                  left: self.leftAnchor,
                                  bottom: self.bottomAnchor,
                                  right: self.rightAnchor,
                                  topConstant: 20,
                                  leftConstant: 20,
                                  bottomConstant: 20,
                                  rightConstant: 20)
    }
    
    func setupCustomItemCell(_welcomeModel: WelcomeModel) -> WelcomePageItemCell {
        self.imageViewPage.image = _welcomeModel.getImage()
        
        return self
    }
}
