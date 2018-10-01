//
//  NSObject+Localizable.swift
//  Name-Project
//
//  Created by Van Le on 10/1/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

extension NSObject {
    
    typealias LocalizePickers = [String: LocalizePicker]
    
    var localizePickers: LocalizePickers {
        get {
            if let localizeKeys = objc_getAssociatedObject(self, &localizeKey) as? LocalizePickers {
                return localizeKeys
            }
            let initValue = LocalizePickers()
            objc_setAssociatedObject(self, &localizeKey, initValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return initValue
        }
        
        set {
            objc_setAssociatedObject(self, &localizeKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            _removeLocalizeNotification()
            if newValue.isEmpty == false { _setupLocalizeNotification() }
        }
    }
    
    func performLocalizePicker(selector: String, picker: LocalizePicker?) {
        let sel = Selector(selector)
        
        guard responds(to: sel)           else { return }
        guard let value = picker?.value() else { return }
        
        if let statePicker = picker as? LocalizeStatePicker {
            let setState = unsafeBitCast(method(for: sel), to: setValueForStateIMP.self)
            statePicker.values.forEach { setState(self, sel, $1.value()! as AnyObject, UIControlState(rawValue: $0)) }
        } else { perform(sel, with: value) }
    }
    
    fileprivate typealias setValueForStateIMP = @convention(c) (NSObject, Selector, AnyObject, UIControlState) -> Void
}

extension NSObject {
    
    fileprivate func _setupLocalizeNotification() {
        if #available(iOS 9.0, tvOS 9.0, *) {
            NotificationCenter.default.addObserver(self, selector: #selector(_updateLocalize), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
        } else {
            NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil, queue: nil, using: { [weak self] _ in self?._updateLocalize() })
        }
    }
    
    fileprivate func _removeLocalizeNotification() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
    }
    
    @objc private func _updateLocalize() {
        self.localizePickers.forEach { selector, picker in
            UIView.animate(withDuration: 0.3) {
                self.performLocalizePicker(selector: selector, picker: picker)
            }
        }
    }
}

private var localizeKey = ""
