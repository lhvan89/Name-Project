//
//  SwiftTheme+Extensions.swift
//  Name-Project
//
//  Created by Van Le on 9/28/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

extension UIView {
    func setThemeBackgroundColor(keyPath: String, alpha: CGFloat = 1.0) {
        self.theme_backgroundColor = ThemeColorPicker(keyPath: keyPath, map: { (colorCode) -> UIColor? in
            
            if let validColorCode = colorCode as? String {
                return UIColor.init(rgba: validColorCode).withAlphaComponent(alpha)
            }
            
            log.error("Not found colorCode in theme plist")
            
            return nil
        })
    }
}
