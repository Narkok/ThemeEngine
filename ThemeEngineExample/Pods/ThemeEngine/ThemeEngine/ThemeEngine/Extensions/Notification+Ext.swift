//
//  Notification+Ext.swift
//  ThemeEngine
//
//  Created by Narek Stepanyan on 06.05.2023.
//

import Foundation

internal extension Notification {
    
    static var animationDurationKey = "animationDuration"
}

internal extension Notification.Name {
    
    static let themeDidChange = Notification.Name("themeDidChange")
}
