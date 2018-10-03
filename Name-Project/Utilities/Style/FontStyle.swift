//
//  FontStyle.swift
//  Name-Project
//
//  Created by Van Le on 10/3/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

struct FontStyle {
    var fontKey: String
    var size: CGFloat
}

extension FontStyle {
    
    /// Light & size = 36
    static var extraLargeStyle: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.LightFont.key, size: 36)
    }
    
    /// Bold & size = 36
    static var extraLargeStyle1: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.BoldFont.key, size: 36)
    }
    
    /// Regular & size = 36
    static var extraLargeStyle2: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.RegularFont.key, size: 36)
    }
    
    /// Black & size = 36
    static var extraLargeStyle3: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.BlackFont.key, size: 36)
    }
    
    /// Light & size = 18
    static var largeStyle: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.LightFont.key, size: 18)
    }
    
    /// Bold & size = 18
    static var largeStyle1: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.BoldFont.key, size: 18)
    }
    
    /// Regular & size = 18
    static var largeStyle2: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.RegularFont.key, size: 18)
    }
    
    /// Black & size = 18
    static var largeStyle3: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.BlackFont.key, size: 18)
    }
    
    /// Light & size = 26
    static var large1Style: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.LightFont.key, size: 26)
    }
    
    /// Bold & size = 26
    static var large1Style1: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.BoldFont.key, size: 26)
    }
    
    /// Regular & size = 26
    static var large1Style2: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.RegularFont.key, size: 26)
    }
    
    /// Black & size = 26
    static var large1Style3: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.BlackFont.key, size: 26)
    }
    
    /// Light & size = 15
    static var mediumStyle: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.LightFont.key, size: 15)
    }
    
    /// Bold & size = 15
    static var mediumStyle1: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.BoldFont.key, size: 15)
    }
    
    /// Regular & size = 15
    static var mediumStyle2: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.RegularFont.key, size: 15)
    }
    
    /// Black & size = 15
    static var mediumStyle3: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.BlackFont.key, size: 15)
    }
    
    /// Light & size = 12
    static var smallStyle: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.LightFont.key, size: 12)
    }
    
    /// Bold & size = 12
    static var smallStyle1: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.BoldFont.key, size: 12)
    }
    
    /// Regular & size = 12
    static var smallStyle2: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.RegularFont.key, size: 12)
    }
    
    /// Black & size = 12
    static var smallStyle3: FontStyle {
        return FontStyle(fontKey: ThemeKeys.Global.BlackFont.key, size: 12)
    }
}
