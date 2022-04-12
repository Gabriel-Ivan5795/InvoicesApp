//
//  APIRequest.swift
//  TaxiApp
//
//  Created by Ivan Gabriel on 16/01/2020.
//  Copyright © 2020 Ivan Gabriel. All rights reserved.
//

import Alamofire
import SwiftKeychainWrapper
import UIKit

public class APIRequest: NSObject {
    public class func createURLRequest(_urlString: String, _bodyObject: APIEncodable, _headersDict: [String: String], _methodType: String, _bodyType: Int) -> URLRequest {
        var data: Data?
        
        switch _bodyType {
            case 1:
                data = _bodyObject.toURLData()
            case 2:
                data = _bodyObject.toJSONData()
            default:
                data = Data()
        }
        
        var urlRequest = URLRequest(url: URL(string: _urlString)!)
        urlRequest.allHTTPHeaderFields = _headersDict
        for header in _headersDict {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        urlRequest.httpMethod = _methodType
        urlRequest.httpBody = data
        
        return urlRequest
    }
    
    public class func createURLRequestGET(_urlString: String, _headersDict: [String: String]) -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: _urlString)!)
        urlRequest.allHTTPHeaderFields = _headersDict
        for header in _headersDict {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        return urlRequest
    }
    
    public class func createURLRequestDELETE(_urlString: String, _headersDict: [String: String]) -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: _urlString)!)
        urlRequest.allHTTPHeaderFields = _headersDict
        for header in _headersDict {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        urlRequest.httpMethod = HTTPMethod.delete.rawValue
        return urlRequest
    }
}

extension APIEncodable {
    public func toJSONData() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    public func toURLData() -> Data? {
        let encoder = URLEncodedFormParameterEncoder()
        return try? encoder.encoder.encode(self)
    }
}
