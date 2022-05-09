//
//  AddInvoicesViewController.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 09.05.2022.
//

import UIKit
import VisionKit

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
        
        if #available(iOS 13.0, *) {
            let scanner = VNDocumentCameraViewController()
            scanner.delegate = self
            self.present(scanner, animated: true)
        } else {
            self.showAlert(_errorMessage: "You cannot scann a document because this function need an iOS software update to version 13 or newer.")
        }
    }
}
