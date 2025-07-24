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
            url: "https://github.com/HGSNS/Higo-iOS-SDK-Core/releases/download/0.0.1/HigoCore.xcframework.zip",
            checksum: "8f158c6c39c215e840f80a815884d043cf4de7029b9beff2bd99986c76a483cb"
        )
    ]
)