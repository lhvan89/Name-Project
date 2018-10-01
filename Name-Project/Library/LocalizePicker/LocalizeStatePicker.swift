//
//  LocalizeStatePicker.swift
//  Name-Project
//
//  Created by Van Le on 10/1/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

final class LocalizeStatePicker: LocalizePicker {
    
    typealias ValuesType = [UInt: LocalizePicker]
    
    var values = ValuesType()
    
    convenience init?(picker: LocalizePicker?, withState state: UIControlState) {
        guard let picker = picker else { return nil }
        
        self.init(v: { "" })
        values[state.rawValue] = picker
    }
    
    func setPicker(_ picker: LocalizePicker?, forState state: UIControlState) -> Self {
        values[state.rawValue] = picker
        return self
    }
    
}
