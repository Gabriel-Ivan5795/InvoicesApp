//
//  AppleAuthentificationRequest.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 17.04.2022.
//

import UIKit
import Firebase

class AppleAuthentificationRequest: IAuthentificationRequest {
    
    func loginUserOnFirebase(_loginModel: LoginModel?, _authSuccess: @escaping (LoginResponseModel) -> Void, _authError: @escaping (String) -> Void) {
        if (_loginModel?.authentificationCredentials != nil) {
            Auth.auth().signIn(with: (_loginModel?.authentificationCredentials)!, completion: { (authResult, error) in
                if (error != nil) {
                    _authError(error?.localizedDescription ?? "An error has occured during login with Apple on Firebase")
                }
                _authSuccess(LoginResponseModel.init(_token: authResult?.user.refreshToken ?? "",
                                                     _uuid: authResult?.user.uid ?? ""))
            })
        } else {
            _authError("An error has occured during login with Apple on Firebase")
        }
    }
}
