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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.15/HigoCore.xcframework.zip",
            checksum: "8e28da504a81a32eb9579ae8d8ad6346e5682334de3fe4a3200474bfe41e4bd1"
        )
    ]
)