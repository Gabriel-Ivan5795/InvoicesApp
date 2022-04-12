//
//  PushNotificationsHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 24.11.2021.
//

import UIKit
import UserNotifications

open class PushNotificationsHelper: NSObject {
    
    public static var permission: Bool = false

    open class func checkIfUserEnabledPushNotifications() -> Bool {
        PushNotificationsHelper.hasPushNotificationsPermission()
        do {
            sleep(1)
        }
        return PushNotificationsHelper.permission
    }
    
    static func hasPushNotificationsPermission() {
        let current = UNUserNotificationCenter.current()
        current.getNotificationSettings(completionHandler: { permission in
            switch permission.authorizationStatus {
                case .authorized:
                    print("authorized")
                    PushNotificationsHelper.permission = true
                    break
                case .denied:
                    print("denied")
                    PushNotificationsHelper.permission = false
                    break
                case .notDetermined:
                    print("notDetermined")
                    PushNotificationsHelper.permission = false
                    break
                case .provisional:
                    print("provisional")
                    PushNotificationsHelper.permission = true
                    break
                case .ephemeral:
                    print("ephemeral")
                    PushNotificationsHelper.permission = true
                    break
                default:
                    print("default")
                    PushNotificationsHelper.permission = false
                    break
            }
        })
    }
}
