#
# Be sure to run `pod lib lint ValidatorPizza.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ValidatorPizza'
  s.version          = '1.0.0'
  s.summary          = 'Objective-C wrapper for the Validator.pizza email validation service'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
🍕 Bite-sized iOS wrapper for the simple disposable email hunter and validator
                       DESC

  s.homepage         = 'https://github.com/imryan/validatorpizza-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ryan Cohen' => 'notryancohen@gmail.com' }
  s.source           = { :git => 'https://github.com/imryan/validatorpizza-ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'ValidatorPizza/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ValidatorPizza' => ['ValidatorPizza/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
