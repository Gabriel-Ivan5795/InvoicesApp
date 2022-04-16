//
//  AppleAuthentificationRequest.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 17.04.2022.
//

import UIKit
import Firebase

class AppleAuthentificationRequest: IAuthentificationRequest {
    
    func loginUserOnFirebase(_credentials: AuthCredential?, _authSuccess: @escaping(String) -> Void, _authError: @escaping(String) -> Void) {
        if (_credentials != nil) {
            Auth.auth().signIn(with: _credentials!, completion: { (authResult, error) in
                if (error != nil) {
                    _authError(error?.localizedDescription ?? "An error has occured during login with Apple on Firebase")
                }
                _authSuccess(authResult?.user.refreshToken ?? "")
            })
        } else {
            _authError("An error has occured during login with Apple on Firebase")
        }
    }
}
