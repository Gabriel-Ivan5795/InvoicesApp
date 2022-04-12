//
//  WelcomeScreenViewController.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit
import LoadingDialog
import InvoicesHelpers

class WelcomeScreenViewController: BaseViewController {

    var welcomeViewUI = WelcomeUIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavBar()
        self.setupViews()
        self.setupConstraints()
        self.setupStylingViews()
        self.setupButtonsMethods()
        self.setupStrings()
        
        UtilsHelper.printFonts()
        //just for test
        //LoadingDialog.show(context: self)
    }
}
