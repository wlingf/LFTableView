#
#  Be sure to run `pod spec lint LFTableViewDemo.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "LFTableViewDemo"
  s.version      = "0.0.1"
  s.summary      = "A short description of LFTableViewDemo."
  s.description  = <<-DESC
                    test project with tableview
                   DESC
  s.homepage     = "https://github.com/wlingf/LFTableView"
  s.license      = "MIT"
  s.author             = { "wlingf" => "266932823.@qq.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/wlingf/LFTableView.git", :tag => "0.0.1" }
  s.source_files  = "LFTableViewDemo/**/*.{h,m}"
  s.requires_arc = true

end
