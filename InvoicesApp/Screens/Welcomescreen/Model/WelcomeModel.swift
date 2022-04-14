//
//  WelcomeModel.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 14.04.2022.
//

import UIKit

class WelcomeModel: NSObject {

    private var image: UIImage?
    
    init(_image: UIImage?) {
        self.image = _image
    }
    
    func getImage() -> UIImage? {
        return self.image
    }
}
