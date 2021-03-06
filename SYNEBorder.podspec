#
# Be sure to run `pod lib lint SYNEBorder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SYNEBorder'
  s.version          = '0.3.0'
  s.summary          = 'Swiftly create custom UIView borders with SYNEBorder.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Swiftly create custom UIView borders with SYNEBorder.

Each corner and each edge of the UIView can be customized with a border of different color, radius, and/or width. Borders can also be dotted.

                       DESC

  s.homepage         = 'https://github.com/shawnynicole/SYNEBorder'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shawnynicole' => '21274059+shawnynicole@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/shawnynicole/SYNEBorder.git', :tag => "Release/#{s.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.source_files = 'SYNEBorder/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SYNEBorder' => ['SYNEBorder/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
