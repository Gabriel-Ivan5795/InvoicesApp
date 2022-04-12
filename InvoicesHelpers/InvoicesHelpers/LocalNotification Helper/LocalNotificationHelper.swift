//
//  LocalNotificationHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 11.02.2022.
//

import UIKit
import UserNotifications

open class LocalNotificationHelper {

    open class func showNotification(_title: String, _subTile: String, _body: String, _identifier: String) {
        let content = UNMutableNotificationContent()
        content.title = _title
        content.subtitle = _subTile
        content.body = _body
        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: _identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
