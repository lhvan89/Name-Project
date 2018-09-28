//
//  ThemeKeys.swift
//  Name-Project
//
//  Created by Van Le on 9/28/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

protocol ThemeKeyProtocol {
    static var key: String { get }
}

struct ThemeKeys {
    
    static func mergeKeys(firstKey: String, secondKey: String) -> String {
        return String(format: "%@.%@", firstKey, secondKey)
    }
    
    // View
    struct View: ThemeKeyProtocol {
        static private(set) var key: String = "view"
        
        /// Black
        struct backgroundColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: View.key, secondKey: "backgroundColor")
        }
        
        /// Red
        struct backgroundColor2: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: View.key, secondKey: "backgroundColor2")
        }
        
        /// White
        struct backgroundColor3: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: View.key, secondKey: "backgroundColor3")
        }
    }
}
