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
            url: "https://github.com/HGSNS/HigoCore/releases/download/v0.0.9/HigoCore.xcframework.zip",
            checksum: "8b41b55ed34c7bbc2a032e6c59dd216e4aa10095ebffbf65cffbc973e1acb2a4"
        )
    ]
)