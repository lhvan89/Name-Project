//
//  SwiftTheme+Extensions.swift
//  Name-Project
//
//  Created by Van Le on 9/28/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

extension UIPageControl {
    func setThemeCurrentPageIndicatorTintColor(keyPath: String, alpha: CGFloat = 1.0) {
        self.theme_currentPageIndicatorTintColor = ThemeColorPicker(keyPath: keyPath, map: { (colorCode) -> UIColor? in
            
            if let validColorCode = colorCode as? String {
                return UIColor.init(rgba: validColorCode).withAlphaComponent(alpha)
            }
            
            log.error("Not found colorCode in theme plist")
            
            return nil
        })
    }
    
    func setThemePageIndicatorTintColor(keyPath: String, alpha: CGFloat = 1.0) {
        self.theme_pageIndicatorTintColor = ThemeColorPicker(keyPath: keyPath, map: { (colorCode) -> UIColor? in
            
            if let validColorCode = colorCode as? String {
                return UIColor.init(rgba: validColorCode).withAlphaComponent(alpha)
            }
            
            log.error("Not found colorCode in theme plist")
            
            return nil
        })
    }
}

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

extension UILabel {
    
    func setThemeFont(style: FontStyle) {
        self.setThemeFont(keyPath: style.fontKey, fontSize: style.size)
    }
    
    func setThemeFont(keyPath: String, fontSize: CGFloat) {
        self.theme_font = ThemeFontPicker(keyPath: keyPath, map: { (fontName) -> UIFont? in
            
            if let validFontName = fontName as? String {
                return UIFont(name: validFontName, size: fontSize)
            }
            
            log.error("Not found fontName in theme plist")
            
            return nil
        })
    }
    
    func setThemeTextColor(keyPath: String, alpha: CGFloat = 1.0) {
        self.theme_textColor = ThemeColorPicker(keyPath: keyPath, map: { (colorCode) -> UIColor? in
            
            if let validColorCode = colorCode as? String {
                return UIColor.init(rgba: validColorCode).withAlphaComponent(alpha)
            }
            
            log.error("Not found colorCode in theme plist")
            
            return nil
        })
    }
}

extension UITextField {
    
    func setThemeFont(style: FontStyle) {
        self.setThemeFont(keyPath: style.fontKey, fontSize: style.size)
    }
    
    func setThemeFont(keyPath: String, fontSize: CGFloat) {
        self.theme_font = ThemeFontPicker(keyPath: keyPath, map: { (fontName) -> UIFont? in
            
            if let validFontName = fontName as? String {
                return UIFont(name: validFontName, size: fontSize)
            }
            
            log.error("Not found fontName in theme plist")
            
            return nil
        })
    }
    
    func setThemeTextColor(keyPath: String, alpha: CGFloat = 1.0) {
        self.theme_textColor = ThemeColorPicker(keyPath: keyPath, map: { (colorCode) -> UIColor? in
            
            if let validColorCode = colorCode as? String {
                return UIColor.init(rgba: validColorCode).withAlphaComponent(alpha)
            }
            
            log.error("Not found colorCode in theme plist")
            
            return nil
        })
    }
}

extension UITextView {
    
    func setThemeFont(style: FontStyle) {
        self.setThemeFont(keyPath: style.fontKey, fontSize: style.size)
    }
    
    func setThemeFont(keyPath: String, fontSize: CGFloat) {
        self.theme_font = ThemeFontPicker(keyPath: keyPath, map: { (fontName) -> UIFont? in
            
            if let validFontName = fontName as? String {
                return UIFont(name: validFontName, size: fontSize)
            }
            
            log.error("Not found fontName in theme plist")
            
            return nil
        })
    }
    
    func setThemeTextColor(keyPath: String, alpha: CGFloat = 1.0) {
        self.theme_textColor = ThemeColorPicker(keyPath: keyPath, map: { (colorCode) -> UIColor? in
            
            if let validColorCode = colorCode as? String {
                return UIColor.init(rgba: validColorCode).withAlphaComponent(alpha)
            }
            
            log.error("Not found colorCode in theme plist")
            
            return nil
        })
    }
}

extension UIButton {
    
    func setThemeImageWithColor(keyPath: String, alpha: CGFloat = 1.0, forState: UIControlState = .normal) {
        
        self.theme_setBackgroundImage(ThemeImagePicker.init(keyPath: keyPath) { (value) -> UIImage? in
            
            guard let rbga = value as? String else { return nil }
            
            let color = UIColor(rgba: rbga).withAlphaComponent(alpha)
            let image = Utilities.imageWithColor(color)
            return image
            
        }, forState: forState)
    }
    
    func setThemeTitleColor(keyPath: String, alpha: CGFloat = 1.0, forState: UIControlState = .normal) {
        
        self.theme_setTitleColor(ThemeColorPicker.init(keyPath: keyPath) { (value) -> UIColor? in
            
            guard let rbga = value as? String else { return nil }
            
            let color = UIColor(rgba: rbga).withAlphaComponent(alpha)
            return color
            
        }, forState: forState)
    }
    
    func setThemeRoundedButtonStyle(_ style: ButtonStyle, forState: UIControlState = .normal) {
        
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.titleLabel?.setThemeFont(style: style.fontStyle)
        
        if let backgroundColorKey = style.backgroundColorKey, let backgroundColorAlpha = style.backgroundColorAlpha {
            self.setThemeImageWithColor(keyPath: backgroundColorKey, alpha: backgroundColorAlpha, forState: forState)
        }
        
        self.setThemeTitleColor(keyPath: style.titleColorKey, alpha: style.titleColorAlpha, forState: forState)
        
        if let borderColorKey = style.borderColorKey {
            self.layer.theme_borderColor = ThemeCGColorPicker(keyPath: borderColorKey)
            self.layer.borderWidth = 1
        }
    }
    
    func setThemeButtonStyle(_ style: ButtonStyle, forState: UIControlState = .normal) {
        
        self.titleLabel?.setThemeFont(style: style.fontStyle)
        
        if let backgroundColorKey = style.backgroundColorKey, let backgroundColorAlpha = style.backgroundColorAlpha {
            self.setThemeImageWithColor(keyPath: backgroundColorKey, alpha: backgroundColorAlpha, forState: forState)
        }
        
        self.setThemeTitleColor(keyPath: style.titleColorKey, alpha: style.titleColorAlpha, forState: forState)
        
        if let borderColorKey = style.borderColorKey {
            self.layer.theme_borderColor = ThemeCGColorPicker(keyPath: borderColorKey)
            self.layer.borderWidth = 1.5
        }
    }
}
