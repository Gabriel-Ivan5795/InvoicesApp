//
//  NowAppViewsIdentifiers.swift
//  NowAppConstants
//
//  Created by Gabriel Ivan on 26.06.2022.
//

import Foundation


public struct ViewsIdentifiers {
    
    // MARK: - Splash screen view
    public static let splashScreenBackgroundImageIdentifier = "splashScreenBackgroundImageIdentifier"
    
    // MARK: - Welcome screen view
    public static let welcomeScreenLoginButtonIdentifier = "welcomeScreenLoginButtonIdentifier"
    
    // MARK: - Login screen view
    public static let loginScreenUsernameFieldIdentifier = "loginScreenUsernameFieldIdentifier"
    public static let loginScreenPasswordFieldIdentifier = "loginScreenPasswordFieldIdentifier"
    public static let loginScreenLoginButtonIdentifier = "loginScreenLoginButtonIdentifier"
    public static let loginScreenWrongPasswordIdentifier = "loginScreenWrongPasswordIdentifier"
    public static let loginScreenForgotPasswordButtonIdentifier = "loginScreenForgotPasswordButtonIdentifier"
    public static let loginScreenAlertInvalidEmailIdentifier = "loginScreenAlertInvalidEmailIdentifier"
    public static let loginScreenAlertInvalidPasswordIdentifier = "loginScreenAlertInvalidPasswordIdentifier"
    public static let loginScreenAlertEmptyEmailIdentifier = "loginScreenAlertEmptyEmailIdentifier"
    public static let loginScreenAlertEmptyPasswordIdentifier = "loginScreenAlertEmptyPasswordIdentifier"
    public static let loginScreenAlertEmptyAllFieldsIdentifier = "loginScreenAlertEmptyAllFieldsIdentifier"
    
    // MARK: - Forgot screen view
    public static let forgotScreenAlertErrorIdentifier = "forgotScreenAlertErrorIdentifier"
    public static let forgotScreenAlertInformIdentifier = "forgotScreenAlertInformIdentifier"
    
    // MARK: - HitchARide screen view
    public static let hitchARideScreenImageBackgroundIdentifier = "hitchARideScreenImageBackgroundIdentifier"
    public static let hitchARideScreenHitchaRideButtonIdentifier = "hitchARideScreenHitchaRideButtonIdentifier"
    
    // MARK: - ScanningRide screen view
    public static let scanningRideScreenTitleLabelIdentifier = "scanningRideScreenTitleLabelIdentifier"
    public static let scanningRideScreenCancelButtonIdentifier = "scanningRideScreenCancelButtonIdentifier"
    public static let scanningRideScreenEnterNRPlateButtonIdentifier = "scanningRideScreenEnterNRPlateButtonIdentifier"
    
    // MARK: - EnterSelf screen view
    public static let enterSelfScreenNumberPlateFieldIdentifier = "enterSelfScreenNumberPlateFieldIdentifier"
    
    // MARK: - ConfirmLicensePlate screen view
    public static let confirmLicensePlateScreenBackgroundImageIdentifier = "confirmLicensePlateScreenBackgroundImageIdentifier"
    public static let confirmLicensePlateScreenDriversViewIdentifier = "confirmLicensePlateScreenDriversViewIdentifier"
    public static let confirmLicensePlateScreenAlertNoDriversIdentifier = "confirmLicensePlateScreenAlertNoDriversIdentifier"
    public static let confirmLicensePlateScreenConfirmPlateButtonIdentifier = "confirmLicensePlateScreenConfirmPlateButtonIdentifier"
    
    //MARK: - Ride screen view
    public static let rideScreenBackgroundImageIdentifier = "rideScreenBackgroundImageIdentifier"
    public static let rideScreenStopRideButtonIdentifier = "rideScreenStopRideButtonIdentifier"
    
    //MARK: - Complete ride screen view
    public static let completeRideScreenBackgroundImageIdentifier = "completeRideScreenBackgroundImageIdentifier"
    public static let completeRideScreenCompleteRideButtonIdentifier = "completeRideScreenCompleteRideButtonIdentifier"
    
