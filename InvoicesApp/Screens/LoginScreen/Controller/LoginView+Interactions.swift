//
//  LoginView+Interactions.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 17.04.2022.
//

import UIKit
import AuthenticationServices

extension LoginViewController {
    
    @objc func btnLogin_onClick() {
        self.loginViewModel.usernameAndPasswordLoginUser(_username: self.loginViewUI.getUsernameValue(),
                                                         _password: self.loginViewUI.getPasswordValue())
    }
    
    @objc func btnTwitterSignIn_onClick() {
        self.loginViewModel.callTwitterServerToGetCredentials()
    }
    
    @objc func btnFacebookSignIn_onClick() {
        self.loginViewModel.callFaceboolServerToGetCredentials()
    }
    
    @objc func btnGoogleSignIn_onClick() {
        self.loginViewModel.callGoogleServerToGetCredentials()
    }
    
    @objc func btnAppleSignIn_onClick() {
        if #available(iOS 13.0, *) {
            let nonce = self.randomNonceString()
            self.currentNonce = nonce
            
            let provider = ASAuthorizationAppleIDProvider()
            let request = provider.createRequest()
            request.requestedScopes = [.fullName, .email]
            
            let controller = ASAuthorizationController(authorizationRequests: [request])
            controller.delegate = self
            controller.presentationContextProvider = self
            controller.performRequests()
        } else {
            self.showAlert(_errorMessage: "You have an older version of iOS. \n This method required iOS 13.0 or newer")
        }
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SeRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
}
