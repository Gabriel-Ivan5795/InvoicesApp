//
//  IAuthentificationRequest.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 17.04.2022.
//

import Foundation
import FirebaseAuth

protocol IAuthentificationRequest {
    
    func loginUserOnFirebase(_credentials: AuthCredential?, _authSuccess: @escaping(String) -> Void, _authError: @escaping(String) -> Void)
}