    // MARK: - Tabs screen view
    public static let tabsScreenMenuButtonIdentifier = "tabsScreenMenuButtonIdentifier"
    public static let tabsScreenMenuMainViewIdentifier = "tabsScreenMenuMainViewIdentifier"
    public static let tabsScreenMessagesButtonIdentifier = "tabsScreenMessagesButtonIdentifier"
    public static let tabsScreenFriendsButtonIdentifier = "tabsScreenFriendsButtonIdentifier"
    
    //MARK: - Transactions screen view
    public static let transactionsScreenTableViewIdentifier = "transactionsScreenTableViewIdentifier"

    // MARK: - Menu screen view
    public static let menuScreenLogOutButtonIdentifier = "menuScreenLogOutButtonIdentifier"
    public static let menuScreenMyProfileButtonItemIdentifier = "menuScreenMyProfileBtnItemIdentifier"
    public static let menuScreenTransactionsButtonItemIdentifier = "menuScreenTransactionsBtnItemIdentifier"
    public static let menuScreenMyPaymentsButtonIdentifier = "menuScreenMyPaymentsButtonIdentifier"
    public static let menuScreenInformationButtonItemIdentifier = "menuScreenInformationBtnItemIdentifier"
    public static let menuScreenSettingsButtonIdentifier = "menuScreenSettingsButtonIdentifier"
    public static let menuScreenMessagesButtonIdentifier = "menuScreenMessagesButtonIdentifier"
    
    // MARK: - BankAccount screen view
    public static let bankAccountScreenRegNRFieldIdentifier = "bankAccountScreenRegNRFieldIdentifier"
    public static let bankAccountScreenKontonrFieldIdentifier = "bankAccountScreenKontonrFieldIdentifier"
    public static let bankAccountScreenDonateButtonIdentifier = "bankAccountScreenDonateButtonIdentifier"
    public static let bankAccountScreenSaveButtonIdentifier = "bankAccountScreenSaveButtonIdentifier"
    public static let bankAccountScreenBackButtonIdentifier = "bankAccountScreenBackButtonIdentifier"
    
    // MARK: - BankAccountDonate screen view
    public static let bankAccountDonateScreenCheckButtonIdentifier = "bankAccountDonateScreenCheckButtonIdentifier"
    public static let bankAccountDonateScreenRegNRFieldIdentifier = "bankAccountDonateScreenRegNRFieldIdentifier"
    public static let bankAccountDonateScreenKontonrFieldIdentifier = "bankAccountDonateScreenKontonrFieldIdentifier"
    public static let bankAccountDonateScreenSaveButtonIdentifier = "bankAccountDonateScreenSaveButtonIdentifier"
    public static let bankAccountDonateScreenCharityButtonFieldIdentifier = "bankAccountDonateScreenCharityButtonFieldIdentifier"
    public static let bankAccountDonateScreenCharityPercentButtonFieldIdentifier = "bankAccountDonateScreenCharityPercentButtonFieldIdentifier"
    public static let bankAccountDonateScreenCompleteRegNrAlertIdentifier = "bankAccountDonateScreenCompleteRegNrAlertIdentifier"
    public static let bankAccountDonateScreenCompleteKontoNrAlertIdentifier = "bankAccountDonateScreenCompleteKontoNrAlertIdentifier"
    public static let bankAccountDonateScreenChoosePercentageAlertIdentifier = "bankAccountDonateScreenChoosePercentageAlertIdentifier"
    public static let bankAccountDonateScreenCompleteBankAccountNrAndRegAlertIdentifier = "bankAccountDonateScreenCompleteBankAccountNrAndRegAlertIdentifier"
    public static let bankAccountDonateScreenBackButtonIdentifier = "bankAccountDonateScreenBackButtonIdentifier"
    
    // MARK: - MyProfile screen view
    public static let myProfileScreenBankOptionsButtonIdentifier = "myProfileScreenBankOptionsButtonIdentifier"
    public static let myProfileScreenEditPaymentButtonIdentifier = "myProfileScreenEditPaymentButtonIdentifier"
    public static let myProfileScreenBackButtonIdentifier = "myProfileScreenBackButtonIdentifier"
    
