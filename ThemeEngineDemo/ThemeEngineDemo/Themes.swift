//
//  Themes.swift
//  ThemeEngineDemo
//
//  Created by Narek Stepanyan on 06.05.2023.
//

import Foundation
import ThemeEngine

enum ThemeKeys: ThemeColorKey {
    
    case accent
    case background
    case secondary
    case text
    case buttons
}

enum Themes {
    
    static let light = Theme<ThemeKeys>(colors: [
        .accent: .systemMint,
        .background: .white,
        .secondary: UIColor(white: 0.94, alpha: 1),
        .text: .black,
        .buttons: .systemBlue
    ])
    
    static let dark = Theme<ThemeKeys>(colors: [
        .accent: .clear,
        .background: .black,
        .secondary: UIColor(white: 0.15, alpha: 1),
        .text: .white,
        .buttons: UIColor(red: 0.96, green: 0.73, blue: 0.17, alpha: 1.00)
    ])
    
    static let pink = Theme<ThemeKeys>(colors: [
        .accent: UIColor(red: 0.73, green: 0.21, blue: 0.68, alpha: 1.00),
        .background: UIColor(red: 0.93, green: 0.91, blue: 0.97, alpha: 1.00),
        .secondary: UIColor(red: 0.91, green: 0.62, blue: 0.96, alpha: 1.00),
        .text: .black,
        .buttons: .black
    ])
}
