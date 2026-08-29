// swift-tools-version: 5.9
// Template for the public HGSNS/HigoCore SPM distribution repository.
// URL and checksum are updated by Fastlane release lanes.

import PackageDescription

let package = Package(
    name: "HigoCore",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "HigoCore",
            targets: ["HigoCore"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "HigoCore",
            url: "https://github.com/HGSNS/HigoCore/releases/download/1.0.2-RC5/HigoCore.xcframework.zip",
            checksum: "a82452c61cc8650dd2d6df0d5b0397768f8b017d1ca6f9f746c4029b86b9dbb7"
        )
    ]
)
