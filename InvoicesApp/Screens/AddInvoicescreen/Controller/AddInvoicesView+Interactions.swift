//
//  AddInvoicesView+Interactions.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 09.05.2022.
//

import UIKit
import VisionKit

extension AddInvoicesViewController {
    
    @objc func btnScanDocument_onClick() {
        if #available(iOS 13.0, *) {
            let scanner = VNDocumentCameraViewController()
            scanner.delegate = self
            self.present(scanner, animated: true)
        } else {
            self.showAlert(_errorMessage: "You cannot scann a document because this function need an iOS software update to version 13 or newer.")
        }
    }
}
