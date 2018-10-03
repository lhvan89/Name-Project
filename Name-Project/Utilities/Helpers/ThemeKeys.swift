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
    
    //PageControl
    struct PageControl: ThemeKeyProtocol {
        static private(set) var key: String = "pageControl"
        
        /// Green400
        struct CurrentPageIndicatorTintColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey:
                PageControl.key, secondKey: "currentPageIndicatorTintColor")
        }
        
        /// Green400
        struct PageIndicatorTintColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: PageControl.key, secondKey: "pageIndicatorTintColor")
        }
        
    }
    
    // TabbarButton
    struct TabbarButton: ThemeKeyProtocol {
        static private(set) var key: String = "tabbarButton"
        
        struct TintColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: TabbarButton.key, secondKey: "tintColor")
        }
    }
    
    // Global
    struct Global: ThemeKeyProtocol {
        static private(set) var key: String = "global"
        
        struct LightFont: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Global.key, secondKey: "lightFont")
        }
        
        struct RegularFont: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Global.key, secondKey: "regularFont")
        }
        
        struct BoldFont: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Global.key, secondKey: "boldFont")
        }
        
        struct BlackFont: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Global.key, secondKey: "blackFont")
        }
    }
    
    // TextField
    struct TextField: ThemeKeyProtocol {
        static private(set) var key: String = "textField"
        
        /// darkTwo
        struct backgroundColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: TextField.key, secondKey: "backgroundColor")
        }
        
        /// white
        struct textColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: TextField.key, secondKey: "textColor")
        }
        /// red
        struct textColor2: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: TextField.key, secondKey: "textColor2")
        }
        
    }
    
    // Label
    struct Label: ThemeKeyProtocol {
        static private(set) var key: String = "label"
        
        /// white
        struct textColor1: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Label.key, secondKey: "textColor1")
        }
        
        /// silver
        struct textColor2: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Label.key, secondKey: "textColor2")
        }
        
        /// steel
        struct textColor3: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Label.key, secondKey: "textColor3")
        }
        
        /// black
        struct textColor4: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Label.key, secondKey: "textColor4")
        }
        
        /// red
        struct textColor5: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Label.key, secondKey: "textColor5")
        }
        
        /// ceruleanBlue
        struct textColor6: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Label.key, secondKey: "textColor6")
        }
    }
    
    // Button
    struct Button: ThemeKeyProtocol {
        static private(set) var key: String = "button"
        
        /// ceruleanBlue
        struct textColor1: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Button.key, secondKey: "textColor1")
        }
        
        /// White
        struct textColor2: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Button.key, secondKey: "textColor2")
        }
        
        /// Black
        struct textColor3: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Button.key, secondKey: "textColor3")
        }
        
        /// blue
        struct backgroundColor1: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Button.key, secondKey: "backgroundColor1")
        }
        
        /// gray
        struct backgroundColor2: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Button.key, secondKey: "backgroundColor2")
        }
        
        /// white
        struct backgroundColor3: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Button.key, secondKey: "backgroundColor3")
        }
        
        /// green
        struct backgroundColor4: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Button.key, secondKey: "backgroundColor4")
        }
        
        /// paleRed
        struct backgroundColor5: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Button.key, secondKey: "backgroundColor5")
        }
        
        /// ceruleanBlue
        struct backgroundColor6: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Button.key, secondKey: "backgroundColor6")
        }
        
        /// white
        struct borderColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: Button.key, secondKey: "borderColor")
        }
    }
    
    // SBSlider
    struct SBSlider: ThemeKeyProtocol {
        static private(set) var key: String = "SBSlider"
        
        /// White
        struct trackColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: SBSlider.key, secondKey: "trackColor")
        }
        
        /// Blue
        struct thumbColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: SBSlider.key, secondKey: "thumbColor")
        }
    }
    
    // SegmentControl
    struct SegmentControl: ThemeKeyProtocol {
        static private(set) var key: String = "SegmentControl"
        
        /// Blue
        struct tintColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: SegmentControl.key, secondKey: "tintColor")
        }
    }
    
    // ProgressView
    struct ProgressView: ThemeKeyProtocol {
        static private(set) var key: String = "view"
        
        /// Black
        struct trackColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: View.key, secondKey: "trackColor")
        }
        
        /// Black
        struct progressColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: View.key, secondKey: "progressColor")
        }
    }
    
    // View
    struct View: ThemeKeyProtocol {
        static private(set) var key: String = "view"
        
        /// Black
        struct backgroundColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: View.key, secondKey: "backgroundColor")
        }
        
        /// White
        struct backgroundColor1: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: View.key, secondKey: "backgroundColor1")
        }
        
        /// Blue
        struct backgroundColor2: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: View.key, secondKey: "backgroundColor2")
        }
        
        /// paleGreyTwo
        struct backgroundColor3: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: View.key, secondKey: "backgroundColor3")
        }
        
        /// silver
        struct backgroundColor4: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: View.key, secondKey: "backgroundColor4")
        }
        
        /// custom gray
        struct backgroundColor5: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: View.key, secondKey: "backgroundColor5")
        }
        
        /// light gray 2
        struct backgroundColor6: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: View.key, secondKey: "backgroundColor6")
        }
    }
    
    // ImageView
    struct ImageView: ThemeKeyProtocol {
        static private(set) var key: String = "imageView"
        
        /// Black
        struct borderColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: ImageView.key, secondKey: "borderColor")
        }
    }
    
    // ToolBar
    struct ToolBar: ThemeKeyProtocol {
        static private(set) var key: String = "toolBar"
        
        /// Orange400
        struct BarTintColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: ToolBar.key, secondKey: "barTintColor")
        }
        
        /// White
        struct TintColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: ToolBar.key, secondKey: "tintColor")
        }
    }
    
    // ToolBar
    struct TagListView: ThemeKeyProtocol {
        static private(set) var key: String = "tagListView"
        
        /// Steel
        struct TextColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: TagListView.key, secondKey: "textColor")
        }
        
        /// White
        struct TagBackgroundColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: TagListView.key, secondKey: "tagBackgroundColor")
        }
        
        /// PaleGrey3
        struct BorderColor: ThemeKeyProtocol {
            static private(set) var key: String = ThemeKeys.mergeKeys(firstKey: TagListView.key, secondKey: "borderColor")
        }
    }
}


