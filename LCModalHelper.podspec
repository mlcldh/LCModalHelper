Pod::Spec.new do |s|

  s.name         = "LCModalHelper"
  s.version      = "0.0.1"
  s.summary      = "Custom modal animation."

  s.homepage     = "https://github.com/mlcldh/LCModalHelper"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "mlcldh" => "1228225993@qq.com" }

  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/mlcldh/LCModalHelper.git", :tag => "0.0.1" }
  s.source_files: = 'LCModalHelper/*.{h,m}'

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
