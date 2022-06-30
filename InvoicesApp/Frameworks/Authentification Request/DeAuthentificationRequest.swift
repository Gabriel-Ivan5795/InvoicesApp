//
//  DeAuthentificationRequest.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 06.05.2022.
//

import UIKit
import FirebaseAuth
import InvoicesService

class DeAuthentificationRequest: IDeAuthentificationRequest {

    func logoutUserOnFirebase(_deAuthSuccess: @escaping(Bool) -> Void, _deAuthError: @escaping(String) -> Void) {
        do {
            try Auth.auth().signOut()
            _deAuthSuccess(true)
        } catch {
            _deAuthError("An error has occured during signout on firebase")
        }
    }
}
