//
//  LoaderHelper.swift
//  Hubble
//
//  Created by Ivan Gabriel on 12.02.2021.
//

import UIKit
import SVProgressHUD

public class LoaderHelper: NSObject {

    public class func showLoader() {
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setBackgroundColor(.white)
        SVProgressHUD.setForegroundColor(.darkGray)
        SVProgressHUD.setRingThickness(3.0)
        SVProgressHUD.setMaximumDismissTimeInterval(2.0)
        SVProgressHUD.show()
    }
    
    public class func hideLoader() {
        SVProgressHUD.dismiss()
    }
}
