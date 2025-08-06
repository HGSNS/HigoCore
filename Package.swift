// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HigoCore",
    products: [
        .library(
            name: "HigoCore",
            targets: ["HigoCore"]
            ),
    ],
    targets: [
        .binaryTarget(
            name: "HigoCore",
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.8/HigoCore.xcframework.zip",
            checksum: "5d24afbf04f792f35c0fb1709b29565a0d024dd9ab4bb2e717bf409dffc7cb21"
        )
    ]
)