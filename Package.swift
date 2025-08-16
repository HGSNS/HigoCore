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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.24/HigoCore.xcframework.zip",
            checksum: "27a01e7ed6e94c28c7ae63dd5f25dae83af2ff01c24c24b30edff4d9ed075808"
        )
    ]
)