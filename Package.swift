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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.1/HigoCore.xcframework.zip",
            checksum: "879a4cf884e8875b113197ca14d8b2946bf5f73ecedd18406f2caf5aa1e489ac"
        )
    ]
)