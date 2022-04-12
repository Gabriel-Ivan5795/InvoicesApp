//
//  APIEncodable.swift
//  TaxiApp
//
//  Created by Ivan Gabriel on 16/01/2020.
//  Copyright © 2020 Ivan Gabriel. All rights reserved.
//
import UIKit

public protocol APIEncodable: Encodable {
    func toJSONData() -> Data?
    func toURLData() -> Data?
}
