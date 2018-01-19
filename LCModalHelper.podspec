Pod::Spec.new do |s|

  s.name         = "LCModalHelper"
  s.version      = "0.0.1"
  s.summary      = "Custom modal animation."

  s.description  = < "1228225993@qq.com" }

  s.homepage     = "http://EXAMPLE/LCModalHelper"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "mlcldh" => "1228225993@qq.com" }
  # Or just: s.author    = "mlcldh"
  # s.authors            = { "mlcldh" => "1228225993@qq.com" }
  # s.social_media_url   = "http://twitter.com/mlcldh"

  s.platform     = :ios
  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/mlcldh/LCModalHelper.git", :tag => s.version.to_s }

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
