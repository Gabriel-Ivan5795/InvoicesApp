//
//  LoginResponseModel.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 30.06.2022.
//

import UIKit
import InvoicesService

class LoginResponseModel: BaseLoginResponseModel {

    var token: String?
    var uuid: String?
    
    init(_token: String? = nil, _uuid: String? = nil) {
        super.init()
        self.token = _token
        self.uuid = _uuid
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
