//
//  Theme.swift
//  ThemeEngine
//
//  Created by Narek Stepanyan on 05.05.2023.
//

import UIKit


public struct Theme<Key: ThemeColorKey> {

    public var colors: [Key : UIColor]

    public init(colors: [Key: UIColor]) {
        self.colors = colors
    }
    
    public func color(forKey key: Key) -> UIColor? {
        return colors[key]
    }
}

