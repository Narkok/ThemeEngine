//
//  ThemeManager.swift
//  ThemeEngine
//
//  Created by Narek Stepanyan.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2023 Narek Stepanyan.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

internal extension ThemeEngine {
    
    /// A class that manages themes for an application, providing access to the current theme and allowing theme changes.
    ///
    /// The `ThemeManager` class stores a reference to the current theme of type `Theme<Key>`, where `Key` must conform to the `ColorKey` protocol.
    /// Use the `color(forKey:)` method to retrieve the color value for a given key from the current theme.
    /// Use the `applyTheme(_:animationDuration:)` method to change the current theme.
    ///
    ///     let themeManager = ThemeManager<MyColorKey>()
    ///     themeManager.applyTheme(myTheme)
    ///     let backgroundColor = themeManager.color(forKey: .background)
    ///
    /// - Note: `Key` must conform to the `ColorKey` protocol, which is a typealias for `Hashable`.
    class ThemeManager<Key: ColorKey> {
        
        // MARK: - Public Properties
        
        /// The current theme of type `Theme<Key>`.
        private(set) var currentTheme: Theme<Key>?
        
        // MARK: - Public Methods
        
        /// Retrieves the color value associated with the provided key from the current theme.
        ///
        /// - Parameter key: The key for which to retrieve the color value.
        /// - Returns: The color value associated with the key, or `nil` if no value is found for the key or if there is no current theme.
        func color(forKey key: Key) -> UIColor? {
            return currentTheme?.color(forKey: key)
        }
        
        /// Applies the provided theme as the current theme, optionally with an animation duration.
        ///
        /// This method sets the provided theme as the current theme and posts a `.themeDidChange` notification with the specified animation duration.
        ///
        /// - Parameters:
        ///   - theme: The new theme to apply.
        ///   - animationDuration: The duration of the animation when applying the theme, in seconds. Default value is 0.
        func applyTheme(_ theme: Theme<Key>, animationDuration: TimeInterval = 0) {
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
}
