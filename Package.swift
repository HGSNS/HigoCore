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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.17/HigoCore.xcframework.zip",
            checksum: "46bc3a488349779b62502d77f11e5b69b1609140adda705075ccb1a551fe35e9"
        )
    ]
)