#
# Be sure to run `pod lib lint RealDebridKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RealDebridKit'
  s.version          = '0.1.1'
  s.summary          = 'With RealDebridKit you can use to API of real-debrid.com (Ref.: https://api.real-debrid.com)'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
With RealDebridKit you can use the API of real-debrid.com. (Ref.: https://api.real-debrid.com). 
The user of your app only needs an account at real-debrid.
If you like, you can get your own clientid and clientsecret. Please contact the support of realdebrid.
                       DESC

  s.homepage         = 'https://github.com/mfreiwald/RealDebridKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michael Freiwald' => 'm.freiwald@icloud.com' }
  s.source           = { :git => 'https://github.com/mfreiwald/RealDebridKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RealDebridKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RealDebridKit' => ['RealDebridKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Alamofire', '~> 4.2'
  s.dependency 'Gloss', '~> 1.1'
end
