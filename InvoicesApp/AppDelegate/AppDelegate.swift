//
//  AppDelegate.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 11.04.2022.
//

import UIKit
import Firebase
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseConfig.initializeProject()
        FirebaseConfig.initializeCrashlytics()
        //FirebaseConfig.processTestCrash()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.navigationController = UINavigationController()
        AppConfig.initializeAppConfig(_window: self.window!,
                                      _navigationController: self.navigationController)
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        let loginController = GIDSignIn.sharedInstance()?.presentingViewController as? LoginViewController
//        if (loginController != nil) {
//            if (user != nil) {
//                loginController.loginViewModel.callGoogleServerToGetCredentials(_user: user as Any)
//            }
//        }
//    }
}

