//
//  TwitterAuthentificationRequest.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 18.04.2022.
//

import UIKit
import Firebase

class TwitterAuthentificationRequest: IAuthentificationRequest {
    
    func loginUserOnFirebase(_loginModel: LoginModel?, _authSuccess: @escaping (String) -> Void, _authError: @escaping (String) -> Void) {
        if (_loginModel?.authentificationCredentials != nil) {
            Auth.auth().signIn(with: (_loginModel?.authentificationCredentials)!, completion: { (authResult, error) in
                if (error != nil) {
                    _authError(error?.localizedDescription ?? "An error has occured during Twitter Sign in using Firebase")
                }
                _authSuccess(authResult?.user.refreshToken ?? "")
            })
        } else {
            _authError("An error has occured during Twitter Sign in using Firebase")
        }
    }
}
