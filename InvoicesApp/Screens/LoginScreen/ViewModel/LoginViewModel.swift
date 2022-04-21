//
//  LoginViewModel.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 16.04.2022.
//

import UIKit
import InvoicesHelpers
import Firebase
import AuthenticationServices
import GoogleSignIn
import FBSDKLoginKit

class LoginViewModel {
    
    var loginResult: ObservableHelper<String?> = ObservableHelper(nil)
    var error: ObservableHelper<String?> = ObservableHelper(nil)
    var isLoadingEnabled: ObservableHelper<Bool> = ObservableHelper(false)
    
    func appleLoginUser(_user: Any, _currentNonce: String?) {
        self.callAppleServerToGetCredentials(_user: _user, _currentNonce: _currentNonce)
    }
    
    func googleLoginUser() {
        self.callGoogleServerToGetCredentials()
    }
    
    func facebookLoginUser() {
        self.callFaceboolServerToGetCredentials()
    }
    
    func twitterLoginUser() {
        self.callTwitterServerToGetCredentials()
    }
    
    func usernameAndPasswordLoginUser(_username: String, _password: String) {
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
