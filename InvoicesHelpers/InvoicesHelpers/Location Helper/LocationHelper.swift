//
//  LocationHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 22.04.2021.
//

import CoreLocation
import UIKit

open class LocationHelper: NSObject {
    open class func checkIfUserEnabledLocation() -> Bool {
        if !hasLocationPermission() {
            return false
        }

        return true
    }

    static func hasLocationPermission() -> Bool {
        var hasPermission = false
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .restricted, .denied:
                hasPermission = false
            case .authorizedAlways, .authorizedWhenInUse, .notDetermined:
                hasPermission = true
            default:
                print("hello")
            }
        } else {
            hasPermission = false
        }

        return hasPermission
    }
}
