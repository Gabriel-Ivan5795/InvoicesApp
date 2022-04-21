//
//  LoginModel.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit
import Firebase

class LoginModel: NSObject {

    var username: String?
    var password: String?
    var authentificationCredentials: AuthCredential?
    
    init(_username: String, _password: String) {
        self.username = _username
        self.password = _password
    }
    
    init(_authentificationCredentials: AuthCredential) {
        self.authentificationCredentials = _authentificationCredentials
    }
}
