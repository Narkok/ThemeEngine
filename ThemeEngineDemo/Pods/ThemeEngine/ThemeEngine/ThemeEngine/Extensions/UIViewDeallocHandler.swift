//
//  UIViewDeallocHandler.swift
//  ThemeEngine
//
//  Created by Narek Stepanyan on 06.05.2023.
//

import Foundation

internal class UIViewDeallocHandler {
    
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    deinit {
        closure()
    }
}
