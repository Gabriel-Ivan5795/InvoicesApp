//
//  DateExtension.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 29.03.2022.
//

import Foundation

extension Date {
    public var millisecondsSince1970: Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    public init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
