//
//  UtilsHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 26.02.2021.
//

import UIKit
import AVFoundation

open class UtilsHelper: NSObject {
    
    open class func scaleDown(_ actualImage: UIImage?, atFinalWidth resizeWidth: Float) -> UIImage? {
        let widthRatio = Float(CGFloat(resizeWidth) / (actualImage?.size.width ?? 0.0))
        let heightRatio = Float(CGFloat(resizeWidth) / (actualImage?.size.height ?? 0.0))
        
        var ratio: Float
        if widthRatio < heightRatio {
            ratio = widthRatio
        } else {
            ratio = heightRatio
        }
        
        let width = Int(round(Double(CGFloat(ratio) * (actualImage?.size.width ?? 0.0))))
        let height = Int(round(Double(CGFloat(ratio) * (actualImage?.size.height ?? 0.0))))
        
        let newSize = CGSize(width: CGFloat(width), height: CGFloat(height))
        
        UIGraphicsBeginImageContext(newSize)
        
        actualImage?.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let destImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return destImage
    }
    
    open class func convertBufferToImage(_buffer: CMSampleBuffer) -> UIImage {
        let imageBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(_buffer)!
        let ciimage : CIImage = CIImage(cvPixelBuffer: imageBuffer)
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(ciimage, from: ciimage.extent)!
        let image:UIImage = UIImage.init(cgImage: cgImage)
        return image
    }
    
    open class func isPhoneX() -> Bool {
        if UIDevice.current.userInterfaceIdiom == .phone {
            switch Int(UIScreen.main.nativeBounds.size.height) {
                case 1792:
                    return true
                case 2340:
                    return true
                case 2436:
                    return true
                case 2532:
                    return true
                case 2688:
                    return true
                case 2778:
                    return true
                default:
                    return false
            }
        }
        return false
    }
    
    open class func isPhoneSE() -> Bool {
        if UIDevice.current.userInterfaceIdiom == .phone {
            switch Int(UIScreen.main.nativeBounds.size.height) {
                case 960:
                    return true
                case 1136:
                    return true
                default:
                    return false
            }
        }
        return false
    }
    
    open class func decodeBase64String(base64Encoded: String) -> String? {
        guard let data = Data(base64Encoded: base64Encoded) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    open class func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    open class func getUUID() -> String {
        return UUID().uuidString
    }
    
    open class func printFonts() {
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
    }
}
