//
//  CreateUserRequest.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 03.05.2022.
//

import UIKit
import Firebase

class CreateUserRequest: IAuthentificationRequest {
    
    func loginUserOnFirebase(_loginModel: LoginModel?, _authSuccess: @escaping (LoginResponseModel) -> Void, _authError: @escaping (String) -> Void) {
        if (_loginModel?.username?.isValid() == true && _loginModel?.password?.isValid() == true) {
            Auth.auth().createUser(withEmail: (_loginModel?.username)!, password: (_loginModel?.password)!, completion: { authResult, error in
                if (error != nil) {
                    _authError(error?.localizedDescription ?? "An error has occured during login on Firebase")
                }
                _authSuccess(LoginResponseModel.init(_token: authResult?.user.refreshToken ?? "",
                                                     _uuid: authResult?.user.uid ?? ""))
            })
        } else {
            _authError("An error has occured during Sign in using Firebase")
        }
    }
}
