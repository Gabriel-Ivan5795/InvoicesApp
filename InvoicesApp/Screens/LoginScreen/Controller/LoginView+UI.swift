//
//  LoginView+UI.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 17.04.2022.
//

import UIKit
import InvoicesHelpers
import LoadingDialog

extension LoginViewController {
    
    func setupBinders() {
    
        self.loginViewModel.loginResult.bind { [weak self] result in
            if (result != nil) {
                print("login done")
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
