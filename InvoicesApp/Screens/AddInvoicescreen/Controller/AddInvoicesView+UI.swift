//
//  AddInvoicesView+UI.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 09.05.2022.
//

import UIKit
import LoadingDialog
import InvoicesHelpers

extension AddInvoicesViewController {
    
    func setupBinders() {
        self.addInvoiceViewModel.addInvoiceSuccess.bind { [weak self] result in
            if let result = result {
                print(result as Any)
                self?.navigationController?.popViewController(animated: false)
            }
        }
        
        self.addInvoiceViewModel.addInvoiceError.bind { [weak self] error in
            if let error = error {
                self?.showAlert(_errorMessage: error)
            }
        }
        
        self.addInvoiceViewModel.isLoadingEnabled.bind { [weak self] isLoadingDialog in
            if (isLoadingDialog) {
                LoadingDialog.show(context: self!)
            } else {
                LoadingDialog.hide(context: self!)
            }
        }
    }
}
