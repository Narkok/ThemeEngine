Pod::Spec.new do |spec|

  spec.name         = "ThemeEngine"
  spec.version      = "1.0.0"
  spec.summary      = "A simple theming engine for iOS apps."
  spec.description  = <<-DESC
                        ThemeEngine is a lightweight and easy-to-use theming engine for iOS apps, 
                        allowing developers to quickly implement and manage color themes for their apps.
                      DESC

  spec.homepage     = "https://github.com/Narkok/ThemeEngine"
  spec.license      = "MIT"
  spec.author       = { "narkok" => "nar-ste@yandex.ru" }
  spec.platform     = :ios, "14.0"
  spec.source       = { :git => "https://github.com/Narkok/ThemeEngine.git", :tag => spec.version.to_s }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  spec.source_files  = "ThemeEngine/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  spec.frameworks  = "UIKit"
  spec.swift_versions = "5.0"

end
