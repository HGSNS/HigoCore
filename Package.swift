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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.1/HigoCore.xcframework.zip",
            checksum: "e1310000fdae59c58cb65c3facdf733ee09d653c2a2be10359e35708fa30b77f"
        )
    ]
)