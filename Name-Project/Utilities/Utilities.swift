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
}
