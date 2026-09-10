// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "BritanniaNearbyFinderUIPlugin",
    products: [
        .library(
            name: "BritanniaNearbyFinderUIPlugin",
            targets: ["BritanniaNearbyFinderUIPlugin"])
    ],
    dependencies: [
    ],    
    targets: [
        .binaryTarget(
            name: "BritanniaNearbyFinderUIPlugin",
            url: "https://mmi-api-team.s3.amazonaws.com/Mappls-SDKs/iOS_Legacy_Auth/BritanniaNearbyFinderUIPlugin/BritanniaNearbyFinderUIPlugin.xcframework-1.0.4.zip",
            checksum: "add0a4a67832539295092da56e82434be319dfed94ac96a15cc9aa2e6a677192")
    ]
)

