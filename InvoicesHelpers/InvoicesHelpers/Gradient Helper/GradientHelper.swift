//
//  GradientHelper.swift
//  InvoicesHelpers
//
//  Created by Ivan Gabriel on 14.04.2022.
//

import UIKit

open class GradientHelper {

    public enum GradientDirection {
        case vertical
        case horizontal
    }
    
    public static func createGradientLayer(colors: [UIColor], direction: GradientDirection) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        if case .horizontal = direction {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        }
        return gradientLayer
    }
}
