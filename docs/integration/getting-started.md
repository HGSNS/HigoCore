# Getting started

## Requirements

- iOS 17.0+
- Xcode 15+ (Swift 5.9+)
- Bluetooth permission (see [Info.plist](#info-plist))

## Add the package

Add the public `HigoCore` package to your app target (version pin per your release process):

```swift
// Package.swift (app) or Xcode → Package Dependencies
.package(url: "https://github.com/HGSNS/HigoCore.git", exact: "1.0.0")
```

```swift
.target(
    name: "YourApp",
    dependencies: [
        .product(name: "HigoCore", package: "HigoCore")
    ]
)
```

RC builds use prerelease tags such as `1.0.0-RC1` (for test builds only; use at your own risk).

## Initialize the SDK

Call ``HigoCoreSDK/initialize(configuration:)`` once per authenticated session (for example after login). It throws ``HigoSDKError/alreadyInitialized`` if called twice without ``HigoCoreSDK/deinitialize()``.

```swift
import HigoCore

func configureSDK() throws {
    let configuration = CoreConfiguration(
        serverInfo: ServerInfo(
            host: "https://api.example.com",
            clientId: "YOUR_CLIENT_ID",
            clientSecret: "YOUR_CLIENT_SECRET"
        ),
        authCredentials: AuthCredentials(
            email: userEmail,
            accessToken: accessToken,
            refreshToken: refreshToken
        ),
        language: .en,
        isLoggingEnabled: false
    )
    try HigoCoreSDK.initialize(configuration: configuration)
}
```

### `language` and `isLoggingEnabled`

| Property | When it applies | Effect |
|----------|-----------------|--------|
| `language` | Set once at initialize | SDK language preference (``Language``). Defaults to `.en`. Changing it requires ``HigoCoreSDK/deinitialize()`` and a new ``HigoCoreSDK/initialize(configuration:)`` call. |
| `isLoggingEnabled` | Set once at initialize | Enables verbose logging for SDK **HTTP** calls to the backend (`APIClient`). Leave `false` in production unless diagnosing API issues. |

Device flows also accept a separate **`isLoggingEnabled`** argument on ``DeviceManaging/initiatePairing(serialNumber:isDeviceAssigned:isLoggingEnabled:)`` and ``DeviceManaging/searchForWiFiNetworks(isLoggingEnabled:)``. That flag controls whether the **device** streams diagnostic logs over BLE during pairing or Wi‑Fi scan—not the HTTP logging above. Enable it only while troubleshooting field issues; keep it `false` for normal users.

Call ``HigoCoreSDK/deinitialize()`` when the user logs out so the SDK can be configured again.

## Access managers

Managers throw ``HigoSDKError/notInitialized`` if used before initialization:

```swift
let deviceManager = try HigoCoreSDK.deviceManager
let visitManager = try HigoCoreSDK.visitManager
```

## Info.plist

Declare Bluetooth usage for Higo device flows:

```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>Required to pair and configure your Higo device.</string>
```

## Next steps

- Full onboarding flow: [Happy path](happy-path.md)
- API details: [hosted DocC](../index.md#api-reference-github-pages) after stable release, or Xcode **Product → Build Documentation**
