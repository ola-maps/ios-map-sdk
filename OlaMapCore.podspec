Pod::Spec.new do |spec|
  spec.name          = 'OlaMapCore'
  spec.version       = '1.0.7.1'
  spec.summary       = 'OlaMap Core Service'
  spec.description   = 'OlaMapService is your go-to solution for essential map functionality, providing a seamless and intuitive experience for integrating maps into your applications.'
  spec.homepage      = 'https://maps.olakrutrim.com/'
  spec.author        = { 'OlaMaps Team' => 'support@olamaps.io' }
  spec.license       = { :type => 'Copyright', :file => 'LICENSE' }
  spec.source        = { :git => 'https://github.com/ola-maps/ios-ola-map-sdk.git', :tag => spec.version.to_s }
  spec.swift_version = '5.0'
  spec.ios.deployment_target = '13.0'

  spec.ios.vendored_frameworks =
    "Framework/OlaMapCore.xcframework",
    "Framework/MapLibre.xcframework",
    "Framework/MoEngageAnalytics.xcframework",
    "Framework/MoEngageCore.xcframework",
    "Framework/MoEngageMessaging.xcframework",
    "Framework/MoEngageObjCUtils.xcframework",
    "Framework/MoEngageSDK.xcframework",
    "Framework/MoEngageSecurity.xcframework"


end
