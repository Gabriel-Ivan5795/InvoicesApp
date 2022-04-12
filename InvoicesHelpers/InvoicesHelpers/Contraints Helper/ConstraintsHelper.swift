//
//  ConstraintsHelper.swift
//  Hubble
//
//  Created by Ivan Gabriel on 10.02.2021.
//

import UIKit

open class ConstraintsHelper: NSObject {

    open class func addConstraints(_toView: UIView, _stringConstraints: String, _dictionaryValeus: [String: Any]) {
        
        _toView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: _stringConstraints,
                                                              options: [],
                                                              metrics: nil,
                                                              views: _dictionaryValeus))
    }
    
    open class func removeTranslateIntoResize(_toView: UIView) {
        _toView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    open class func putViewInCenter(_toView: UIView) {
        _toView.centerVertically(deviation: 0)
        _toView.centerHorizontally(deviation: 0)
    }
    
    open class func putInHorizontal(_toView: UIView) {
        _toView.centerHorizontally(deviation: 1)
    }
    
    open class func putInVertical(_toView: UIView) {
        _toView.centerVertically(deviation: 1)
    }
}
