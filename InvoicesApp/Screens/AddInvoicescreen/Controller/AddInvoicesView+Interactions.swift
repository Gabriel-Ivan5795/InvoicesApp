//
//  AddInvoicesView+Interactions.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 09.05.2022.
//

import UIKit

extension AddInvoicesViewController {
    
    @objc func btnBack_onClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnScanDocument_onClick() {
        if (self.addInvoicesUIView.getTitleField().getInvoicesAppTextField().getContentField().isValid() == false) {
            self.showAlert(_errorMessage: "Add Invoice Title")
            return
        }
        
        if (self.addInvoicesUIView.getDescriptionField().getInvoicesAppTextField().getContentField().isValid() == false) {
            self.showAlert(_errorMessage: "Add Invoice Description")
            return
        }
        
        if (self.addInvoicesUIView.getScannedImageView().image != nil) {
            let addInvoiceModel = AddInvoiceModel.init(_title: self.addInvoicesUIView.getTitleField().getInvoicesAppTextField().getContentField(),
                                                       _description: self.addInvoicesUIView.getDescriptionField().getInvoicesAppTextField().getContentField())
            self.addInvoiceViewModel.storeInvoice(_addInvoiceModel: addInvoiceModel)
        } else {
            let addInvoiceModel = AddInvoiceModel.init(_title: self.addInvoicesUIView.getTitleField().getInvoicesAppTextField().getContentField(),
                                                       _description: self.addInvoicesUIView.getDescriptionField().getInvoicesAppTextField().getContentField())
            self.addInvoiceViewModel.storeInvoice(_addInvoiceModel: addInvoiceModel)
        }
    }
}
