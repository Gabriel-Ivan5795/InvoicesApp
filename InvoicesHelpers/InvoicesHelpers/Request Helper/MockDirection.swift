//
//  MockDirection.swift
//  Project Learning Testing
//
//  Created by Ivan Gabriel on 10/04/2020.
//  Copyright © 2020 Roweb. All rights reserved.
//

import Foundation

enum MockDirection: String {
    case get = "GET", put = "PUT", post = "POST", delete = "DELETE"
    
    private func isToken(_ item: String) -> Bool {
        let num = Int(item)
        return num != nil
    }
    
    fileprivate func kind(_ tokens: [String] = []) -> [String] {
        guard
            let lastToken = tokens.last,
            let firstToken = tokens.first,
            let lastAction = output.last,
            let firstAction = output.first
        else { return [] }
        
        // Process Index Action
        if !isToken(lastToken), self == .get {
            return [lastToken, lastAction]
        }
        
        // Process Show Action
        if isToken(lastToken), self == .get {
            return [firstToken, firstAction]
        }
        
        // Process Create Action
        if !isToken(lastToken), self == .post {
            return [lastToken, firstAction]
        }
        
        return [firstToken, lastAction]
    }
    
    private var output: [String] {
        switch self {
            case .get: return ["GET"]
            case .put: return ["UPDATE"]
            case .post: return ["POST"]
            case .delete: return ["DELETE"]
        }
    }
}

struct Mocks {
    private static var mocks = [
        "notifications": [
            "notifications": "{\"responseType\":\"success\",\"message\":\"Success message - S001 \",\"data\":[{\"cityId\":1,\"userId\":234,\"complaintId\":125,\"description\":\"New Event was added\",\"dateCreated\":\"10-03-2020\"}],\"pagination\":{\"pageNumber\":1,\"lastPageNumber\":6,\"elementsPerPage\":20}}"
        ],
        "state": [
            "config": "{\"code\":1.5,\"message\":\"Success\",\"data\":{\"translationVersion\":2,\"noMovemenTimeLimit\":1,\"speedLimit\":1,\"hoursBeforeNotification\":1,\"hoursBeforeMail\":2,\"feePassenger\":10,\"feeDriver\":10,\"co2\":100,\"timeGPS\":20,\"userExistMessage\":\"This user exist. Log in as user, or choose a new username\",\"notPassengerMsg\":\"This user exist. Log in as user, or choose a new username\"}}",
            "translations": "{\"code\":0,\"message\":\"Succe\",\"data\":[{\"lang\":\"en\",\"translations\":[{\"key\":\"name\",\"value\":\"Nume\"}]}]}"
        ]
    ]
    
    private static func getJSON(_ resource: String, action: String) -> String? {
        guard let object = mocks[resource] else {
            print("FAILED TO FIND KEY")
            return nil
        }
        guard let action = object[action] else {
            print("FAILED TO FIND RESOURCE ACTION, PLEASE INCLUDE MOCK")
            return nil
        }
        return action
    }
    
    static func find(_ request: URLRequest) -> Data? {
        guard let parts = (request.url?.pathComponents)
        else { return nil }
        let suffix = parts.suffix(2).map { i in i }
        let loadJSON = getJSON(suffix[0], action: suffix[1])
        
        if (loadJSON != nil) {
        
            return loadJSON!.data(using: String.Encoding.utf8)
        }
        
        return nil
    }
}
