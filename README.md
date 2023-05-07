
<img src="https://raw.githubusercontent.com/Narkok/ThemeEngine/main/Assets/icon.png" alt="ThemeEngine" title="ThemeEngine" height="200"/>

# ThemeEngine

ThemeEngine is a lightweight, easy-to-use SDK for applying custom themes to your iOS applications. It allows you to manage multiple themes and apply them with smooth animations. ThemeEngine is designed to work seamlessly with UIKit components and is compatible with Swift-based projects.

## Features

- Define custom themes with a set of associated colors.
- Apply themes with smooth animations.
- Support for managing multiple themes.
- Easily extendable to add new color schemes.
- Swift and UIKit friendly.

## Installation

### CocoaPods
To integrate ThemeEngine into your Xcode project using CocoaPods, add the following line to your Podfile:

```ruby
pod 'ThemeEngine'
```
Then, run `pod install` from the command line.

## Usage

### Defining Color Keys
Define the keys for the colors in your theme. These keys should be unique identifiers for each color property in your theme. To do this, create a custom enumeration conforming to the `ThemeEngine.ColorKey` protocol. For example:
```swift
enum ColorKey: ThemeEngine.ColorKey {
    case background
    case text
    case accent
}
```
### Defining themes
Next, define a custom themes by creating a `ThemeEngine.Theme` object with your custom `ColorKey` enumeration and a dictionary of color associations. For example:
```swift
let lightTheme = ThemeEngine.Theme<ColorKey>(colors: [
    .background: .white,
    .text: .black,
    .accent: .systemBlue
])

let darkTheme = ThemeEngine.Theme<ColorKey>(colors: [
    .background: .black,
    .text: .white,
    .accent: .systemYellow
])
```
### Applying Themes

To set a default theme, apply your custom theme in the `application(_:didFinishLaunchingWithOptions:)` method of your AppDelegate:
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    ThemeEngine.shared.apply(theme: lightTheme)
    return true
}
```
Then, you can apply different themes as needed:
```swift
ThemeEngine.shared.apply(theme: darkTheme)
```

### Using Theme Colors
To use a color from the applied theme, call the `setThemeColor(_:for:)` method on any `NSObject` instance. For example:
```swift
let view = UIView()
view.setThemeColor(ColorKey.background, for: \UIView.backgroundColor)

let imageView = UIImageView(image: image)
imageView.setThemeColor(ColorKey.accent, for: \UIImageView.tintColor)

let titleLabel = UILabel()
titleLabel.setThemeColor(ColorKey.text, for: \UILabel.textColor)

let settingsItem = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: nil, action: nil)
settingsItem.setThemeColor(ColorKey.accent, for: \UIBarButtonItem.tintColor)
```
The color will automatically update when a new theme is applied.

### Demo
Check the [demo project](https://github.com/Narkok/ThemeEngine/tree/main/ThemeEngineDemo) for a better understanding of how to use this ThemeEngine effectively in your own projects.
<br><br>
<img src="https://raw.githubusercontent.com/Narkok/ThemeEngine/main/Assets/demo.gif" alt="ThemeEngine Demo" title="ThemeEngine Demo" width="300"/>
