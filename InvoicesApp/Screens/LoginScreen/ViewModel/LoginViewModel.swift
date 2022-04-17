//
//  LoginViewModel.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 16.04.2022.
//

import UIKit
import InvoicesHelpers
import AuthenticationServices
import Firebase
import GoogleSignIn

class LoginViewModel {
    
    var loginResult: ObservableHelper<String?> = ObservableHelper(nil)
    var error: ObservableHelper<String?> = ObservableHelper(nil)
    var isLoadingEnabled: ObservableHelper<Bool> = ObservableHelper(false)
    
    func callAppleServerToGetCredentials(_user: Any, _currentNonce: String?) {
        self.isLoadingEnabled.value = true
        if #available(iOS 13.0, *) {
            let credentials = _user as? ASAuthorizationAppleIDCredential
            if let appleIDCredentials = credentials {
                AppleAuthentificationRequest().loginUserOnFirebase(_credentials: self.prepareAppleSDKResponseToFirebaseAuthRequest(currentNonce: _currentNonce, appleIDCredentials: appleIDCredentials), _authSuccess: { success in
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
    
    func callGoogleServerToGetCredentials() {
        self.isLoadingEnabled.value = true
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            self.error.value = "An error has occured during Google Sign in using Firebase"
            self.isLoadingEnabled.value = false
            return
        }
        
        let config = GIDConfiguration(clientID: clientID)
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        GIDSignIn.sharedInstance.signIn(with: config, presenting: (appDelegate?.navigationController.viewControllers.last)!) { [unowned self] user, error in
            if let error = error {
                self.isLoadingEnabled.value = false
                self.error.value = error.localizedDescription
            }
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                self.isLoadingEnabled.value = false
                self.error.value = "An error has occured during Google Sign in using Firebase"
                return
            }
            let credentials = GoogleAuthProvider.credential(withIDToken: idToken,
                                                            accessToken: authentication.accessToken)
            GoogleAuthentificationRequest().loginUserOnFirebase(_credentials: credentials, _authSuccess: { success in
                self.isLoadingEnabled.value = false
                self.loginResult.value = success
            }, _authError: { error in
                self.isLoadingEnabled.value = false
                self.error.value = error
            })
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
