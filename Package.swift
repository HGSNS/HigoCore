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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.6/HigoCore.xcframework.zip",
            checksum: "bdf6e37cf2e19d8196856d8cb45376708ccc513dbb5cb0b8b79aef851fa6a160"
        )
    ]
)