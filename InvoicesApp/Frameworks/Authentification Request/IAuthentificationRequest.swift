//
//  IAuthentificationRequest.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 17.04.2022.
//

import Foundation

protocol IAuthentificationRequest {
    
    func loginUserOnFirebase(_loginModel: LoginModel?, _authSuccess: @escaping(LoginResponseModel) -> Void, _authError: @escaping(String) -> Void)
}
