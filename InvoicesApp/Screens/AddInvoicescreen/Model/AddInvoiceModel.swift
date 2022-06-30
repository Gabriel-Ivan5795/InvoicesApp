//
//  AddInvoiceModel.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 29.06.2022.
//

import UIKit
import InvoicesService

class AddInvoiceModel: BaseAddInvoiceModel {

    private var titleInvoice: String!
    private var descriptionInvoice: String!
    private var documentPathInvoice: String?
    
    init(_titleInvoice: String, _descriptionInvoice: String) {
        super.init()
        self.titleInvoice = _titleInvoice
        self.descriptionInvoice = _descriptionInvoice
    }
    
    init(_titleInvoice: String, _descriptionInvoice: String, _documentPathInvoice: String) {
        super.init()
        self.titleInvoice = _titleInvoice
        self.descriptionInvoice = _descriptionInvoice
        self.documentPathInvoice = _documentPathInvoice
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
