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
import TwitterKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseConfig.initializeProject()
        FirebaseConfig.initializeCrashlytics()
        //FirebaseConfig.processTestCrash()
        
        TWTRTwitter.sharedInstance().start(withConsumerKey: "1515818531161575426-bUiuvMFLFEq4kQ7UwtTLCehdWsNySr", consumerSecret: "ycJBIl4gpWFndwghmMvVplHMbRi3GdB4QFBeuIdM6rGS0")
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.navigationController = UINavigationController()
        AppConfig.initializeAppConfig(_window: self.window!,
                                      _navigationController: self.navigationController)
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let isGoogleOpenURL = GIDSignIn.sharedInstance.handle(url)
        let isFacebookOpenURL = ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        let isTwitterOpenURL = TWTRTwitter.sharedInstance().application(app, open: url, options: options)
        
        return (isGoogleOpenURL || isFacebookOpenURL || isTwitterOpenURL)
    }
}

