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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.14/HigoCore.xcframework.zip",
            checksum: "ae644f8f933b8b850c16319288e9f4dff24f05f1b19ac970f1e8177d902ac2f1"
        )
    ]
)