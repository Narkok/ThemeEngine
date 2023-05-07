//
//  Themes.swift
//  ThemeEngineDemo
//
//  Created by Narek Stepanyan.
//

import Foundation
import ThemeEngine

enum ColorKey: ThemeEngine.ColorKey {
    
    case accent
    case background
    case secondary
    case text
    case buttons
}

let lightTheme = ThemeEngine.Theme<ColorKey>(colors: [
    .accent: .systemMint,
    .background: .white,
    .secondary: .lightGray,
    .text: .black,
    .buttons: .systemBlue
])

let darkTheme = ThemeEngine.Theme<ColorKey>(colors: [
    .accent: .clear,
    .background: .black,
    .secondary: .darkGray,
    .text: .white,
    .buttons: .systemYellow
])

let pinkTheme = ThemeEngine.Theme<ColorKey>(colors: [
    .accent: UIColor(red: 0.73, green: 0.21, blue: 0.68, alpha: 1.00),
    .background: UIColor(red: 0.93, green: 0.91, blue: 0.97, alpha: 1.00),
    .secondary: UIColor(red: 0.91, green: 0.62, blue: 0.96, alpha: 1.00),
    .text: .black,
    .buttons: .black
])

