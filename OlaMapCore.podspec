Pod::Spec.new do |spec|
  spec.name          = 'OlaMapCore'
  spec.version       = '1.0.8'
  spec.summary       = 'OlaMap Core Service'
  spec.description   = 'OlaMapService is your go-to solution for essential map functionality, providing a seamless and intuitive experience for integrating maps into your applications.'
  spec.homepage      = 'https://maps.olakrutrim.com/'
  spec.author        = { 'OlaMaps Team' => 'support@olamaps.io' }
  spec.license       = { :type => 'Copyright', :file => 'LICENSE' }
  spec.source        = { :git => 'https://github.com/ola-maps/ios-ola-map-sdk.git', :tag => spec.version.to_s }
  spec.swift_version = '5.0'
  spec.ios.deployment_target = '13.0'

  spec.ios.vendored_frameworks =
    "Frameworks/OlaMapCore.xcframework",
    "Frameworks/MapLibre.xcframework",
    "Frameworks/MoEngageAnalytics.xcframework",
    "Frameworks/MoEngageCore.xcframework",
    "Frameworks/MoEngageMessaging.xcframework",
    "Frameworks/MoEngageObjCUtils.xcframework",
    "Frameworks/MoEngageSDK.xcframework",
    "Frameworks/MoEngageSecurity.xcframework"


end
