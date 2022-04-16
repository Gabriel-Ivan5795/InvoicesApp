//
//  TestClass.swift
//  InvoicesAPI
//
//  Created by Ivan Gabriel on 15.04.2022.
//

import UIKit
import FirebaseAuth

class TestClass: NSObject {

    public class func getFirebaseAuth() {
        
        Auth.auth().signIn(withCustomToken: SafeHelper.getAccessToken(_accessTokenKey: Constants.acessToken)) { (user, error) in
            if (error != nil) {
                callBackError(error?.localizedDescription)
            } else {
                callBackSuccess(user)
            }
        }
    }
}
