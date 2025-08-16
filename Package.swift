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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.20/HigoCore.xcframework.zip",
            checksum: "ad94011120edf469ca2f38188bc97e44b25cb4ec970c6f0063c9e13bd5e6b2b7"
        )
    ]
)