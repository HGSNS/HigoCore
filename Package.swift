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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.16/HigoCore.xcframework.zip",
            checksum: "bdbbea987a68187dd2f3339fcefcbc3b3ffb37edaea3497a29c03d67b0c1c020"
        )
    ]
)