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
}
