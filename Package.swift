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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.18/HigoCore.xcframework.zip",
            checksum: "5527102db4e99b8282dc7fb6f841a45fb88955c7399c5599ab7498564f4b4d16"
        )
    ]
)