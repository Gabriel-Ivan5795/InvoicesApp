//
//  SafeHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 08.03.2021.
//

import UIKit
import SwiftKeychainWrapper

open class SafeHelper: NSObject {

    //MARK: - save
    open class func saveTokens(_accessToken: String, _refreshToken: String, _accessTokenKey: String, _refreshTokenKey: String) {
        KeychainWrapper.standard.set(_accessToken,
                                     forKey: _accessTokenKey, withAccessibility: .always)
        KeychainWrapper.standard.set(_refreshToken,
                                     forKey: _refreshTokenKey, withAccessibility: .always)
    }
    
    open class func saveFirebaseToken(_firebaseToken: String, _firebaseTokenKey: String) {
        KeychainWrapper.standard.set(_firebaseToken,
                                     forKey: _firebaseTokenKey,
                                     withAccessibility: .always)
    }
    
    open class func saveToken(_accessToken: String, _accessTokenKey: String) {
        KeychainWrapper.standard.set(_accessToken,
                                     forKey: _accessTokenKey,
                                     withAccessibility: .always)
    }
    
    open class func saveKeyForDecodingFromFirebase(_keyFromFirebase: String, _keyForSaving: String) {
        KeychainWrapper.standard.set(_keyFromFirebase,
                                     forKey: _keyForSaving,
                                     withAccessibility: .always)
    }
    
    open class func saveCustomValueForKey(_value: String, _key: String) {
        KeychainWrapper.standard.set(_value,
                                     forKey: _key,
                                     withAccessibility: .always)
    }
    
    //MARK: - delete
    open class func deleteTokens(_accessTokenKey: String, _refreshTokenKey: String) {
        KeychainWrapper.standard.removeObject(forKey: _accessTokenKey,
                                              withAccessibility: .always)
        KeychainWrapper.standard.removeObject(forKey: _refreshTokenKey,
                                              withAccessibility: .always)
    }
    
    open class func deleteToken(_accessTokenKey: String) {
        KeychainWrapper.standard.removeObject(forKey: _accessTokenKey,
                                              withAccessibility: .always)
    }
    
    open class func deleteFirebaseToken(_firebaseTokenKey: String) {
        KeychainWrapper.standard.removeObject(forKey: _firebaseTokenKey,
                                              withAccessibility: .always)
    }
    
    open class func deleteKeyForDecoding(_keyToDecoding: String) {
        KeychainWrapper.standard.removeObject(forKey: _keyToDecoding,
                                              withAccessibility: .always)
    }
    
    open class func deleteCustomValueForKey(_key: String) {
        KeychainWrapper.standard.removeObject(forKey: _key,
                                              withAccessibility: .always)
    }
    
    //MARK: - get
    open class func getAccessToken(_accessTokenKey: String) -> String {
        return KeychainWrapper.standard.string(forKey: _accessTokenKey,
                                               withAccessibility: .always) ?? ""
    }
    
    open class func getRefreshToken(_refreshTokenKey: String) -> String {
        return KeychainWrapper.standard.string(forKey: _refreshTokenKey,
                                               withAccessibility: .always) ?? ""
    }
    
    open class func getFirebaseToken(_firebaseTokenKey: String) -> String {
        return KeychainWrapper.standard.string(forKey: _firebaseTokenKey,
                                               withAccessibility: .always) ?? ""
    }
    
    open class func getKeyForDecoding(_keyToDecoding: String) -> String {
        return KeychainWrapper.standard.string(forKey: _keyToDecoding,
                                               withAccessibility: .always) ?? ""
    }
    
    open class func getCustomValueForKey(_key: String) -> String {
        return KeychainWrapper.standard.string(forKey: _key,
                                               withAccessibility: .always) ?? ""
    }
    
    open class func syncronizedSafeHelper() {
        do {
            sleep(1)
        }
    }
}
