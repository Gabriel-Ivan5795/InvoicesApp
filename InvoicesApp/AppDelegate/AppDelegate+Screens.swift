//
//  AppDelegate+Screens.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit

extension AppDelegate: BaseScreens {
    
    @objc func getWelcomeScreenViewController() -> WelcomeScreenViewController {
        return WelcomeScreenViewController()
    }
}
