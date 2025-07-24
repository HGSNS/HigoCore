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
            url: "https://github.com/HGSNS/Higo-iOS-SDK-Core/releases/download/0.0.1/HigoCore.xcframework.zip",
            checksum: "c996ed0cc9852023522f488e454ba4f5a5a464d83016d7796e47d130cfc89ff3"
        )
    ]
)