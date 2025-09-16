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
            checksum: "a942292d14f35e25b562c58b7a2630b3c8bf5539528e67ebc184d57ea1fa9024"
        )
    ]
)