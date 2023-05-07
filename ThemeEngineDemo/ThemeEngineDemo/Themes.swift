//
//  Themes.swift
//  ThemeEngineDemo
//
//  Created by Narek Stepanyan.
//

import Foundation
import ThemeEngine

enum ThemeKeys: ThemeEngine.ColorKey {
    
    case accent
    case background
    case secondary
    case text
    case buttons
}

let lightTheme = ThemeEngine.Theme<ThemeKeys>(colors: [
    .accent: .systemMint,
    .background: .white,
    .secondary: UIColor(white: 0.94, alpha: 1),
    .text: .black,
    .buttons: .systemBlue
])

let darkTheme = ThemeEngine.Theme<ThemeKeys>(colors: [
    .accent: .clear,
    .background: .black,
    .secondary: UIColor(white: 0.15, alpha: 1),
    .text: .white,
    .buttons: UIColor(red: 0.96, green: 0.73, blue: 0.17, alpha: 1.00)
])

let pinkTheme = ThemeEngine.Theme<ThemeKeys>(colors: [
    .accent: UIColor(red: 0.73, green: 0.21, blue: 0.68, alpha: 1.00),
    .background: UIColor(red: 0.93, green: 0.91, blue: 0.97, alpha: 1.00),
    .secondary: UIColor(red: 0.91, green: 0.62, blue: 0.96, alpha: 1.00),
    .text: .black,
    .buttons: .black
])

