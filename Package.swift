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
            url: "https://github.com/HGSNS/HigoCore/releases/download/1.0.2-RC3/HigoCore.xcframework.zip",
            checksum: "f5ffc81966f537d6b209f191f449546fe96ad2d5262dc6cdd4b1f6016bb4db27"
        )
    ]
)
