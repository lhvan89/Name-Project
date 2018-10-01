//
//  UIKit+Localizable.swift
//  Name-Project
//
//  Created by Van Le on 10/1/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

extension UILabel {
    
    var localize_text: LocalizeKey? {
        get { return getLocalizePicker(self, "setText:") as? LocalizeKey }
        set { setLocalizePicker(self, "setText:", newValue) }
    }
}

extension UITextView {
    var localize_text: LocalizeKey? {
        get { return getLocalizePicker(self, "setText:") as? LocalizeKey }
        set { setLocalizePicker(self, "setText:", newValue) }
    }
}

extension UITextField {
    
    var localize_placeholder: LocalizeKey? {
        get { return getLocalizePicker(self, "setPlaceholder:") as? LocalizeKey }
        set { setLocalizePicker(self, "setPlaceholder:", newValue) }
    }
    
    var localize_toolBar_placeholder: LocalizeKey? {
        get { return getLocalizePicker(self, "setToolbarPlaceholder:") as? LocalizeKey }
        set { setLocalizePicker(self, "setToolbarPlaceholder:", newValue) }
    }
}

extension UISearchBar {
    
    var localize_placeholder: LocalizeKey? {
        get { return getLocalizePicker(self, "setPlaceholder:") as? LocalizeKey }
        set { setLocalizePicker(self, "setPlaceholder:", newValue) }
    }
}

extension UIButton {
    func localize_setTitle(_ picker: LocalizeKey?, forState state: UIControlState) {
        let statePicker = makeStatePicker(self, "setTitle:forState:", picker, state)
        setLocalizePicker(self, "setTitle:forState:", statePicker)
    }
}

extension UIViewController {
    
    var localize_title: LocalizeKey? {
        get { return getLocalizePicker(self, "setTitle:") as? LocalizeKey }
        set { setLocalizePicker(self, "setTitle:", newValue) }
    }
}

private func getLocalizePicker (
    _ object : NSObject,
    _ selector : String
    ) -> LocalizePicker? {
    return object.localizePickers[selector]
}

private func setLocalizePicker (
    _ object : NSObject,
    _ selector : String,
    _ picker : LocalizePicker?
    ) {
    
    object.localizePickers[selector] = picker
    object.performLocalizePicker(selector: selector, picker: picker)
}

private func makeStatePicker(
    _ object : NSObject,
    _ selector : String,
    _ picker : LocalizePicker?,
    _ state : UIControlState
    ) -> LocalizePicker? {
    
    var picker = picker
    
    if let statePicker = object.localizePickers[selector] as? LocalizeStatePicker {
        picker = statePicker.setPicker(picker, forState: state)
    } else {
        picker = LocalizeStatePicker(picker: picker, withState: state)
    }
    return picker
}
