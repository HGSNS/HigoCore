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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.11.1/HigoCore.xcframework.zip",
            checksum: "43f7f7c5b347eee7d9283d8d14e530eb730a069ec281f5a400914c88539a07d6"
        )
    ]
)