//
//  ViewController.swift
//  ThemeEngineDemo
//
//  Created by Narek Stepanyan.
//

import UIKit
import ThemeEngine

class DemoViewController: UIViewController {
    
    private let rootView = DemoView()
    
    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        bind()
    }
    
    private func setupNavBar() {
        let settingsItem = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: nil, action: nil)
        settingsItem.setThemeColor(ColorKey.text, for: \UIBarButtonItem.tintColor)
        navigationItem.setRightBarButton(settingsItem, animated: false)
    }
    
    private func bind() {
        rootView.onLightButtonTap = {
            ThemeEngine.shared.apply(theme: lightTheme)
        }
        
        rootView.onDarkButtonTap = {
            ThemeEngine.shared.apply(theme: darkTheme, animationDuration: 0.2)
        }
        
        rootView.onPinkButtonTap = {
            ThemeEngine.shared.apply(theme: pinkTheme, animationDuration: 0.6)
        }
    }
}
