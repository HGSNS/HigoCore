# Higo Core iOS SDK

Official iOS SDK for integrating Higo device pairing, Wi‑Fi provisioning, and visit APIs into your application.

## Requirements

- iOS 17.0+
- Swift 5.9+
- Bluetooth permission for device setup flows

## Installation

Add the package dependency in Xcode (**File → Add Package Dependencies**) or in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/HGSNS/HigoCore.git", exact: "1.0.0")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "HigoCore", package: "HigoCore")
        ]
    )
]
```

Release candidates use tags such as `1.0.0-RC1` (prerelease; for test builds only). Production apps should pin an official `X.Y.Z` tag.

## Quick start

```swift
import HigoCore

// 1. Initialize once per authenticated session
try HigoCoreSDK.initialize(
    configuration: CoreConfiguration(
        serverInfo: ServerInfo(
            host: "https://api.example.com",
            clientId: "YOUR_CLIENT_ID",
            clientSecret: "YOUR_CLIENT_SECRET"
        ),
        authCredentials: AuthCredentials(
            email: userEmail,
            accessToken: accessToken
        )
    )
)

// 2. Pair a device (serial from QR or user input)
let deviceManager = try HigoCoreSDK.deviceManager
let result = try await deviceManager.initiatePairing(
    serialNumber: serialNumber,
    isDeviceAssigned: false,
    isLoggingEnabled: false
)

// 3. Provision Wi‑Fi when pairing returns .paired
if case .paired = result {
    let networks = try await deviceManager.searchForWiFiNetworks(isLoggingEnabled: false)
    try await deviceManager.provisionDevice(
        serialNumber: serialNumber,
        ssid: selectedSSID,
        password: wifiPassword,
        mode: .setup
    )
}

// 4. Logout
HigoCoreSDK.deinitialize()
```

Replace placeholder host and OAuth values with credentials from your Higo integration contact. Do not commit secrets to source control.

## Documentation

| Resource | Link |
|----------|------|
| Integration guides | [docs/index.md](docs/index.md) |
| Troubleshooting | [docs/troubleshooting/README.md](docs/troubleshooting/README.md) |
| Error reference | [docs/errors/README.md](docs/errors/README.md) |
| API reference (DocC) | [Hosted API docs](https://hgsns.github.io/HigoCore/api/documentation/higocore) (available after Pages is enabled on first stable release) |

## Permissions

Add to your app `Info.plist`:

```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>Required to pair and configure your Higo device.</string>
```
