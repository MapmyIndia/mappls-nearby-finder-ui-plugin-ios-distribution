// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "BritanniaNearbyFinderUIPlugin",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "BritanniaNearbyFinderUIPlugin",
            targets: ["BritanniaNearbyFinderUIPlugin"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "BritanniaNearbyFinderUIPlugin",
            url: "https://mmi-api-team.s3.amazonaws.com/Mappls-SDKs/iOS_Legacy_Auth/BritanniaNearbyFinderUIPlugin/BritanniaNearbyFinderUIPlugin.xcframework-1.0.6.zip",
            checksum: "a5a3b7a49031bc22ba3c85bf20a2d14bb43f09bdcef2f3b8df92d06504b20ed8"
        )
    ]
)
