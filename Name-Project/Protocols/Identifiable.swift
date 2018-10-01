//
//  Identifiable.swift
//  Name-Project
//
//  Created by Van Le on 10/1/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

protocol Identifiable {
    static var identify: String { get }
}

extension Identifiable {
    static var identify: String {
        return "\(self)"
    }
}

extension UITableViewCell: Identifiable { }

extension UICollectionViewCell: Identifiable { }
