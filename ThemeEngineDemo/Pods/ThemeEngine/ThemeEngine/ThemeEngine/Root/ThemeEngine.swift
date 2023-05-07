//
//  ThemeEngine.swift
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

/// A class that manages and applies themes for an application, providing access to multiple theme managers.
///
/// The `ThemeEngine` class is a singleton that stores references to multiple `ThemeManager<Key>` instances, one for each unique key type.
/// Use the `apply(theme:animationDuration:)` method to apply a theme for a specific key type.
///
///     let themeEngine = ThemeEngine.shared
///     themeEngine.apply(theme: myTheme)
///
public class ThemeEngine {
    
    // MARK: - Shared Properties
    
    /// The shared singleton instance of the `ThemeEngine`.
    public static let shared = ThemeEngine()
    
    // MARK: - Private Properties
    
    /// A dictionary that stores `ThemeManager<Key>` instances for each unique key type, keyed by the type name as a string.
    private var themeManagers: [String: Any] = [:]
    
    // MARK: - Initialization
    
    /// A private initializer to ensure the singleton pattern is used.
    private init() {}
    
    // MARK: - Internal Methods
    
    /// Retrieves the `ThemeManager<Key>` instance associated with the provided key type, or creates a new one if none exists.
    ///
    /// - Parameter type: The type of the key conforming to `ColorKey`. Defaults to `Key.self`.
    /// - Returns: The existing or newly created `ThemeManager<Key>` instance associated with the provided key type.
    internal func manager<Key: ColorKey>(for type: Key.Type = Key.self) -> ThemeManager<Key> {
        let typeName = String(reflecting: type)
        
        if let manager = themeManagers[typeName] as? ThemeManager<Key> {
            return manager
        } else {
            let newManager = ThemeManager<Key>()
            themeManagers[typeName] = newManager
            return newManager
        }
    }
    
    // MARK: - Public Methods
    
    /// Applies the provided theme for a specific key type, optionally with an animation duration.
    ///
    /// This method retrieves or creates a `ThemeManager<Key>` instance associated with the provided key type and applies the provided theme.
    ///
    /// - Parameters:
    ///   - theme: The theme to apply for the key type.
    ///   - animationDuration: The duration of the animation when applying the theme, in seconds. Default value is 0.
    public func apply<Key: ColorKey>(theme: Theme<Key>, animationDuration: TimeInterval = 0) {
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
