//
//  BundleHelper.swift
//  NowAppHelpers
//
//  Created by Cosmin on 10.03.2022.
//

import UIKit

open class BundleHelper {
    
    public static func getCssFromTxtFile(fileName: String) -> String {
        var htmlStyle = ""
        
        if let filepath = Bundle.main.path(forResource: fileName, ofType: "txt") {
            do {
                htmlStyle = try String(contentsOfFile: filepath)
            } catch {
                print("Contents could not be loaded for resource: \(fileName) !")
            }
        } else {
            print("\(fileName) not found !")
        }
        
        return htmlStyle
    }
}
