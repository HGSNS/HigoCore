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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.15/HigoCore.xcframework.zip",
            checksum: "9bdf66a375836182faf64e8161e40cf17d379e9ccc017f54425a1037c812946e"
        )
    ]
)