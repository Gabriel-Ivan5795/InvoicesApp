//
//  LoginModel.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit
import Firebase
import InvoicesService

class LoginModel: BaseLoginModel {

    var username: String?
    var password: String?
    var authentificationCredentials: AuthCredential?
    
    init(_username: String, _password: String) {
        super.init()
        self.username = _username
        self.password = _password
    }
    
    init(_authentificationCredentials: AuthCredential) {
        super.init()
        self.authentificationCredentials = _authentificationCredentials
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
