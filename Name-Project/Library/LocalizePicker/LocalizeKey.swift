//
//  LocalizeKey.swift
//  Name-Project
//
//  Created by Van Le on 10/1/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

@objc public final class LocalizeKey: LocalizePicker {
    
    public convenience init(keyPath: String) {
        self.init(v: { keyPath.localized() })
    }
    
    public convenience init(keyPath: String, args: [String: String]) {
        var string = keyPath.localized()
        for arg in args {
            string = string.replacingOccurrences(of: "{\(arg.key)}", with: arg.value)
        }
        
        self.init(v: { string })
    }
    
    public required convenience init(stringLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public required convenience init(unicodeScalarLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public required convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(keyPath: value)
    }
}

extension LocalizeKey: ExpressibleByStringLiteral {}
