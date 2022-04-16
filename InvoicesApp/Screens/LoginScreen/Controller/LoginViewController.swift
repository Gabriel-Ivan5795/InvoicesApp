//
//  LoginViewController.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit

class LoginViewController: BaseViewController {

    var loginViewUI = LoginUIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavBar()
        self.setupViews()
        self.setupConstraints()
        self.setupStylingViews()
        self.setupButtonsMethods()
        self.setupStrings()
    }
}
