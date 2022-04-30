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
            self.loginResult.value = success
        }, _authError: { error in
            self.isLoadingEnabled.value = false
            self.error.value = error
        })
    }
}
