//
//  SignUpViewModel.swift
//  Name-Project
//
//  Created by Van Le on 10/3/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

// MARK: Enums
enum RegisterField {
    case facebookButton
    case googleButton
    case email
    case username
    case location
    case password
    case confirmpassword
    case signUpButton
    case agreement
}

class SignUpViewModel: NSObject {
    
    var cellItems: [Any] = []
    
    override init() {
        super.init()
    }
    
    // MARK: - Private methods
    func generateCellItems() {
        self.cellItems.append(CGFloat(16))
        self.cellItems.append(SocialButtonTableCellItem(id: RegisterField.facebookButton.hashValue, text: LocalizeStrings.Account.continueWithFacebookString, icon: #imageLiteral(resourceName: "ic_facebook"), bgColor: ThemeKeys.Button.backgroundColor1.key))
        self.cellItems.append(SocialButtonTableCellItem(id: RegisterField.googleButton.hashValue, text: LocalizeStrings.Account.continueWithGoogleString, icon: #imageLiteral(resourceName: "ic_google"), bgColor: ThemeKeys.Button.backgroundColor5.key))
        
        self.cellItems.append(ACTextContentTableCellItem(text: LocalizeStrings.Account.orWithEmailString))
        self.cellItems.append(ACTextFieldTableCellItem(id: RegisterField.email.hashValue, text: "", placeholder: LocalizeStrings.Account.emailString, isEmail: true))
        self.cellItems.append(ACTextFieldTableCellItem(id: RegisterField.username.hashValue, text: "", placeholder: LocalizeStrings.Account.usernameString))
        self.cellItems.append(ACTextFieldTableCellItem(id: RegisterField.location.hashValue, text: ""/*self.signUpRequest.country*/, placeholder: LocalizeStrings.Account.locationString, isLocation: true))
        self.cellItems.append(ACTextFieldTableCellItem(id: RegisterField.password.hashValue, text: "", placeholder: LocalizeStrings.Account.passwordString, infoMessage: LocalizeStrings.ErrorMessage.passwordMustContainMinimumString, isSecurity: true))
        self.cellItems.append(ACTextFieldTableCellItem(id: RegisterField.confirmpassword.hashValue, text: "", placeholder: LocalizeStrings.Account.confirmPasswordString, isSecurity: true))
        self.cellItems.append(CGFloat(8))
        self.cellItems.append(ACButtonTableCellItem(id: RegisterField.signUpButton.hashValue, titleKey: LocalizeStrings.Account.signUp()))
        self.cellItems.append(ACAgreementTableCellItem(id: RegisterField.agreement.hashValue, title: LocalizeStrings.Account.agreementTextString))
    }
}
