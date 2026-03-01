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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.1.13/HigoCore.xcframework.zip",
            checksum: "7f076b14bc8854ffc79055535e0eab7b7e078f32f7b71fd854c33329cafb33cf"
        )
    ]
)