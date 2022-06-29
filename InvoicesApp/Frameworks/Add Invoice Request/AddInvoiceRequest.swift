//
//  AddInvoiceRequest.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 29.06.2022.
//

import UIKit
import Firebase
import InvoicesAppConstants
import InvoicesHelpers

class AddInvoiceRequest: IAddInvoiceRequest {

    static var dbContext: Firestore!
    
    func addInvoiceOnFirebase(_invoiceModel: AddInvoiceModel, _addingResult: @escaping (String) -> Void, _addingError: @escaping (String) -> Void) {
        AddInvoiceRequest.dbContext = FirebaseConfig.getDatabaseInstance()
        var ref: DocumentReference? = nil
        let pathToAddInvoiceModel = String.init(format: "%@/%@",
                                                InvoiceAppFirebasePathConstants.keyInvoicesModels,
                                                SafeHelper.getCustomValueForKey(_key: InvoicesAppConstants.keyInvoicesAppFirebaseLoginUUID))
        do {
            ref = try AddInvoiceRequest.dbContext.collection(pathToAddInvoiceModel).addDocument(data: _invoiceModel.asDictionary()) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                    _addingError(err.localizedDescription)
                } else{
                    print("Document added with ID: \(ref!.documentID)")
                    _addingResult(ref!.documentID)
                }
            }
        } catch let exception {
            _addingError(exception.localizedDescription)
        }
    }
}
