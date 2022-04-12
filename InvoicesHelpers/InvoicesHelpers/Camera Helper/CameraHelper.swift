//
//  CameraHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 24.11.2021.
//

import UIKit
import AVFoundation

open class CameraHelper: NSObject {

    open class func checkIfUserEnabledCamera() -> Bool {
        return CameraHelper.hasCameraPermission()
    }
    
    static func hasCameraPermission() -> Bool {
        if AVCaptureDevice.authorizationStatus(for: .video) == AVAuthorizationStatus.authorized {
            return true
        } else {
            return false
        }
    }
}
