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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.10/HigoCore.xcframework.zip",
            checksum: "75fed331a5cabd3ec9a8e92be283a2c3a99b911fe17929d4ad71d1bee8ad9544"
        )
    ]
)