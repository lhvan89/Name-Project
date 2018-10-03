//
//  NSMutableAttributedString+setColorForText.swift
//  Name-Project
//
//  Created by Van Le on 10/3/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        self.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
    }
    
    func setFontForText(textForAttribute: String, withFont font: UIFont) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        self.addAttribute(NSAttributedStringKey.font, value: font, range: range)
    }
}
