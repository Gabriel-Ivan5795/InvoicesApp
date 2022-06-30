//
//  PasswordAuthentificationRequest.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 21.04.2022.
//

import UIKit
import Firebase
import InvoicesService

class PasswordAuthentificationRequest: IAuthentificationRequest {
    
    func loginUserOnFirebase(_loginModel: BaseLoginModel?, _authSuccess: @escaping(BaseLoginResponseModel) -> Void, _authError: @escaping(String) -> Void) {
        let loginModel = _loginModel as? LoginModel
        if (loginModel?.username?.isValid() == true && loginModel?.password?.isValid() == true) {
            Auth.auth().signIn(withEmail: (loginModel?.username)!, password: (loginModel?.password)!, completion: { authResult, error in
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
