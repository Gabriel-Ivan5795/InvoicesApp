//
//  Welcomescreen+UIInteractions.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit

extension WelcomeScreenViewController {
    
    @objc func btnGetStarted_onClick() {
        self.navigationController?.pushViewController((self.getAppDelegate().getLoginScreenViewController()), animated: true)
    }
}
