//
//  ThemeApplicable.swift
//  ThemeEngine
//
//  Created by Narek Stepanyan on 06.05.2023.
//

import UIKit

public protocol ThemeApplicable: AnyObject {
    
    func setThemeColor(_ themeColor: any ThemeColorKey, for keyPath: ReferenceWritableKeyPath<Self, UIColor?>)
    func applyThemeColor<Key: ThemeColorKey>(_ themeColor: Key, for keyPath: ReferenceWritableKeyPath<Self, UIColor?>)
}

public extension ThemeApplicable {
    
    private static var associatedDataKey: String { "associatedDataKey" }
    
    typealias KeyPath = ReferenceWritableKeyPath<Self, UIColor?>
    private typealias Data = [(keyPath: KeyPath, themeColor: any ThemeColorKey)]
    
    func setThemeColor(_ themeColor: any ThemeColorKey, for keyPath: KeyPath) {
        var associatedDataKey = Self.associatedDataKey
        var data: Data = objc_getAssociatedObject(self, &associatedDataKey) as? Data ?? []
        
        if let index = data.firstIndex(where: { $0.keyPath == keyPath }) {
            data[index] = (keyPath: keyPath, themeColor: themeColor)
        } else {
            data.append((keyPath: keyPath, themeColor: themeColor))
        }
        objc_setAssociatedObject(self, &associatedDataKey, data, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        applyThemeColor(themeColor, for: keyPath)
        observeThemeChange()
    }
    
    private func observeThemeChange() {
        NotificationCenter.default.addObserver(forName: .themeDidChange,  object: nil, queue: .main) { [weak self] notification in
            self?.themeDidChange(notification: notification)
        }
    }
    
//    private func applyThemeColor<Key: ThemeColorKey>(_ themeColor: Key, for keyPath: ReferenceWritableKeyPath<Self, UIColor?>) {
//        if let color = ThemeEngine.manager(for: Key.self).color(forKey: themeColor) {
//            self[keyPath: keyPath] = color
//        }
//    }
    
//    @objc
    private func themeDidChange(notification: Notification) {
        let userInfo = notification.userInfo as? [String: Any]
        let animationDuration = userInfo?[Notification.animationDurationKey] as? TimeInterval ?? 0
        var associatedDataKey = Self.associatedDataKey
        
        guard let data = objc_getAssociatedObject(self, &associatedDataKey) as? Data else { return }
        
        UIView.transition(with: self as! UIView, duration: animationDuration, options: .transitionCrossDissolve, animations: {
            data.forEach {
                let themeColor = $0.themeColor
                let keyPath = $0.keyPath
                
                self.applyThemeColor(themeColor, for: keyPath)
            }
        })
    }
}
