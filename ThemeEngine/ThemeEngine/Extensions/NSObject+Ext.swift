//
//  NSObject+Ext.swift
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

/// An extension for `NSObject` that provides a method for setting theme-aware colors to a given key path.
///
/// This extension allows you to set a theme-aware color using a key conforming to `ThemeEngine.ColorKey`.
/// The provided color will be applied to the object based on the current theme.
///
///     let label = UILabel()
///     label.setThemeColor(.textColor, for: \UILabel.textColor)
///
public extension NSObject {
    
    private static var associatedDataKey = "associatedDataKey"
    private static var deallocHandlerKey = "deallocHandlerKey"
    private static var notificationsSetupKey = "notificationsSetupKey"
    
    /// Sets a theme-aware color for the given key path.
    ///
    /// - Parameters:
    ///   - themeColor: The color key conforming to `ThemeEngine.ColorKey`.
    ///   - keyPath: The key path of the color property to set.
    ///
    /// - Note: Method allows you to set a theme-aware color using a key conforming to `ThemeEngine.ColorKey`.
    /// The provided color will be applied to the object based on the current theme.
    /// When the theme changes, the extension listens for the `.themeDidChange` notification and updates the color accordingly.
    ///
    /// The extension also takes care of cleaning up its observers when the object is deallocated.
    func setThemeColor<Key: ThemeEngine.ColorKey, T: NSObject>(_ themeColor: Key, for keyPath: ReferenceWritableKeyPath<T, UIColor?>) {
        var data = objc_getAssociatedObject(self, &Self.associatedDataKey) as? [(keyPath: ReferenceWritableKeyPath<T, UIColor?>, themeColor: Key)] ?? []
        
        if let index = data.firstIndex(where: { $0.keyPath == keyPath }) {
            data[index] = (keyPath: keyPath, themeColor: themeColor)
        } else {
            data.append((keyPath: keyPath, themeColor: themeColor))
        }
        objc_setAssociatedObject(self, &Self.associatedDataKey, data, .OBJC_ASSOCIATION_RETAIN)
        
        if let color = ThemeEngine.shared.manager(for: Key.self).color(forKey: themeColor) {
            (self as? T)?[keyPath: keyPath] = color
        }
        
        guard (objc_getAssociatedObject(self, &Self.notificationsSetupKey) as? Bool) != true else { return }
        
        NotificationCenter.default.addObserver(forName: .themeDidChange, object: nil, queue: .main) { [weak self] notification in
            let userInfo = notification.userInfo as? [String: Any]
            let animationDuration = userInfo?[Notification.animationDurationKey] as? TimeInterval ?? 0
            
            guard let self else { return }
            guard let data = objc_getAssociatedObject(self, &Self.associatedDataKey) as? [(keyPath: ReferenceWritableKeyPath<T, UIColor?>, themeColor: Key)] else { return }
            
            if let view = self as? UIView {
                UIView.transition(with: view, duration: animationDuration, options: .transitionCrossDissolve) {
                    data.forEach {
                        let themeColor = $0.themeColor
                        let keyPath = $0.keyPath
                        
                        if let color = ThemeEngine.shared.manager(for: Key.self).color(forKey: themeColor) {
                            (self as? T)?[keyPath: keyPath] = color
                        }
                    }
                }
            } else {
                data.forEach {
                    let themeColor = $0.themeColor
                    let keyPath = $0.keyPath
                    
                    if let color = ThemeEngine.shared.manager(for: Key.self).color(forKey: themeColor) {
                        (self as? T)?[keyPath: keyPath] = color
                    }
                }
            }
        }
        
        let deallocHandler = UIViewDeallocHandler { [weak self] in
            if let self {
                NotificationCenter.default.removeObserver(self, name: .themeDidChange, object: nil)
            }
        }
        
        objc_setAssociatedObject(self, &Self.deallocHandlerKey, deallocHandler, .OBJC_ASSOCIATION_RETAIN)
        objc_setAssociatedObject(self, &Self.notificationsSetupKey, true, .OBJC_ASSOCIATION_RETAIN)
    }
}


