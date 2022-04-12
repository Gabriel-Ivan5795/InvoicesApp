//
//  DistanceHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 23.04.2021.
//

import CoreLocation
import UIKit

open class DistanceHelper {
    
    static func degreesToRadians(degrees: Double) -> Double { return degrees * .pi / 180.0 }
    static func radiansToDegrees(radians: Double) -> Double { return radians * 180.0 / .pi }

    open class func getBearingBetweenTwoPoints1(point1: CLLocation, point2: CLLocation) -> Double {
        let dlon = DistanceHelper.degreesToRadians(degrees: point2.coordinate.longitude - point1.coordinate.longitude) as Double
        let dlat = DistanceHelper.degreesToRadians(degrees: point2.coordinate.latitude - point1.coordinate.latitude) as Double

        let a = (sin(dlat / 2) * sin(dlat / 2)) + (cos(DistanceHelper.degreesToRadians(degrees: point1.coordinate.latitude)) * cos(DistanceHelper.degreesToRadians(degrees: point2.coordinate.latitude)) * sin(dlon / 2) * sin(dlon / 2)) as Double
        let angle = 2 * atan2(sqrt(a), sqrt(1 - a)) as Double
        return angle * 6371
    }
}
