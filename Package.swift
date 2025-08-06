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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.6/HigoCore.xcframework.zip",
            checksum: "dc63be625e1a7123829064a77e78608d193628ca3c3f0e12536bbb3f121199a2"
        )
    ]
)