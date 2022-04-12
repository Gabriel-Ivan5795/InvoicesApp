//
//  BaseScreens.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

protocol BaseScreens {
    
    func getWelcomeScreenViewController() -> WelcomeScreenViewController
    func getLoginScreenViewController() -> LoginViewController
}
