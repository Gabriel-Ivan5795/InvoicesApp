//
//  RequestManager.swift
//  Project Learning Testing
//
//  Created by Ivan Gabriel on 10/04/2020.
//  Copyright © 2020 Roweb. All rights reserved.
//

import Foundation
import Alamofire

public class RequestManager {
    
    static let shared = RequestManager()
    fileprivate let liveManager: Session
    fileprivate let mockManager: Session
    
    init(_ state: RequestState = .live) {
        let mockConfiguration: URLSessionConfiguration = {
            let configuration = URLSessionConfiguration.default
            configuration.protocolClasses = [MockURLProtocol.self]
            configuration.urlCache = nil
            return configuration
        }()
        let liveConfiguration: URLSessionConfiguration = {
            let configuration = URLSessionConfiguration.default
            configuration.urlCache = nil
            return configuration
        }()
        
        self.liveManager = Session(configuration: liveConfiguration)
        self.mockManager = Session(configuration: mockConfiguration)
    }
}

public enum RequestState {
    case live
    case mock
    
    public var session: Session {
        switch self {
        case .live:
            return RequestManager.shared.liveManager
        case .mock:
            return RequestManager.shared.mockManager
        }
    }
}
