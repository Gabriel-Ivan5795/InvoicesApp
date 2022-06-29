//
//  EncodableHelper.swift
//  InvoicesHelpers
//
//  Created by Gabriel Ivan on 29.06.2022.
//

import UIKit

extension Encodable {
    
    public func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
