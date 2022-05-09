//
//  BaseScreens.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit

protocol BaseScreens {
    
    func getWelcomeScreenViewController() -> WelcomeScreenViewController
    func getLoginScreenViewController() -> LoginViewController
    func getHomeScreenViewController() -> HomeViewController
    func getAddInvoicesScreenViewController() -> AddInvoicesViewController
}
