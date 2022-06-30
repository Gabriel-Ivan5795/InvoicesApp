//
//  TwitterAuthentificationRequest.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 18.04.2022.
//

import UIKit
import Firebase
import InvoicesService

class TwitterAuthentificationRequest: IAuthentificationRequest {
    
    func loginUserOnFirebase(_loginModel: BaseLoginModel?, _authSuccess: @escaping(BaseLoginResponseModel) -> Void, _authError: @escaping(String) -> Void) {
        let loginModel = _loginModel as? LoginModel
        if (loginModel?.authentificationCredentials != nil) {
            Auth.auth().signIn(with: (loginModel?.authentificationCredentials)!, completion: { (authResult, error) in
                if (error != nil) {
                    _authError(error?.localizedDescription ?? "An error has occured during Twitter Sign in using Firebase")
                }
                _authSuccess(LoginResponseModel.init(_token: authResult?.user.refreshToken ?? "",
                                                     _uuid: authResult?.user.uid ?? ""))
            })
        } else {
            _authError("An error has occured during Twitter Sign in using Firebase")
        }
    }
}
