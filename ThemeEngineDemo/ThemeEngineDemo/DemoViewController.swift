//
//  ViewController.swift
//  ThemeEngineDemo
//
//  Created by Narek Stepanyan on 06.05.2023.
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
        let settingsItem = UIBarButtonItem(customView: UIImageView(image: UIImage(systemName: "gearshape.fill")))
        settingsItem.customView?.setThemeColor(ThemeKeys.text, for: \UIImageView.tintColor)
        navigationItem.setRightBarButton(settingsItem, animated: false)
    }
    
    private func bind() {
        rootView.onLightButtonTap = {
            ThemeEngine.apply(theme: Themes.light)
        }
        
        rootView.onDarkButtonTap = {
            ThemeEngine.apply(theme: Themes.dark, animationDuration: 0.2)
        }
        
        rootView.onPinkButtonTap = {
            ThemeEngine.apply(theme: Themes.pink, animationDuration: 0.6)
        }
    }
}
