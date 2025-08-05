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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.5/HigoCore.xcframework.zip",
            checksum: "f98ff1e2d2a287c85cb444dedf361ee5abe6e3fe5e84ab300af02172964a9de0"
        )
    ]
)