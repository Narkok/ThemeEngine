//
//  ViewController.swift
//  ThemeEngineExample
//
//  Created by Narek Stepanyan on 06.05.2023.
//

import UIKit
import ThemeEngine

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        self.view.addSubview(view)
        
        ThemeEngine.apply(theme: Themes.lightTheme)
        
        view.frame = .init(origin: .init(x: 100, y: 100), size: .init(width: 100, height: 100))

        view.setThemeColor(ThemeKeys.background, for: \.backgroundColor)
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            ThemeEngine.apply(theme: Themes.darkTheme, animationDuration: 0.2)
        }
    }


}


enum ThemeKeys: ThemeColorKey {
    
    case background
    case text
    case accent
}

class Themes {
    
    static let lightTheme = Theme<ThemeKeys>(colors: [
        .accent: .red,
        .background: .green,
        .text: .blue
    ])
    
    static let darkTheme = Theme<ThemeKeys>(colors: [
        .accent: .green,
        .background: .blue,
        .text: .red
    ])
}
