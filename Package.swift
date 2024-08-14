// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.
// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "OlaMapCore",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "OlaMapCore",
        targets: [
            "OlaMapCore",
            "MapLibre",
            "MoEngageSecurity",
            "MoEngageSDK",
            "MoEngageObjCUtils",
            "MoEngageMessaging",
            "MoEngageCore",
            "MoEngageAnalytics"
        ]),
    ],
    targets: [
        .binaryTarget(
            name: "OlaMapCore",
            path: "OlaMapCore/build/OlaMapCore.xcframework"
        ),
        .binaryTarget(
            name: "MapLibre",
            path: "Framework/MapLibre.xcframework"
        ),
        .binaryTarget(
            name: "MoEngageAnalytics",
            path: "Framework/MoEngageAnalytics.xcframework"
        ),
        .binaryTarget(
            name: "MoEngageCore",
            path: "Framework/MoEngageCore.xcframework"
        ),
        .binaryTarget(
            name: "MoEngageMessaging",
            path: "Framework/MoEngageMessaging.xcframework"
        ),
        .binaryTarget(
            name: "MoEngageObjCUtils",
            path: "Framework/MoEngageObjCUtils.xcframework"
        ),
        .binaryTarget(
            name: "MoEngageSDK",
            path: "Framework/MoEngageSDK.xcframework"
        ),
        .binaryTarget(
            name: "MoEngageSecurity",
            path: "Framework/MoEngageSecurity.xcframework"
        ),
        
    ]
)
