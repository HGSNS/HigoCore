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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.22/HigoCore.xcframework.zip",
            checksum: "d9c8f21b280bfad084f67acbf54100c382e8c080aceb0b1ed46a1907ce6b946d"
        )
    ]
)