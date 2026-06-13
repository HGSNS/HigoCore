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
            url: "https://github.com/HGSNS/HigoCore/releases/download/1.0.1/HigoCore.xcframework.zip",
            checksum: "205dab633814091cda7640d1673b5c517bf316f4ea67ececa5b185963bd88244"
        )
    ]
)