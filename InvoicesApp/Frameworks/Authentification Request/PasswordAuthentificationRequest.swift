//
//  PasswordAuthentificationRequest.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 21.04.2022.
//

import UIKit
import Firebase

class PasswordAuthentificationRequest: IAuthentificationRequest {
    
    func loginUserOnFirebase(_loginModel: LoginModel?, _authSuccess: @escaping (String) -> Void, _authError: @escaping (String) -> Void) {
        if (_loginModel?.username?.isValid() == true && _loginModel?.password?.isValid() == true) {
            Auth.auth().createUser(withEmail: (_loginModel?.username)!, password: (_loginModel?.password)!, completion: { authResult, error in
                if (error != nil) {
                    _authError(error?.localizedDescription ?? "An error has occured during login on Firebase")
                }
                _authSuccess(authResult?.user.refreshToken ?? "")
            })
        } else {
            _authError("An error has occured during Sign in using Firebase")
        }
    }
}
