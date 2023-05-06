//
//  PublicClass.swift
//  ThemeEngine
//
//  Created by Narek Stepanyan on 05.05.2023.
//

import UIKit


public struct ThemeEngine {
    
    private static var themeManagers: [String: Any] = [:]

    internal static func manager<Key: ThemeColorKey>(for type: Key.Type = Key.self) -> ThemeManager<Key> {
        let typeName = String(reflecting: type)
        
        if let manager = themeManagers[typeName] as? ThemeManager<Key> {
            return manager
        } else {
            let newManager = ThemeManager<Key>()
            themeManagers[typeName] = newManager
            return newManager
        }
    }
    
    public static func apply<Key: ThemeColorKey>(theme: Theme<Key>, animationDuration: TimeInterval = 0) {
        let typeName = String(reflecting: Key.self)
        
        let manager: ThemeManager = {
            if let manager = themeManagers[typeName] as? ThemeManager<Key> {
                return manager
            } else {
                let newManager = ThemeManager<Key>()
                themeManagers[typeName] = newManager
                return newManager
            }
        }()
        manager.applyTheme(theme, animationDuration: animationDuration)
    }
}
