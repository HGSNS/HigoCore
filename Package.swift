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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.7/HigoCore.xcframework.zip",
            checksum: "bf00edf8231977d860988c94498938eb0383ac3f2cdc110f0e45b0081dda5c75"
        )
    ]
)