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
            url: "https://github.com/HGSNS/HigoCore/releases/download/0.0.0-test/HigoCore.xcframework.zip",
            checksum: "1e992778c3332068b1f8d1adbac8b3481da8e61f717a40cb36beca142544f010"
        )
    ]
)
