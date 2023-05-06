//
//  ThemeManager.swift
//  ThemeEngine
//
//  Created by Narek Stepanyan on 05.05.2023.
//

import UIKit


public class ThemeManager<Key: ThemeColorKey> {

    public private(set) var currentTheme: Theme<Key>?
    
    public func color(forKey key: Key) -> UIColor? {
        return currentTheme?.colors[key]
    }

    public func applyTheme(_ theme: Theme<Key>, animationDuration: TimeInterval = 0) {
        currentTheme = theme
        
        NotificationCenter.default.post(
            name: .themeDidChange,
            object: nil,
            userInfo: [
                Notification.animationDurationKey: animationDuration
            ]
        )
    }
}
