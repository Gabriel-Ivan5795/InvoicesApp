//
//  IDeAuthentificationRequest.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 06.05.2022.
//

import Foundation

public protocol IDeAuthentificationRequest {
    
    func logoutUserOnFirebase(_deAuthSuccess: @escaping(Bool) -> Void, _deAuthError: @escaping(String) -> Void)
}
