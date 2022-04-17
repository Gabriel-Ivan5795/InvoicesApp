//
//  LoginViewModel+Facebook.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 17.04.2022.
//

import UIKit
import Firebase
import FBSDKLoginKit

extension LoginViewModel {
    
    func callFaceboolServerToGetCredentials() {
        self.isLoadingEnabled.value = true
        LoginManager().logOut()
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        LoginManager.init().logIn(permissions: ["public_profile", "email"], from: (appDelegate?.navigationController.viewControllers.last)!, handler: { result, error in
            if (error != nil) {
                self.isLoadingEnabled.value = false
                self.error.value = error?.localizedDescription ?? "An error has occured during Facebook Sign in using Firebase"
            } else if (result?.isCancelled == true) {
                self.isLoadingEnabled.value = false
                self.error.value = "The request for Facebook Sign in using Firebase was cancelled"
            } else {
                let req = GraphRequest(graphPath: "me", parameters: ["fields": "email, name"], tokenString: AccessToken.current?.tokenString, version: nil, httpMethod: HTTPMethod(rawValue: "GET"))
                req.start(completionHandler: { httpResponse, result, error in
                    if (error != nil) {
                        self.isLoadingEnabled.value = false
                        self.error.value = error?.localizedDescription ?? "An error has occured during getting profile fron Facebook"
                    }
                    if let result = result as? [String: String] {
                        let email = result["email"]
                        let name = result["name"]
                        let credentials = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                        FacebookAuthentificationRequest().loginUserOnFirebase(_credentials: credentials, _authSuccess: { success in
                            self.isLoadingEnabled.value = false
                            self.loginResult.value = success
                        }, _authError: { error in
                            self.isLoadingEnabled.value = false
                            self.error.value = error
                        })
//                        let reqPicture = GraphRequest(graphPath: "me/picture", parameters: ["height": 300, "width": 300], tokenString: AccessToken.current?.tokenString, version: nil, httpMethod: HTTPMethod(rawValue: "GET"))
//                        reqPicture.start(completionHandler: { httpResponsePicture, resultPicture, errorPicture in
//                            let credentials = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
//                            if (errorPicture != nil) {
//                                self.isLoadingEnabled.value = false
//                                self.error.value = error?.localizedDescription ?? "An error has occured during getting profile picture fron Facebook"
//                                FacebookAuthentificationRequest().loginUserOnFirebase(_credentials: credentials, _authSuccess: { success in
//                                    self.isLoadingEnabled.value = false
//                                    self.loginResult.value = success
//                                }, _authError: { error in
//                                    self.isLoadingEnabled.value = false
//                                    self.error.value = error
//                                })
//                            }
//                            if let resultPicture = resultPicture as? [AnyHashable: Any] {
//                                let dataPicture = resultPicture["data"] as? [AnyHashable: Any]
//                                let profilePicture = dataPicture?["url"] as? String
//                                FacebookAuthentificationRequest().loginUserOnFirebase(_credentials: credentials, _authSuccess: { success in
//                                    self.isLoadingEnabled.value = false
//                                    self.loginResult.value = success
//                                }, _authError: { error in
//                                    self.isLoadingEnabled.value = false
//                                    self.error.value = error
//                                })
//                            } else {
//                                FacebookAuthentificationRequest().loginUserOnFirebase(_credentials: credentials, _authSuccess: { success in
//                                    self.isLoadingEnabled.value = false
//                                    self.loginResult.value = success
//                                }, _authError: { error in
//                                    self.isLoadingEnabled.value = false
//                                    self.error.value = error
//                                })
//                            }
//                        })
                    }
                })
            }
        })
    }
}
