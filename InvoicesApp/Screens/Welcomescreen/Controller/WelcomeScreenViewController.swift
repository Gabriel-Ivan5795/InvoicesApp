//
//  WelcomeScreenViewController.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit
import LoadingDialog

class WelcomeScreenViewController: UIViewController {

    var welcomeViewUI = WelcomeUIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavBar()
        self.setupViews()
        self.setupConstraints()
        self.setupStylingViews()
        self.setupButtonsMethods()
        self.setupStrings()
        
        //just for test
        //LoadingDialog.show(context: self)
    }
}
