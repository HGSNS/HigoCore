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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.3/HigoCore.xcframework.zip",
            checksum: "853aeefd71ae70de5a0a5f7c938e9a2bd8564fb7099e0fd1eb5b5e231eb4227a"
        )
    ]
)