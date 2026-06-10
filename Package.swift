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
            url: "https://github.com/HGSNS/HigoCore/releases/download/1.0.0/HigoCore.xcframework.zip",
            checksum: "6f443b2695698bda648dd20767daadd84ee31b596dce01e8897f2d1b36915a3a"
        )
    ]
)