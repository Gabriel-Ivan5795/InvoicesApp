//
//  AppDelegate.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 11.04.2022.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit

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
        let isGoogleOpenURL = GIDSignIn.sharedInstance.handle(url)
        let isFacebookOpenURL = ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        if (isGoogleOpenURL) { return isGoogleOpenURL }
        if (isFacebookOpenURL) { return isFacebookOpenURL }
        
        return false
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

