//
//  AppDelegate.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 11.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.navigationController = UINavigationController()
        let nextView = ViewController()
        self.navigationController.setNavigationBarHidden(true, animated: false)
        self.navigationController.pushViewController(nextView, animated: false)
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

