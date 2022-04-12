//
//  ErrorHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 24.02.2021.
//

import UIKit

open class ErrorHelper: NSObject {
    
    var stringDomain: String!
    
    public init(_domain: String) {
        self.stringDomain = _domain
    }

    open func tryToGetErrorFromResponse(_statusCode: Int, _data: Data) -> NSError {
        do {
            let responseJSON = try JSONSerialization.jsonObject(with: _data, options: [])
            let responseDict = responseJSON as! [AnyHashable: Any]
            let errorMessage = responseDict["message"] as! String
            if (responseDict["errors"] != nil) {
                let errorsArray = responseDict["errors"] as! [AnyHashable: Any]
                var stringError = ""
                for error in errorsArray {
                    stringError = String.init(format: "%@ %@:%@", stringError, error.key as CVarArg, error.value as! CVarArg)
                    return NSError(domain: self.stringDomain, code: _statusCode, userInfo: ["status": "Error", "error": stringError])
                }
            }
            return NSError(domain: self.stringDomain, code: _statusCode, userInfo: ["status": "Error", "error": errorMessage])
        } catch {
            switch _statusCode {
                case 400:
                    return self.createBadRequestError()
                case 401:
                    return self.createUnauthorizedError()
                case 403:
                    return self.createForbiddenError()
                case 404:
                    return self.createNotFoundError()
                case 504:
                    return self.createTimeoutGateway()
                case 500:
                    return self.createGenericError()
                default:
                    return self.createGenericError()
            }
        }
    }
    
    open func createGenericError() -> NSError {
        return NSError(domain: self.stringDomain, code: 500, userInfo: ["status": "Error", "error": "alert_an_error_has_occured"])
    }
    
    open func createGenericErrorWith200() -> NSError {
        return NSError(domain: self.stringDomain, code: 500, userInfo: ["status": "Error", "error": "alert_an_error_has_occured"])
    }
    
    open func createGenericErrorWith500() -> NSError {
        return NSError(domain: self.stringDomain, code: 500, userInfo: ["status": "Error", "error": "alert_an_error_has_occured"])
    }
    
    open func createGenericErrorWithmy500() -> NSError {
        return NSError(domain: self.stringDomain, code: 500, userInfo: ["status": "Error", "error": "alert_an_error_has_occured"])
    }
    
    open func createTimeoutGateway() -> NSError {
        return NSError(domain: self.stringDomain, code: 504, userInfo: ["status": "Error", "error": "alert_timeout"])
    }
    
    open func createNotFoundError() -> NSError {
        return NSError(domain: self.stringDomain, code: 404, userInfo: ["status": "Error", "error": "alert_not_found"])
    }
    
    open func createUnauthorizedError() -> NSError {
        return NSError(domain: self.stringDomain, code: 401, userInfo: ["status": "Error", "error": "alert_unauthorized"])
    }
    
    open func createForbiddenError() -> NSError {
        return NSError(domain: self.stringDomain, code: 403, userInfo: ["status": "Error", "error": "alert_forbidden"])
    }
    
    open func createBadRequestError() -> NSError {
        return NSError(domain: self.stringDomain, code: 400, userInfo: ["status": "Error", "error": "alert_bad_request"])
    }
    
    open func cantFindNumberPlateError() -> NSError {
        return NSError(domain: self.stringDomain, code: 404, userInfo: ["status": "Error", "error": "cant_find_number_plate"])
    }
}
