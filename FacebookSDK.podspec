# If you've made changes to the SDK (such as file paths), consider using `pod lib lint` to lint locally and then using the :path option in your Podfile

Pod::Spec.new do |s|

  s.name         = 'FacebookSDK'
  s.version      = '5.7.0'
  s.summary      = 'Official Facebook SDK for iOS to access Facebook Platform'

  s.description  = <<-DESC
                   The Facebook SDK for iOS enables you to use Facebook's Platform such as:
                   * Facebook Login to easily sign in users.
                   * Sharing features like the Share or Message Dialog to grow your app.
                   * Simpler Graph API access to provide more social context.
                   DESC

  s.homepage     = 'https://developers.facebook.com/docs/ios/'
  s.license      = { :type => 'Facebook Platform License', :file => 'LICENSE' }
  s.author       = 'Facebook'

  s.platform     = :ios, :tvos
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '10.0'

  s.source       = { :git => 'https://github.com/facebook/facebook-ios-sdk.git',
                     :tag => "v#{s.version}" }

  s.ios.weak_frameworks = 'Accounts', 'CoreLocation', 'Social', 'Security', 'QuartzCore', 'CoreGraphics', 'UIKit', 'Foundation', 'AudioToolbox', 'WebKit'
  s.tvos.weak_frameworks = 'CoreLocation', 'Security', 'QuartzCore', 'CoreGraphics', 'UIKit', 'Foundation', 'AudioToolbox'

  s.requires_arc = true

  s.default_subspecs = 'CoreKit', 'MarketingKit'

  s.subspec 'CoreKit' do |ss|
    ss.dependency 'FBSDKCoreKit', "~> 5.0"
  end
  s.subspec 'LoginKit' do |ss|
    ss.dependency 'FacebookSDK/CoreKit'
    ss.dependency 'FBSDKLoginKit', "~> 5.0"
  end
  s.subspec 'ShareKit' do |ss|
    ss.dependency 'FacebookSDK/CoreKit'
    ss.dependency 'FBSDKShareKit', "~> 5.0"
  end
  s.subspec 'TVOSKit' do |ss|
    ss.platform = :tvos
    ss.dependency 'FacebookSDK/ShareKit'
    ss.dependency 'FacebookSDK/LoginKit'
    ss.dependency 'FBSDKTVOSKit', "~> 5.0"
  end
  s.subspec 'PlacesKit' do |ss|
    ss.platform = :ios
    ss.dependency 'FacebookSDK/CoreKit'
    ss.dependency 'FBSDKPlacesKit', "~> 5.0"
  end
  s.subspec 'MarketingKit' do |ss|
    ss.platform = :ios
    ss.dependency 'FacebookSDK/CoreKit'
    ss.dependency 'FBSDKMarketingKit', "~> 5.0"
  end
end
