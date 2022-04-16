//
//  WelcomeViewModel.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 15.04.2022.
//

import UIKit
import InvoicesHelpers

class WelcomeViewModel {

    var welcomeData: ObservableHelper<[WelcomeModel]> = ObservableHelper([])
    var error: ObservableHelper<String?> = ObservableHelper(nil)
    var isLoadingEnabled: ObservableHelper<Bool> = ObservableHelper(false)
    
    func getWelcomeItems() {
        self.isLoadingEnabled.value = true
        var welcomeArray = [WelcomeModel]()
        welcomeArray.insert(WelcomeModel.init(_image: UIImage.init(named: "InvoiceSample1")), at: welcomeArray.count)
        welcomeArray.insert(WelcomeModel.init(_image: UIImage.init(named: "InvoiceSample2")), at: welcomeArray.count)
        welcomeArray.insert(WelcomeModel.init(_image: UIImage.init(named: "InvoiceSample3")), at: welcomeArray.count)
        self.welcomeData.value = welcomeArray
        self.isLoadingEnabled.value = false
    }
}
