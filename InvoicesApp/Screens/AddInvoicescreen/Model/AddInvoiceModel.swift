//
//  AddInvoiceModel.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 29.06.2022.
//

import UIKit

class AddInvoiceModel: Encodable {

    private var title: String!
    private var description: String!
    private var documentPath: String?
    
    init(_title: String, _description: String) {
        self.title = _title
        self.description = _description
    }
    
    init(_title: String, _description: String, _documentPath: String) {
        self.title = _title
        self.description = _description
        self.documentPath = _documentPath
    }
}
