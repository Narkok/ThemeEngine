//
//  UIView+Ext.swift
//  ThemeEngine
//
//  Created by Narek Stepanyan on 06.05.2023.
//

import UIKit

public extension UIView {
    
    private static var associatedDataKey = "associatedDataKey"
    private static var deallocHandlerKey = "deallocHandlerKey"
    private static var notificationsSetupKey = "notificationsSetupKey"
    
    func setThemeColor<Key: ThemeColorKey, T: UIView>(_ themeColor: Key, for keyPath: ReferenceWritableKeyPath<T, UIColor?>) {
        var data = objc_getAssociatedObject(self, &Self.associatedDataKey) as? [(keyPath: ReferenceWritableKeyPath<T, UIColor?>, themeColor: Key)] ?? []
        
        if let index = data.firstIndex(where: { $0.keyPath == keyPath }) {
            data[index] = (keyPath: keyPath, themeColor: themeColor)
        } else {
            data.append((keyPath: keyPath, themeColor: themeColor))
        }
        objc_setAssociatedObject(self, &Self.associatedDataKey, data, .OBJC_ASSOCIATION_RETAIN)
        
        if let color = ThemeEngine.manager(for: Key.self).color(forKey: themeColor) {
            (self as? T)?[keyPath: keyPath] = color
        }
        
        guard (objc_getAssociatedObject(self, &Self.notificationsSetupKey) as? Bool) != true else { return }
        
        NotificationCenter.default.addObserver(forName: .themeDidChange, object: nil, queue: .main) { [weak self] notification in
            let userInfo = notification.userInfo as? [String: Any]
            let animationDuration = userInfo?[Notification.animationDurationKey] as? TimeInterval ?? 0
            
            guard let self else { return }
            guard let data = objc_getAssociatedObject(self, &Self.associatedDataKey) as? [(keyPath: ReferenceWritableKeyPath<T, UIColor?>, themeColor: Key)] else { return }
            
            UIView.transition(with: self, duration: animationDuration, options: .transitionCrossDissolve) {
                data.forEach {
                    let themeColor = $0.themeColor
                    let keyPath = $0.keyPath
                    
                    if let color = ThemeEngine.manager(for: Key.self).color(forKey: themeColor) {
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


