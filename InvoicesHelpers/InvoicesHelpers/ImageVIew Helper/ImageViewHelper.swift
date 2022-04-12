//
//  ImageViewHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 26.03.2021.
//

import UIKit

extension UIImage {
    
    open func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
    
    open func fixOrientation() -> UIImage {
        if self.imageOrientation == UIImage.Orientation.up {
            return self
        }

        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)

        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))

        let normalizedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!

        UIGraphicsEndImageContext()

        return normalizedImage
    }
    
    open func saveImage(_keyImage: String) {
        guard let data = self.jpegData(compressionQuality: 0.5) else { return }
        let encoded = try! PropertyListEncoder().encode(data)
        UserDefaults.standard.set(encoded, forKey: _keyImage)
    }
    
    open func getImage(_keyImage: String) -> UIImage? {
        guard let data = UserDefaults.standard.data(forKey: _keyImage) else { return nil }
        let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
        return UIImage(data: decoded) ?? nil
    }
}
