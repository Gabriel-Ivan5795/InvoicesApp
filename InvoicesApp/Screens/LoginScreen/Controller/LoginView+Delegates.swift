//
//  LoginView+Delegates.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 16.04.2022.
//

import UIKit
import AuthenticationServices

extension LoginViewController: UIGestureRecognizerDelegate, ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    
    @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        self.showAlert(_errorMessage: error.localizedDescription)
    }
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
            case let credentials as ASAuthorizationAppleIDCredential:
                self.loginViewModel.callAppleServerToGetCredentials(_user: credentials, _currentNonce: self.currentNonce)
                break
            default:
                break
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if (textField.isEqual(self.loginViewUI.getUsernameField().getInvoicesAppTextField().getField())) {
            if (textField.text?.isValid() == true) {
                self.loginViewUI.getUsernameField().showLabelPlaceholder()
            } else {
                self.loginViewUI.getUsernameField().hideLabelPlaceholder()
            }
        }
        
        if (textField.isEqual(self.loginViewUI.getPasswordField().getInvoicesAppTextField().getField())) {
            if (textField.text?.isValid() == true) {
                self.loginViewUI.getPasswordField().showLabelPlaceholder()
            } else {
                self.loginViewUI.getPasswordField().hideLabelPlaceholder()
            }
        }
    }
}
