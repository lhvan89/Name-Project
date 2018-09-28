//
//  AppConfig.swift
//  Name-Project
//
//  Created by Van Le on 9/28/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

class AppConfig: NSObject {
    
    static let shared = AppConfig()
    
    func configure() {
        
        ThemeManager.setTheme(plistName: "MainTheme", path: .mainBundle)
    }
}
