//
//  ObservableHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit

final public class ObservableHelper<T> {

    private var listener: ((T) -> Void)?
    
    public var value: T {
        didSet {
            listener?(value)
        }
    }
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func bind(_ listener: @escaping (T) -> Void) {
        self.listener = listener
        listener(value)
    }
}
