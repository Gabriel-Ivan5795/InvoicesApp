//
//  DoubleHelper.swift
//  NowAppHelpers
//
//  Created by Cosmin on 01.04.2022.
//

import UIKit

public extension Double {
    
    func localeString(langCode: String) -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 2
        nf.minimumFractionDigits = 2
        nf.locale = Locale(identifier: langCode)
        return nf.string(from: self as NSNumber) ?? String(format: "%.2f", self)
    }
    
}
