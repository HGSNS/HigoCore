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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.2/HigoCore.xcframework.zip",
            checksum: "90a6cad4189663a997bf0c957d9733ab7c0f0138f2f432a7afbf4e9e70a49fd3"
        )
    ]
)