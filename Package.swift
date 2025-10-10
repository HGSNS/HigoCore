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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.5/HigoCore.xcframework.zip",
            checksum: "00859632a1ba89acb041e3157553c77466ba672c91d3098006e9c2ddcc0e7f5b"
        )
    ]
)