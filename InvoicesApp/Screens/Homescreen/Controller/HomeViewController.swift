//
//  HomeViewController.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 30.04.2022.
//

import UIKit

class HomeViewController: BaseViewController {

    var homeUIView = HomeUIView()
    
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
