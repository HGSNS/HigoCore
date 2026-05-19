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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.16/HigoCore.xcframework.zip",
            checksum: "13b857ef43193adbd75f1e584ed643c3d1b1a997203ec376e6c0ff01432be72b"
        )
    ]
)