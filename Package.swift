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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.0/HigoCore.xcframework.zip",
            checksum: "67f84b1a035cc676d07c99e56a3378f2f15f68389a767fb6d0c117b2caabb9e8"
        )
    ]
)