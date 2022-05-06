//
//  HomeView+UI.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 06.05.2022.
//

import UIKit
import InvoicesAppConstants
import InvoicesHelpers
import LoadingDialog

extension HomeViewController {
    
    func setupBinders() {
        self.homeViewModel.logoutResult.bind { [weak self] result in
            if (result == true) {
                SafeHelper.deleteToken(_accessTokenKey: InvoicesAppConstants.keyInvoicesAppFirebaseLoginToken)
                UserDefaults.standard.set("no", forKey: InvoicesAppConstants.isUserLoggedIn)
                UserDefaults.standard.synchronize()
                self?.navigationController?.pushViewController((self?.getAppDelegate().getWelcomeScreenViewController())!, animated: false)
            }
        }
        
        self.homeViewModel.error.bind { [weak self] error in
            if let error = error {
                self?.showAlert(_errorMessage: error)
            }
        }
        
        self.homeViewModel.isLoadingEnabled.bind { [weak self] isLoadingDialog in
            if (isLoadingDialog) {
                LoadingDialog.show(context: self!)
            } else {
                LoadingDialog.hide(context: self!)
            }
        }
    }
}
