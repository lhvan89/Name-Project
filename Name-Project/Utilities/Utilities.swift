//
//  Utilities.swift
//  Name-Project
//
//  Created by Van Le on 9/28/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit
import SwiftyBeaver

let log = SwiftyBeaver.self

class Utilities: NSObject {
    
    class func configSwiftyLog() {
        let console = ConsoleDestination()  // log to Xcode Console
        let file = FileDestination()  // log to default swiftybeaver.log file
        console.format = "$DHH:mm:ss$d $l-$N-$F $C$L: $M '$X'"
        
        log.addDestination(console)
        log.addDestination(file)
    }
    
    // MARK: Image with color
    class func imageWithColor(_ color: UIColor) -> UIImage? {
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
