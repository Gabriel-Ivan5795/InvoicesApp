//
//  AddInvoicesViewController.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 09.05.2022.
//

import UIKit

class AddInvoicesViewController: BaseViewController {

    var addInvoicesUIView = AddInvoicesUIView()
    
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
