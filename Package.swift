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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.14/HigoCore.xcframework.zip",
            checksum: "6f131059e55bc1073936f18b66b1e591cd1d4ed39b8d9741c8c2fad5630177ff"
        )
    ]
)