//
//  LoginViewController.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit
import AuthenticationServices

class LoginViewController: BaseViewController {

    var loginViewUI = LoginUIView()
    var loginViewModel = LoginViewModel()
    open var currentNonce: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavBar()
        self.setupViews()
        self.setupConstraints()
        self.setupStylingViews()
        self.setupButtonsMethods()
        self.setupStrings()
        self.setupBinders()
        self.setupTestCredentials()
    }
}
