//
//  BaseViewController.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit
import InvoicesHelpers

class BaseViewController: UIViewController {
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .lightContent
        } else {
            return .lightContent
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func showAlert(_errorMessage: String) {
        AlertHelper.displayAlert(withTitle: "Alert!", message: _errorMessage, action: "OK", from: self)
    }
    
    func getAppDelegate() -> AppDelegate {
        return self.appDelegate ?? AppDelegate()
    }
}
