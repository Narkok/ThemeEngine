Pod::Spec.new do |s|
  s.name             = 'ThemeEngine'
  s.version          = '0.1.0'
  s.summary          = 'A simple theming engine for iOS apps.'
  s.description      = <<-DESC
                        ThemeEngine is a lightweight and easy-to-use theming engine for iOS apps, 
                        allowing developers to quickly implement and manage color themes for their apps.
                      DESC
  s.homepage         = 'https://github.com/narkok/ThemeEngine'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Narkok' => 'nar-ste@yandex.ru' }
  s.source           = { :git => 'https://github.com/narkok/ThemeEngine.git', :tag => s.version.to_s }
  s.swift_version    = '5.0'
  s.platform         = :ios, '14.0'
  s.requires_arc     = true
  s.source_files     = 'ThemeEngine/**/*.{swift,h,m}'
  s.frameworks       = 'UIKit'
end