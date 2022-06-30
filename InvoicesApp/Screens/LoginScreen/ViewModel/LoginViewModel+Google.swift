//
//  LoginViewModel+Google.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 17.04.2022.
//

import UIKit
import Firebase
import GoogleSignIn

extension LoginViewModel {
    
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
            let loginModel = LoginModel.init(_authentificationCredentials: credentials)
            GoogleAuthentificationRequest().loginUserOnFirebase(_loginModel: loginModel, _authSuccess: { success in
                self.isLoadingEnabled.value = false
                self.loginResult.value = success as? LoginResponseModel
            }, _authError: { error in
                self.isLoadingEnabled.value = false
                self.error.value = error
            })
        }
    }
}
