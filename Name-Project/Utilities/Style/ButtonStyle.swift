//
//  ButtonStyle.swift
//  Name-Project
//
//  Created by Van Le on 10/3/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

struct ButtonStyle {
    
    var fontStyle: FontStyle
    var backgroundColorKey: String?
    var backgroundColorAlpha: CGFloat?
    var borderColorKey: String?
    var titleColorKey: String
    var titleColorAlpha: CGFloat
}

extension ButtonStyle {
    
    //    static var flatPrimary: ButtonStyle {
    //        return ButtonStyle(fontStyle: FontStyle.buttonStyle, backgroundColorKey: ThemeKeys.Button.BackgroundColor.key, backgroundColorAlpha: AlphaColor.full, borderColorKey: nil, titleColorKey: ThemeKeys.Button.TitleColor1.key, titleColorAlpha: AlphaColor.full)
    //    }
    //
    //    static var flatSecondary: ButtonStyle {
    //        return ButtonStyle(fontStyle: FontStyle.buttonStyle, backgroundColorKey: ThemeKeys.Button.BackgroundColor4.key, backgroundColorAlpha: AlphaColor.full, borderColorKey: nil, titleColorKey: ThemeKeys.Button.TitleColor1.key, titleColorAlpha: AlphaColor.full)
    //    }
    //
    //    static var flatDisable: ButtonStyle {
    //        return ButtonStyle(fontStyle: FontStyle.buttonStyle, backgroundColorKey: ThemeKeys.Button.BackgroundColor3.key, backgroundColorAlpha: AlphaColor.disable, borderColorKey: nil, titleColorKey: ThemeKeys.Button.TitleColor.key, titleColorAlpha: AlphaColor.inactive)
    //    }
    //
    //    static var ghostPrimary: ButtonStyle {
    //        return ButtonStyle(fontStyle: FontStyle.buttonStyle, backgroundColorKey: ThemeKeys.Button.BackgroundColor1.key, backgroundColorAlpha: AlphaColor.full, borderColorKey: ThemeKeys.Button.BorderColor1.key, titleColorKey: ThemeKeys.Button.TitleColor3.key, titleColorAlpha: AlphaColor.full)
    //    }
    //
    //    static var ghostSecondary: ButtonStyle {
    //        return ButtonStyle(fontStyle: FontStyle.buttonStyle, backgroundColorKey: ThemeKeys.Button.BackgroundColor1.key, backgroundColorAlpha: AlphaColor.full, borderColorKey: ThemeKeys.Button.BorderColor2.key, titleColorKey: ThemeKeys.Button.TitleColor4.key, titleColorAlpha: AlphaColor.full)
    //    }
    //
    //    static var textPrimary: ButtonStyle {
    //        return ButtonStyle(fontStyle: FontStyle.buttonStyle, backgroundColorKey: nil, backgroundColorAlpha: nil, borderColorKey: nil, titleColorKey: ThemeKeys.Button.TitleColor3.key, titleColorAlpha: AlphaColor.full)
    //    }
    //
    //    static var textSecondary: ButtonStyle {
    //        return ButtonStyle(fontStyle: FontStyle.buttonStyle, backgroundColorKey: nil, backgroundColorAlpha: nil, borderColorKey: nil, titleColorKey: ThemeKeys.Button.TitleColor2.key, titleColorAlpha: AlphaColor.full)
    //    }
}
