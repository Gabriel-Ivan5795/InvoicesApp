//
//  AddInvoicesViewController.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 09.05.2022.
//

import UIKit
import VisionKit
import InvoicesHelpers
import InvoicesAppConstants

class AddInvoicesViewController: BaseViewController {

    var addInvoicesUIView = AddInvoicesUIView()
    var addInvoiceViewModel = AddInvoiceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavBar()
        self.setupViews()
        self.setupConstraints()
        self.setupStylingViews()
        self.setupButtonsMethods()
        self.setupStrings()
        self.setupBinders()
        print(SafeHelper.getAccessToken(_accessTokenKey: InvoicesAppConstants.keyInvoicesAppFirebaseLoginToken))
        print(SafeHelper.getCustomValueForKey(_key: InvoicesAppConstants.keyInvoicesAppFirebaseLoginUUID))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.startScanningDocument()
    }
    
    func startScanningDocument() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            if #available(iOS 13.0, *) {
                let scanner = VNDocumentCameraViewController()
                scanner.delegate = self
                self.present(scanner, animated: true)
            } else {
                self.showAlert(_errorMessage: "You cannot scann a document because this function need an iOS software update to version 13 or newer.")
            }
        } else {
            self.showAlert(_errorMessage: "Your device does not support camera to scan the document.\nMaybe you can save a document without scanned file")
        }
    }
}
