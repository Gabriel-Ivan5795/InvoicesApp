//
//  LoginView+UI.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 17.04.2022.
//

import UIKit
import InvoicesHelpers
import InvoicesAppConstants
import LoadingDialog

extension LoginViewController {
    
    func setupBinders() {
        self.loginViewModel.loginResult.bind { [weak self] result in
            if let resultResponseModel = result {
                if (resultResponseModel.token != nil && resultResponseModel.uuid != nil) {
                    SafeHelper.saveToken(_accessToken: resultResponseModel.token!,
                                         _accessTokenKey: InvoicesAppConstants.keyInvoicesAppFirebaseLoginToken)
                    SafeHelper.saveCustomValueForKey(_value: resultResponseModel.uuid!,
                                                     _key: InvoicesAppConstants.keyInvoicesAppFirebaseLoginUUID)
                    UserDefaults.standard.set("yes", forKey: InvoicesAppConstants.isUserLoggedIn)
                    UserDefaults.standard.synchronize()
                    self?.navigationController?.pushViewController((self?.getAppDelegate().getHomeScreenViewController())!, animated: true)
                } else {
                    print("login done but an error has occured during login call, the token is invalid or uuid is invalid")
                }
            } else {
                print("waiting for login")
            }
        }
        
        self.loginViewModel.error.bind { [weak self] error in
            if let error = error {
                self?.showAlert(_errorMessage: error)
            }
        }
        
        self.loginViewModel.isLoadingEnabled.bind { [weak self] isLoadingDialog in
            if (isLoadingDialog) {
                LoadingDialog.show(context: self!)
            } else {
                LoadingDialog.hide(context: self!)
            }
        }
    }
}
