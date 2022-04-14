//
//  StringHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 23.02.2021.
//

import Foundation
import UIKit

extension String {
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    public func isValid() -> Bool {
        let selfWithWhitespaces = replacingOccurrences(of: " ", with: "")
        return selfWithWhitespaces.count > 0
    }
    
    public func isNumberPlateValid() -> Bool {
        let plateRegex = "[A-Z0-9ÆØÅ]{2,7}"
        let plateTest = NSPredicate(format: "SELF MATCHES %@", plateRegex)
        return plateTest.evaluate(with: self)
    }
    
    public func isEmailValid() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    public func isNumberPlateDenmarkValid() -> Bool {
        let plateRegex = "^[A-Z ÆØÅ]{2}\\s?[0-9]{2}\\s?[0-9]{3}$"
        let plateTest = NSPredicate(format: "SELF MATCHES %@", plateRegex)
        return plateTest.evaluate(with: self)
    }
    
    public func isNumberVanityPlateDenmark() -> Bool {
        let plateRegex = "^[A-Z ÆØÅ]{2,7}$"
        let plateTest = NSPredicate(format: "SELF MATCHES %@", plateRegex)
        return plateTest.evaluate(with: self)
    }
    
    public func isNumberPlateRomaniaValid() -> Bool {
        let plateRegex = "^[A-Z]{2}\\s?[0-9]{2}\\s?[A-Z]{3}$"
        let plateTest = NSPredicate(format: "SELF MATCHES %@", plateRegex)
        return plateTest.evaluate(with: self)
    }
    
    func isCostValid() -> Bool {
        let doubleValue = Double(self)
        if doubleValue == nil { return false }
        let intValue = Int(doubleValue!)
        if intValue == 0 { return false }
        return true
    }
    
    func isPasswordValid() -> Bool {
        var passwordMinOneLowerCharacters: Bool
        let charsetL = CharacterSet(charactersIn: "qwertyuiopasdfghjklzxcvbnm")
        if rangeOfCharacter(from: charsetL) != nil {
            passwordMinOneLowerCharacters = true
        } else {
            passwordMinOneLowerCharacters = false
        }
        
        var passwordMinOneUpperCharacters: Bool
        let charsetU = CharacterSet(charactersIn: "QWERTYUIOPASDFGHJKLZXCVBNM")
        if rangeOfCharacter(from: charsetU) != nil {
            passwordMinOneUpperCharacters = true
        } else {
            passwordMinOneUpperCharacters = false
        }
        
        var passwordDigitCharacters: Bool
        let charactersDigit = CharacterSet(charactersIn: "0123456789")
        if rangeOfCharacter(from: charactersDigit) != nil {
            passwordDigitCharacters = true
        } else {
            passwordDigitCharacters = false
        }
        
        var passwordSpecialCharacters: Bool
        let characterSet: CharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789")
        if rangeOfCharacter(from: characterSet.inverted) != nil {
            passwordSpecialCharacters = true
        } else {
            passwordSpecialCharacters = false
        }
        
        if (passwordMinOneLowerCharacters == false) {
            if (passwordMinOneUpperCharacters == true && passwordDigitCharacters == true && passwordSpecialCharacters == true) {
                return true
            }
            return false
        }
        
        if (passwordMinOneUpperCharacters == false) {
            if (passwordMinOneLowerCharacters == true && passwordDigitCharacters == true && passwordSpecialCharacters == true) {
                return true
            }
            return false
        }
        
        if (passwordDigitCharacters == false) {
            if (passwordMinOneLowerCharacters == true && passwordMinOneUpperCharacters == true && passwordSpecialCharacters == true) {
                return true
            }
            return false
        }
        
        if (passwordSpecialCharacters == false) {
            if (passwordMinOneLowerCharacters == true && passwordMinOneUpperCharacters == true && passwordDigitCharacters == true) {
                return true
            }
            return false
        }
        
        return false
    }
    
    func isPasswordEnoughCharacters() -> Bool {
        if self.count < 8 {
            return false
        }
        
        return true
    }
    
    public func isTelephoneValid() -> Bool {
        let phoneRegex = "^[+]?[0-9]{8,20}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    
    public func removeSpacesFromString() -> String {
        let newTextWithoutSpaces = self.replacingOccurrences(of: " ", with: "")
        return newTextWithoutSpaces
    }
    
    public func localeString(langCode: String) -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 2
        nf.minimumFractionDigits = 2
        nf.locale = Locale(identifier: langCode)
        let selfDouble = Double(self)
        return nf.string(from: (selfDouble as NSNumber?) ?? 0.00) ?? String(format: "%.2f", self)
    }
    
    public func setTimeFormatForDanish(langCode: String) -> String {
        if langCode == "da" {
            return self.replacingOccurrences(of: ":", with: ".")
        }
        return self
    }
}
