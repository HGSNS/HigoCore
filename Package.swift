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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.9/HigoCore.xcframework.zip",
            checksum: "93846af0ee545c5d94dfece9ab882b6aa86e45b7ea6bdf8b9a983e911c98e4cd"
        )
    ]
)