//
//  AlertHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 26.02.2021.
//

import UIKit

open class AlertHelper: NSObject {
    open class func displayAlert(withTitle title: String?, message: String?, action: String?, from viewController: UIViewController? = nil) {
        if Thread.isMainThread {
            displayAlert(forTitle: title, message: message, action: action, from: viewController)
        } else {
            DispatchQueue.main.async {
                displayAlert(forTitle: title, message: message, action: action, from: viewController)
            }
        }
    }
    
    open class func displayAlert(forTitle title: String?, message: String?, action: String?, from viewController: UIViewController?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: action, style: .default, handler: nil))
        
        guard let viewController = viewController ?? UIApplication.shared.windows.first?.rootViewController else {
            return
        }
        
        viewController.present(alertController, animated: true)
    }
    
    open class func displayAlertWithGoToSettings(withTitle title: String?, message: String?, action: String?, actionCancel: String?, from viewController: UIViewController? = nil) {
        if Thread.isMainThread {
            displayAlertWithGoToSettings(forTitle: title, message: message, action: action, actionCancel: actionCancel, from: viewController)
        } else {
            DispatchQueue.main.async {
                displayAlertWithGoToSettings(forTitle: title, message: message, action: action, actionCancel: actionCancel, from: viewController)
            }
        }
    }
    
    open class func displayAlertWithGoToSettings(forTitle title: String?, message: String?, action: String?, actionCancel: String?, from viewController: UIViewController?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: action, style: .default, handler: { _ in
            // Redirect to Settings app
            UIApplication.shared.open(URL(string: "App-Prefs:root=Privacy&path=LOCATION")!)
        }))
        alertController.addAction(UIAlertAction(title: actionCancel, style: .cancel, handler: nil))
        
        guard let viewController = viewController ?? UIApplication.shared.windows.first?.rootViewController else {
            return
        }
        
        viewController.present(alertController, animated: true)
    }
    
    open class func displayAlertWithAction(withTitle title: String?, message: String?, action: String?, from viewController: UIViewController? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        guard let viewController = viewController ?? UIApplication.shared.windows.first?.rootViewController else {
            return UIAlertController.init()
        }
        
        viewController.present(alertController, animated: true)
        return alertController
    }
}
