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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.17/HigoCore.xcframework.zip",
            checksum: "2947f38545a14016c99b3ae90a94401085e9ead89fc0088e0ba0cf54c1c06050"
        )
    ]
)