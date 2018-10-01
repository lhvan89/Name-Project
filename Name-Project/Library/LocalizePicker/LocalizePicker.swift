//
//  LocalizePicker.swift
//  Name-Project
//
//  Created by Van Le on 10/1/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import Foundation

@objc public class LocalizePicker: NSObject, NSCopying {
    
    public typealias ValueType = () -> Any?
    
    public var value: ValueType
    
    required public init(v: @escaping ValueType) {
        value = v
    }
    
    public func copy(with zone: NSZone?) -> Any {
        return type(of: self).init(v: value)
    }
}
