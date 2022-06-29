//
//  AddInvoiceViewModel.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 29.06.2022.
//

import UIKit
import InvoicesHelpers

class AddInvoiceViewModel {

    var addInvoiceSuccess: ObservableHelper<String?> = ObservableHelper(nil)
    var addInvoiceError: ObservableHelper<String?> = ObservableHelper(nil)
    var isLoadingEnabled: ObservableHelper<Bool> = ObservableHelper(false)
    
    func storeInvoice(_addInvoiceModel: AddInvoiceModel) {
        self.isLoadingEnabled.value = true
        AddInvoiceRequest().addInvoiceOnFirebase(_invoiceModel: _addInvoiceModel, _addingResult: { addingSuccess in
            self.isLoadingEnabled.value = false
            self.addInvoiceSuccess.value = addingSuccess
        }, _addingError: { addingError in
            self.isLoadingEnabled.value = false
            self.addInvoiceError.value = addingError
        })
    }
}
