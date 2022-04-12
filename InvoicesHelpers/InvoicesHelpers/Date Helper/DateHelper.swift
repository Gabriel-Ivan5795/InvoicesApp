//
//  DateHelper.swift
//  NowAppHelpers
//
//  Created by Ivan Gabriel on 20.05.2021.
//

import UIKit

open class DateHelper {

    open class func parseStringTime(_stringTime: String!) -> String {
        var newString = _stringTime.replacingOccurrences(of: "T", with: " ")
        newString = newString.replacingOccurrences(of: "Z", with: "")
        let stringsArray = newString.components(separatedBy: ".")
        newString = stringsArray[0]
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: DateHelper.UTCToLocal(date: newString))!
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy - HH:mm"
        return formatter1.string(from: date)
    }
    
    open class func parseDateTime(_stringTime: String!) -> Date {
        var newString = _stringTime.replacingOccurrences(of: "T", with: " ")
        newString = newString.replacingOccurrences(of: "Z", with: "")
        if (newString.contains(".") == true) {
            let stringsArray = newString.components(separatedBy: ".")
            newString = stringsArray[0]
        }
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: DateHelper.UTCToLocal(date: newString))!
    }
    
    open class func parseStringDateWithoutDate(_stringTime: String!) -> String {
        if (_stringTime.isValid() == true) {
            var newString = _stringTime.replacingOccurrences(of: "T", with: " ")
            newString = newString.replacingOccurrences(of: "Z", with: "")
            let stringsArray = newString.components(separatedBy: ".")
            newString = stringsArray[0]
            
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = dateFormatter.date(from: DateHelper.UTCToLocal(date: newString))!
            
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "dd/MM/yyyy"
            return formatter1.string(from: date)
        }
        return ""
    }
    
    open class func parseStringTimeForOrder(_stringTime: String!) -> String {
        var newString = _stringTime.replacingOccurrences(of: "T", with: " ")
        newString = newString.replacingOccurrences(of: "Z", with: "")
        let stringsArray = newString.components(separatedBy: ".")
        newString = stringsArray[0]
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: DateHelper.UTCToLocal(date: newString))!
        return dateFormatter.string(from: date)
    }
    
    open class func parseStringTimeForMessages(_stringTime: String!) -> String {
        var newString = _stringTime.replacingOccurrences(of: "T", with: " ")
        newString = newString.replacingOccurrences(of: "Z", with: "")
        let stringsArray = newString.components(separatedBy: ".")
        newString = stringsArray[0]
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: DateHelper.UTCToLocal(date: newString))!
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "HH:mm"
        return formatter1.string(from: date)
    }
    
    open class func parsingStringDateFromInputToServer(_stringTime: String!) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy"
        let date = inputFormatter.date(from: _stringTime)
        inputFormatter.dateFormat = "yyyy-MM-dd"
        let returnString = inputFormatter.string(from: date!)
        return returnString
    }
    
    open class func UTCToLocal(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssX"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if (dt != nil) {
            return dateFormatter.string(from: dt!)
        }
        return ""
    }
    
    open class func UTCToLocalFromAppStoreSubscription(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if (dt != nil) {
            return dateFormatter.string(from: dt!)
        }
        return ""
    }
    
    open class func getTimeFromDateString(_stringTime: String) -> String {
        var newString = _stringTime.replacingOccurrences(of: "T", with: " ")
        newString = newString.replacingOccurrences(of: "Z", with: "")
        let stringsArray = newString.components(separatedBy: ".")
        newString = stringsArray[0]
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: DateHelper.UTCToLocal(date: newString))!
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy HH:mm"
        let arrayStrings = formatter1.string(from: date).components(separatedBy: " ")
        return arrayStrings[arrayStrings.count - 1]
    }
    
    open class func parsingDateToString(_date: Date, _dateFormatter: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = _dateFormatter
        return dateFormatter.string(from: _date)
    }
    
//    open class func parsingDateToUTC(_date: Date) -> Date {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
//    }
    
    open class func convertToUTC(dateToConvert: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let convertedDate = formatter.date(from: dateToConvert)
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.string(from: convertedDate!)
    }
    
}
