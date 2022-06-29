//
//  NowAppConstants.swift
//  NowAppConstants
//
//  Created by Gabriel Ivan on 26.06.2022.
//

import Foundation

public struct Constants {
    
    //MARK: - URLs internal(API)
    //staging
    public static let urlBase = "http://pinstop.dk.test.vjm.dk/api/v1/"
    public static let urlBaseUploads = "http://pinstop.dk.test.vjm.dk/uploads/"
    public static let urlBaseWEB = "http://pinstop.dk.test.vjm.dk"

//    //live
//    public static let urlBase = "https://www.pinstop.dk/api/v1/"
//    public static let urlBaseUploads = "https://www.pinstop.dk/uploads/"
//    public static let urlBaseWEB = "https://www.pinstop.dk"

    //MARK: - URLs external(WebView)
    //staging
    public static let termsAndConditionsURL = "https://www.pinstop.dk/handelsbetingelser"
    public static let paymentWebURL = "http://pinstop.dk.test.vjm.dk/quickpay/register-card"
    public static let nemIDURL = "http://pinstop.dk.test.vjm.dk/nem-id/login"
    public static let objectToPaymentURL = "https://www.pinstop.dk/indsigelse"
//    //live
//    public static let termsAndConditionsURL = "https://www.pinstop.dk/handelsbetingelser"
//    public static let paymentWebURL = "https://www.pinstop.dk/quickpay/register-card"
//    public static let nemIDURL = "https://www.pinstop.dk/nem-id/login"
//    public static let objectToPaymentURL = "https://www.pinstop.dk/indsigelse"
    
    //MARK: - google maps
    //staging
    public static let apiKeyGoogleMaps = "AIzaSyBmGSoE6YmjtbKeaBI_ZbRmyFTlBx7ybW8"
//    //live
//    public static let apiKeyGoogleMaps = "AIzaSyBmGSoE6YmjtbKeaBI_ZbRmyFTlBx7ybW8"
    
    //MARK: - identifiers for database and translations framework
//    //staging
//    public static let pinStopCoreBundle = "Staging.NowDanmark.PinStop.Core"
//    public static let pinStopTranslationsBundle = "Staging.NowDanmark.PinStop.Translations"
//    //live
//    public static let pinStopCoreBundle = "NowDanmark.PinStop.Core"
//    public static let pinStopTranslationsBundle = "NowDanmark.PinStop.Translations"
    
//    //both same live and staging
    public static let pinStopCoreBundle = "NowDanmark.PinStop.Core"
    public static let pinStopTranslationsBundle = "NowDanmark.PinStop.Translations"
    
    //MARK: - firebase paths
    public static let connectionsPath = "connections"
    public static let messagesPath = "messages"
    public static let appleStoreKeyPath = "keyAppleStore"
    public static let appleStoreHashKeyPath = "appleStoreHash/keys"
    public static let appleStoreKeyForDecodingPath = "keyAppleForDecoding"
    
    //MARK: - application,account,screen and network status
    public static let isLoggedIn = "isLoggedIn"
    public static let lastInternetStatus = "lastInternetStatus"
    public static let firstLaunch = "firstLaunch"
    public static let registerStep = "registerStep"
    
    public static let acessToken = "NowAppAccessToken"
    public static let refreshToken = "NowAppRefreshToken"
    public static let firebaseToken = "NowAppFirebaseDeviceToken"
    
    //MARK: - constants strings
    public static let noMovemenTimeLimit = "noMovemenTimeLimit"
    public static let speedLimit = "speedLimit"
    public static let feePassenger = "feePassenger"
    public static let feeDriver = "feeDriver"
    public static let co2 = "co2"
    public static let timeGPS = "timeGPS"
    public static let decline_options = "decline_options"
    public static let info_page = "info-page"
    public static let terms = "terms"
    
    //MARK: - time elapsed, co2 and distance
    public static let lastKnowCO2Saved = "lastKnowCO2Saved"
    public static let lastDistance = "lastDistance"
    public static let lastTimeDriving = "lastTimeDriving"
    public static let lastStatusRide = "lastStatusRide"
    public static let driverId = "driverId"
    public static let driverNickName = "driverNickName"
    public static let driverNumberPlate = "driverNumberPlate"
    public static let driverRating = "driverRating"
    public static let driverRatingCount = "driverRatingCount"
    public static let driverRideId = "driverRideId"
    public static let ratingSent = "ratingSent"
    public static let driverSmallImage = "driverSmallImage"
    public static let totalCO2Kg = "totalCO2Kg"
    
    //MARK: - email and other user constants
    public static let idUser = "idUser"
    public static let emailUser = "emailUser"
    public static let myNickName = "myNickName"
    public static let nameUser = "nameUser"
    public static let userTempFromRegister = "userTempFromRegister"
    public static let amIDriver = "amIDriver"
    public static let photoLink = "photoLink"
    public static let numberPlate = "numberPlate"
    public static let numberPlateAlternative1 = "numberPlateAlternative1"
    public static let numberPlateAlternative2 = "numberPlateAlternative2"
    
    //MARK: - account payments constants
    public static let paymentOverdue = "paymentOverdue"
    public static let paymentOverdueAmount = "paymentOverdueAmount"
    
    //MARK: - firebase keys
    public static let keyReceiverUid = "receiver_uid"
    public static let keySenderUid = "sender_uid"
    public static let keyTextMessage = "text"
    public static let keySentDate = "sent_date"
    
    //MARK: - counter keys
    public static let keyCounterUnreadMessages = "keyCounterUnreadMessages"
    
    //MARK: - ride status
    public static let keyRideStatus = "keyRideStatus"
    
    //MARK: - subscription
    public static let keyCheckedSubscription = "keyCheckedSubscription"
    public static let keyLatestTransactionTime = "keyLatestTransactionTime"
    public static let keyDecryptAppStoreCheckPassword = "keyDecryptAppStoreCheckPassword"
    //staging
    public static let keyEncodedAppStoreCheckPassword = "6f1b421c347fa4c0a403eb22499751e1171369dd0181dd6362569730ccbaaed50f15705bd30ca840343c0b97ad536358"
//    //live
//    public static let keyEncodedAppStoreCheckPassword = "e7e2f3697602728c14e3ef5597e4bf4aacc4cb295015660cdb1fcfa4797b43290f15705bd30ca840343c0b97ad536358"
  
    //staging
    public static let pinStopMonthlySubscriptionWith6MonthsFree = "Staging.NowDanmark.PinStop.subscription.monthly.sixmonthsfree"
//    //live
//    public static let pinStopMonthlySubscriptionWith6MonthsFree = "NowDanmark.PinStop.subscription.monthly.sixmonthsfree"
    
    //MARK: - splashscreenexpiredatebackground
    public static let splashscreenexpiredatebackground = "splashscreenexpiredatebackground"
    public static let imageSplashScreenBackground = "imageSplashScreenBackground"
    public static let getDoneSplashScreenBackground = "getDoneSplashScreenBackground"
    
    //MARK: - apple subscription url
    public static let appleSubscriptionURL = "https://apps.apple.com/account/subscriptions"
    
    //MARK: - latestVersionOfApp
    public static let latestVersionOfApp = "latestVersionOfApp"
    public static let latestBuildOfApp = "latestBuildOfApp"
    
    //MARK: - readed number plate manually
    public static let readedNumberPlateManually = "readedNumberPlateManually"
}
