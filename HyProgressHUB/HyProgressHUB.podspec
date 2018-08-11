Pod::Spec.new do |s|

  s.name         = "HyProgressHUB"
  s.version      = "1.0.0"
  s.summary      = "Nice progress hub support gif animation and Lottie."
  s.description  = "Highly costomize progress hub support gif animation and Lottie."
  s.homepage     = "https://github.com/bbkaf/HyProgressHUB"
  s.license      = "MIT"
  s.author       = { "Hank" => "bbkaf@hotmail.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/bbkaf/HyProgressHUB.git", :tag => "1.0.0" }
  s.frameworks   = 'Foundation','UIKit','ImageIO'
  s.source_files = "HyProgressHUB/**/*"
  s.exclude_files = "HyProgressHUB/HyProgressHUB/demo\ gif/*.gif"
s.resources = "HyProgressHUB/HyProgressHUB/demo\ gif/*.gif"

end