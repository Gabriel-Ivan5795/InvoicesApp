//
//  HomeViewModel.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 06.05.2022.
//

import UIKit
import InvoicesHelpers

class HomeViewModel {

    var logoutResult: ObservableHelper<Bool> = ObservableHelper(false)
    var error: ObservableHelper<String?> = ObservableHelper(nil)
    var isLoadingEnabled: ObservableHelper<Bool> = ObservableHelper(false)
    
    func firebaseLogout() {
        self.isLoadingEnabled.value = true
        DeAuthentificationRequest().logoutUserOnFirebase(_deAuthSuccess: { value in
            self.isLoadingEnabled.value = false
            self.logoutResult.value = value
        }, _deAuthError: { error in
            self.isLoadingEnabled.value = false
            self.error.value = error
        })
    }
}
