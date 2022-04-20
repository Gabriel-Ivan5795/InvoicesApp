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
            TwitterAuthentificationRequest().loginUserOnFirebase(_credentials: credentials, _authSuccess: { success in
                self.isLoadingEnabled.value = false
                self.loginResult.value = success
            }, _authError: { error in
                self.isLoadingEnabled.value = false
                self.error.value = error
            })
        })
//        let provider = OAuthProvider(providerID: "twitter.com")
//        provider.customParameters = ["lang": "fr", "oauth_consumer_key": "694sICEmimszEmem9bqmhyjLU", "oauth_consumer_secret": "17Lt2OgKdgxF2PgQFlsqE1u4wkOkbrTToNDA3dwkSkOStBJvKg"]
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
