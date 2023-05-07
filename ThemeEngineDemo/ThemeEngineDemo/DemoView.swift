//
//  DemoView.swift
//  ThemeEngineDemo
//
//  Created by Narek Stepanyan.
//

import SnapKit

final class DemoView: UIView {
    
    // MARK: - Public Properties
    
    var onLightButtonTap: (() -> ())?
    var onDarkButtonTap: (() -> ())?
    var onPinkButtonTap: (() -> ())?
    
    // MARK: - Private Properties
    
    private let themesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let lightThemeButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("Light", for: .normal)
        button.configuration?.subtitle = "No animation"
        button.configuration?.titleAlignment = .center
        button.configuration?.cornerStyle = .small
        button.setThemeColor(ColorKey.buttons, for: \UIButton.tintColor)
        return button
    }()
    
    private let darkThemeButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("Dark", for: .normal)
        button.configuration?.subtitle = "Fast animation"
        button.configuration?.titleAlignment = .center
        button.configuration?.cornerStyle = .small
        button.setThemeColor(ColorKey.buttons, for: \UIButton.tintColor)
        return button
    }()
    
    private let pinkThemeButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("Pink", for: .normal)
        button.configuration?.subtitle = "Slow animation"
        button.configuration?.titleAlignment = .center
        button.configuration?.cornerStyle = .small
        button.setThemeColor(ColorKey.buttons, for: \UIButton.tintColor)
        return button
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(image: .init(named: "avatar"))
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.setThemeColor(ColorKey.accent, for: \UIView.backgroundColor)
        return imageView
    }()
    
    private let topHeaderView: UIView = {
        let view = UIView()
        view.setThemeColor(ColorKey.secondary, for: \UIView.backgroundColor)
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Narek Stepanyan"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.setThemeColor(ColorKey.text, for: \UILabel.textColor)
        return label
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "Narkok"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.setThemeColor(ColorKey.text, for: \UILabel.textColor)
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        bind()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        bind()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func bind() {
        lightThemeButton.addAction(.init(handler: { [weak self] _ in
            self?.onLightButtonTap?()
        }), for: .touchUpInside)
        
        darkThemeButton.addAction(.init(handler: { [weak self] _ in
            self?.onDarkButtonTap?()
        }), for: .touchUpInside)
        
        pinkThemeButton.addAction(.init(handler: { [weak self] _ in
            self?.onPinkButtonTap?()
        }), for: .touchUpInside)
    }
    
    private func setupUI() {
        addSubview(topHeaderView)
        topHeaderView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.top).inset(40)
        }
        
        addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.leading.equalToSuperview().inset(8)
            $0.centerY.equalTo(topHeaderView.snp.bottom)
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.bottom.equalTo(topHeaderView).inset(8)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(12)
        }
        
        addSubview(nicknameLabel)
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(topHeaderView.snp.bottom).offset(8)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(12)
        }
        
        let repositoriesView = Self.createView(title: "Repositories", value: "22", image: UIImage(systemName: "books.vertical"))
        addSubview(repositoriesView)
        repositoriesView.snp.makeConstraints {
            $0.top.equalTo(avatarImageView.snp.bottom).offset(42)
            $0.left.right.equalToSuperview().inset(8)
            $0.height.equalTo(80)
        }
        
        let starredView = Self.createView(title: "Starred", value: "11", image: UIImage(systemName: "star"))
        addSubview(starredView)
        starredView.snp.makeConstraints {
            $0.top.equalTo(repositoriesView.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(8)
            $0.height.equalTo(80)
        }
        
        let organizationsView = Self.createView(title: "Organizations", value: "1", image: UIImage(systemName: "building.2"))
        addSubview(organizationsView)
        organizationsView.snp.makeConstraints {
            $0.top.equalTo(starredView.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(8)
            $0.height.equalTo(80)
        }
        
        addSubview(themesStackView)
        themesStackView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalTo(safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(64)
        }
        
        themesStackView.addArrangedSubview(lightThemeButton)
        themesStackView.addArrangedSubview(darkThemeButton)
        themesStackView.addArrangedSubview(pinkThemeButton)
        
        setThemeColor(ColorKey.background, for: \UIView.backgroundColor)
    }
    
    static private func createView(title: String, value: String, image: UIImage?) -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.cornerCurve = .continuous
        view.setThemeColor(ColorKey.secondary, for: \UIView.backgroundColor)
        
        let iconView = UIImageView(image: image)
        iconView.setThemeColor(ColorKey.text, for: \UIImageView.tintColor)
        
        view.addSubview(iconView)
        iconView.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.top.leading.equalToSuperview().inset(16)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        titleLabel.setThemeColor(ColorKey.text, for: \UILabel.textColor)
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(iconView)
            $0.leading.equalToSuperview().inset(50)
        }
        
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        valueLabel.setThemeColor(ColorKey.text, for: \UILabel.textColor)
        
        view.addSubview(valueLabel)
        valueLabel.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(16)
        }
        
        return view
    }
}
