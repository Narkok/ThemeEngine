//
//  Theme.swift
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

public extension ThemeEngine {
    
    /// A type that represents a key for color values in a theme.
    typealias ColorKey = Hashable
    
    /// A structure that represents a theme with color values associated with keys.
    ///
    /// The `Theme` structure stores a dictionary of color values associated with keys of type `Key`, which must conform to the `ColorKey` type.
    /// Use the `color(forKey:)` method to retrieve the color value for a given key.
    ///
    ///     let themeColors: [MyColorKey: UIColor] = [.background: .white, .text: .black]
    ///     let theme = Theme<MyColorKey>(colors: themeColors)
    ///     let backgroundColor = theme.color(forKey: .background)
    ///
    /// - Note: `Key` must conform to the `ThemeEngine.ColorKey` protocol, which is a typealias for `Hashable`.
    struct Theme<Key: ColorKey> {
        
        // MARK: - Private Properties
        
        /// A dictionary containing color values associated with keys of type `Key`.
        private var colors: [Key : UIColor]
        
        // MARK: - Initialization
        
        /// Initializes a new theme with the provided color values.
        ///
        /// - Parameter colors: A dictionary containing color values associated with keys of type `Key`.
        public init(colors: [Key: UIColor]) {
            self.colors = colors
        }
        
        // MARK: - Public Methods
        
        /// Retrieves the color value associated with the provided key.
        ///
        /// - Parameter key: The key for which to retrieve the color value.
        /// - Returns: The color value associated with the key, or `nil` if no value is found for the key.
        public func color(forKey key: Key) -> UIColor? {
            return colors[key]
        }
    }
}
