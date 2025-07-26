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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.2/HigoCore.xcframework.zip",
            checksum: "166345906032fd0fbea6d4afd5caad06c15001c4038e564ce0bc9f358aea1ed2"
        )
    ]
)