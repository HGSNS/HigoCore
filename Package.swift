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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.10/HigoCore.xcframework.zip",
            checksum: "c9aefb3aae0e6dde81d4e8a241e3b1045e98cf6d3a77e328e0528b43717dcf93"
        )
    ]
)