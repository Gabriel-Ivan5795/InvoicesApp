//
//  LoginViewModel+Twitter.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 18.04.2022.
//

import UIKit
import Firebase
import TwitterKit

extension LoginViewModel {
    
    func callTwitterServerToGetCredentials() {
        self.isLoadingEnabled.value = true
        
        TWTRTwitter.sharedInstance().logIn(completion: { session, error in
            if (error != nil) {
                self.isLoadingEnabled.value = false
                self.error.value = error?.localizedDescription ?? "An error has occured during Twitter Sign in using Firebase"
            }
            guard let token = session?.authToken else {
                self.isLoadingEnabled.value = false
                self.error.value = "An error has occured during Twitter Sign in using Firebase"
                return
            }
            guard let secret = session?.authTokenSecret else {
                self.isLoadingEnabled.value = false
                self.error.value = "An error has occured during Twitter Sign in using Firebase"
                return
            }
            let credentials = TwitterAuthProvider.credential(withToken: token, secret: secret)
            let loginModel = LoginModel.init(_authentificationCredentials: credentials)
            TwitterAuthentificationRequest().loginUserOnFirebase(_loginModel: loginModel, _authSuccess: { success in
                self.isLoadingEnabled.value = false
                self.loginResult.value = success as? LoginResponseModel
            }, _authError: { error in
                self.isLoadingEnabled.value = false
                self.error.value = error
            })
        })
//        let provider = OAuthProvider(providerID: "twitter.com")
//        provider.customParameters = ["lang": "fr",
//                                     "oauth_consumer_key": "694sICEmimszEmem9bqmhyjLU",
//                                     "oauth_nonce": "kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg",
//                                     "oauth_signature": "tnnArxj06cWHq44gCs1OSKk%2FjLY%3D",
//                                     "oauth_signature_method": "HMAC-SHA1",
//                                     "oauth_timestamp": String.init(format: "%lu", Date().timeIntervalSince1970),
//                                     "oauth_token": "370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb",
//                                     "oauth_version": "1.0"]
//
//        provider.getCredentialWith(nil, completion: { credentials, error in
//            if (error != nil) {
//                self.isLoadingEnabled.value = false
//                self.error.value = error?.localizedDescription ?? "An error has occured during Twitter Sign in using Firebase"
//            }
//            TwitterAuthentificationRequest().loginUserOnFirebase(_credentials: credentials, _authSuccess: { success in
//                self.isLoadingEnabled.value = false
//                self.loginResult.value = success
//            }, _authError: { error in
//                self.isLoadingEnabled.value = false
//                self.error.value = error
//            })
//        })
    }
}
