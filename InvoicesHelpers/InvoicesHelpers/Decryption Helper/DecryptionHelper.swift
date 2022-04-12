//
//  DecryptionHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 07.02.2022.
//

import UIKit
import AES256Swift

open class DecryptionHelper: NSObject {

    open class func decrypt(_stringToDecrypt: String, _keyToDecrypt: String) -> String {
        AESKey.setKey(_keyToDecrypt)
        
        if (_keyToDecrypt.isValid() == true) {
            return _stringToDecrypt.aes256Decrypt
        }
        return ""
    }
    
    open class func encrypt(_stringToEncode: String, _passwordToEncode: String) -> String {
        AESKey.setKey(_passwordToEncode)
        
        return _stringToEncode.aes256Encrypt
    }
}
