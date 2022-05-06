//
//  AppConfig.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit
import InvoicesAppConstants

class AppConfig {

    class func initializeAppConfig(_window: UIWindow, _navigationController: UINavigationController) {
        
        let isLoggedIn = UserDefaults.standard.string(forKey: InvoicesAppConstants.isUserLoggedIn)
        var nextView: BaseViewController!
        if (isLoggedIn != nil && isLoggedIn == "yes") {
            nextView = (UIApplication.shared.delegate as? AppDelegate)!.getHomeScreenViewController()
        } else {
            nextView = (UIApplication.shared.delegate as? AppDelegate)!.getWelcomeScreenViewController()
        }
        _navigationController.setNavigationBarHidden(true, animated: false)
        _navigationController.pushViewController(nextView, animated: false)
        _window.rootViewController = _navigationController
        _window.makeKeyAndVisible()
    }
}
