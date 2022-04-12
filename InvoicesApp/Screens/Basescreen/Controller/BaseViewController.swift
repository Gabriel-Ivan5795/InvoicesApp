//
//  BaseViewController.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func getAppDelegate() -> AppDelegate? {
        return self.appDelegate
    }
}
