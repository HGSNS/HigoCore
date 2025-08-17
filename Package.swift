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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.25/HigoCore.xcframework.zip",
            checksum: "74037a68a03e03c916e8d9e3620624b00602e2aec03b248f0052fd43a0cebf4a"
        )
    ]
)