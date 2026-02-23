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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.11/HigoCore.xcframework.zip",
            checksum: "dff45e625097e5480a36d7e04733fdb7f84cc1853359f38cb2c9d5360290dfba"
        )
    ]
)