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
            url: "https://github.com/HGSNS/HigoCore/releases/download/1.0.2-RC1/HigoCore.xcframework.zip",
            checksum: "6e6c526439c5aee627044c8f847f4fe8699c06075d8730a191f333fddc90a733"
        )
    ]
)
