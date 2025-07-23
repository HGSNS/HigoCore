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
            url: "https://github.com/HGSNS/Higo-iOS-SDK-Core/releases/download/0.1.0/HigoCore.xcframework.zip",
            checksum: "1dfa1b6f0d88470a44a5adb5e01ce1f76c053fd5476ee170faab76cffbe718ec"
        )
    ]
)