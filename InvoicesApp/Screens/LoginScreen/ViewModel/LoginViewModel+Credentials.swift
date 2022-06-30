//
//  LoginViewModel+Credentials.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 30.04.2022.
//

import Foundation

extension LoginViewModel {
    
    func callNoServerToGetCredentials(_username: String, _password: String) {
        self.isLoadingEnabled.value = true
        let loginModel = LoginModel.init(_username: _username, _password: _password)
        PasswordAuthentificationRequest().loginUserOnFirebase(_loginModel: loginModel, _authSuccess: { success in
            self.isLoadingEnabled.value = false
            self.loginResult.value = success as? LoginResponseModel
        }, _authError: { error in
            if (error == "There is no user record corresponding to this identifier. The user may have been deleted.") {
                self.registerUserNoServerToGetCredentials(_loginModel: loginModel)
            } else {
                self.isLoadingEnabled.value = false
                self.error.value = error
            }
        })
    }
    
    func registerUserNoServerToGetCredentials(_loginModel: LoginModel) {
        CreateUserRequest().loginUserOnFirebase(_loginModel: _loginModel, _authSuccess: { success in
            self.isLoadingEnabled.value = false
            self.loginResult.value = success as? LoginResponseModel
        }, _authError: { error in
            self.isLoadingEnabled.value = false
            self.error.value = error
        })
    }
}
