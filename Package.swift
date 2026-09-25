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
            url: "https://mmi-api-team.s3.amazonaws.com/Mappls-SDKs/iOS_Legacy_Auth/BritanniaNearbyFinderUIPlugin/BritanniaNearbyFinderUIPlugin-1.0.5.xcframework.zip",
            checksum: "564e88e70a1b60ac6a7f16e98577d4fa06d22239977c97b9340f0edadca9eb29")
    ]
)