    // MARK: - PaymentDetails screen view
    public static let paymentDetailsScreenObjToPaymentButtonIdentifier = "paymentDetailsScreenObjToPaymentButtonIdentifier"
    public static let paymentDetailsScreenFeeCalculationButtonIdentifier = "paymentDetailsScreenFeeCalculationButtonIdentifier"
    public static let paymentDetailsScreenRatingAlertIdentifier = "paymentDetailsScreenRatingAlertIdentifier"
    public static let paymentDetailsScreenRatingDriverButtonIdentifier = "paymentDetailsScreenRatingDriverButtonIdentifier"
    public static let paymentDetailsScreenBottomButtonIdentifier = "paymentDetailsScreenBottomButtonIdentifier"
    public static let paymentDetailsScreenAddContactButtonOnDriverIdentifier = "paymentDetailsScreenAddContactButtonOnDriverIdentifier"
    public static let paymentDetailsScreenAddContactAlertIdentifier = "paymentDetailsScreenAddContactAlertIdentifier"
    public static let paymentDetailsScreenAddContactErrorIdentifier = "paymentDetailsScreenAddContactErrorIdentifier"
    
    // MARK: - ObjectToPayment screen view
    public static let objectToPaymentScreenBottomButtonIdentifier = "objectToPaymentScreenBottomButtonIdentifier"
    
    // MARK: - FeeCalculation screen view
    public static let feeCalculationScreenBottomButtonIdentifier = "feeCalculationScreenBottomButtonIdentifier"
    
    // MARK: - Rating screen view
    public static let ratingScreenBackgroundImageIdentifier = "ratingScreenBackgroundImageIdentifier"
    
    // MARK: - Info screen view
    public static let infoScreenWebViewIdentifier = "infoScreenWebViewIdentifier"
    public static let infoScreenBottomButtonIdentifier = "infoScreenBottomButtonIdentifier"
    
    // MARK: - Payment screen view
    public static let paymentScreenBottomButtonIdentifier = "paymentScreenBottomButtonIdentifier"
    public static let paymentScreenWebViewIdentifier = "paymentScreenWebViewIdentifier"
    
    // MARK: - Settings screen view
    public static let settingsScreenBackButtonIdentifier = "settingsScreenBackButtonIdentifier"
    public static let settingsScreenTermsButtonIdentifier = "settingsScreenTermsButtonIdentifier"
    
    // MARK: - Terms screen view
    public static let termsScreenBackButtonIdentifier = "termsScreenBackButtonIdentifier"
    public static let termsScreenWebViewIdentifier = "termsScreenWebViewIdentifier"
    
    // MARK: - Messages screen view
    public static let messagesScreenBackButtonIdentifier = "messagesScreenBackButtonIdentifier"
    public static let messagesScreenNewMessageButtonIdentifier = "messagesScreenNewMessageButtonIdentifier"
    
    // MARK: - NewMessage screen view
    public static let newMessageScreenBackButtonIdentifier = "newMessageScreenBackButtonIdentifier"
    public static let newMessageScreenSearchTextFieldIdentifier = "newMessageScreenSearchTextFieldIdentifier"
    
    // MARK: - Conversation screen view
    public static let conversationScreenBackButtonIdentifier = "conversationScreenBackButtonIdentifier"
    public static let conversationScreenTextFieldIdentifier = "conversationScreenTextFieldIdentifier"
    public static let conversationScreenSendButtonIdentifier = "conversationScreenSendButtonIdentifier"
    
    // MARK: - Friends screen view
    public static let friendsScreenSearchFieldIdentifier = "friendsScreenSearchFieldIdentifier"
    public static let friendsScreenAddContactButtonIdentifier = "friendsScreenAddContactButtonIdentifier"
    public static let friendsScreenBottomButtonIdentifier = "friendsScreenBottomButtonIdentifier"
    
    // MARK: - AddContact screen view
    public static let addContanctScreenSearchFieldIdentifier = "addContanctScreenSearchFieldIdentifier"
    public static let addContanctScreenBottomButtonIdentifier = "addContanctScreenBottomButtonIdentifier"
    
    // MARK: - Keyboard keys
    public static let returnIdentifier = "return"
    public static let searchIdentifier = "search"
}
