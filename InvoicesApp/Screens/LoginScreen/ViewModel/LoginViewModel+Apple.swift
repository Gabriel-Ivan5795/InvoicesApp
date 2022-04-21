//
//  LoginViewModel+Apple.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 17.04.2022.
//

import UIKit
import Firebase
import AuthenticationServices

extension LoginViewModel {
    
    func callAppleServerToGetCredentials(_user: Any, _currentNonce: String?) {
        self.isLoadingEnabled.value = true
        if #available(iOS 13.0, *) {
            let credentials = _user as? ASAuthorizationAppleIDCredential
            if let appleIDCredentials = credentials {
                let loginModel = LoginModel.init(_authentificationCredentials: self.prepareAppleSDKResponseToFirebaseAuthRequest(currentNonce: _currentNonce, appleIDCredentials: appleIDCredentials)!)
                AppleAuthentificationRequest().loginUserOnFirebase(_loginModel: loginModel, _authSuccess: { success in
                    self.isLoadingEnabled.value = false
                    self.loginResult.value = success
                }, _authError: { error in
                    self.isLoadingEnabled.value = false
                    self.error.value = error
                })
            }
        } else {
            self.isLoadingEnabled.value = false
            self.error.value = "You have an older version of iOS. \n This method required iOS 13.0 or newer"
        }
    }
    
    @available(iOS 13.0, *)
    func prepareAppleSDKResponseToFirebaseAuthRequest(currentNonce: String?, appleIDCredentials: ASAuthorizationAppleIDCredential) -> AuthCredential? {
        guard let nonce = currentNonce else {
            #if DEBUG
                print("Invalid state: A login callback was received, but no login request was sent.")
            #endif
            self.error.value = "Invalid state: A login callback was received, but no login request was sent."
            self.isLoadingEnabled.value = false
            return nil
        }
        guard let appleIDToken = appleIDCredentials.identityToken else {
            #if DEBUG
                print("Unable to fetch identity token")
            #endif
            self.error.value = "Unable to fetch identity token"
            self.isLoadingEnabled.value = false
            return nil
        }
        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
            #if DEBUG
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
            #endif
            self.error.value = "Unable to serialize token string from data: \(appleIDToken.debugDescription)"
            self.isLoadingEnabled.value = false
            return nil
        }
        
        return OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
    }
}
