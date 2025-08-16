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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.23/HigoCore.xcframework.zip",
            checksum: "c1140418022826329ecc13acaec69692687ee16cbf17ecaae3dbccaf4d14b69f"
        )
    ]
)