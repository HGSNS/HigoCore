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
            url: "https://github.com/HGSNS/Higo-iOS-SDK-Core/releases/download/0.1.1/HigoCore.xcframework.zip",
            checksum: "1893ef057006005707ea4857d7222589d9e2b1c020a7ef1dced6d224ba1aae1f"
        )
    ]
)