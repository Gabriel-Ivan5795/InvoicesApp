//
//  IAddInvoiceRequest.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 29.06.2022.
//

import Foundation

protocol IAddInvoiceRequest {
    
    func addInvoiceOnFirebase(_invoiceModel: AddInvoiceModel, _addingResult: @escaping(String) -> Void, _addingError: @escaping(String) -> Void)
}
