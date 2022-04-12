//
//  AppConfig.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit

class AppConfig {

    class func initializeAppConfig(_window: UIWindow, _navigationController: UINavigationController) {
        
        let nextView = (UIApplication.shared.delegate as? AppDelegate)!.getWelcomeScreenViewController()
        _navigationController.setNavigationBarHidden(true, animated: false)
        _navigationController.pushViewController(nextView, animated: false)
        _window.rootViewController = _navigationController
        _window.makeKeyAndVisible()
    }
}
