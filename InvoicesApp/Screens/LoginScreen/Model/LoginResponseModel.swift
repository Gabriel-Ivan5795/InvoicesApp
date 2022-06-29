//
//  LoginResponseModel.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 30.06.2022.
//

import UIKit

class LoginResponseModel: Decodable {

    var token: String?
    var uuid: String?
    
    init(_token: String? = nil, _uuid: String? = nil) {
        self.token = _token
        self.uuid = _uuid
    }
}
