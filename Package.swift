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
            url: "https://github.com/HGSNS/HigoCore/releases/download/1.0.3-RC1/HigoCore.xcframework.zip",
            checksum: "f14dcae4c7bcb64b37886d01bd23ab6cde6713ecdf4284eede6674229c440117"
        )
    ]
)
