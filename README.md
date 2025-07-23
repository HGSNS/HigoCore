# HigoCore SDK

[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-green.svg)](https://swift.org/package-manager/)
[![Platform](https://img.shields.io/badge/platform-iOS-blue.svg)](https://developer.apple.com/ios/)

## Description

The `HigoCore` framework is the backbone of the Higo integration.

## Requirements

- **iOS:** 13.0 or later
- **Xcode:** 14.0 or later
- **Swift:** 5.7 or later

## Installation

You can add the HigoCore SDK to your Xcode project using the Swift Package Manager (SPM).

1. In Xcode, open your project and navigate to **File > Add Packages...**
2. In the search bar, enter the repository URL:
    ```
    https://github.com/HGSNS/Higo-iOS-SDK-Core.git
    ```
3. For **Dependency Rule**, select the desired version. We recommend using **Up to Next Major Version** to automatically receive compatible updates.
4. Click **Add Package**.
5. Choose the `HigoCore` library and add it to your application's target.

## Usage

After adding the package, you can import and configure the SDK in your application.

First, import the framework in your `AppDelegate.swift` or wherever you manage your application's startup logic:

```swift
import HigoCore
```

Then, configure the SDK with your credentials, typically within the `application(_:didFinishLaunchingWithOptions:)` method:

```swift
// Create the server information
let serverInfo = ServerInfo(
    baseUrl: "https://your-api-base-url.com",
    clientId: "your-client-id",
    clientSecret: "your-client-secret"
)

// Create the configuration
let configuration = CoreConfiguration(
    serverInfo: serverInfo,
    language: .en,
    enableLogging: true 
)

// Initialize the SDK
HigoCoreSDK.configure(with: configuration)
```

Now you can access the shared SDK instance throughout your app:

```swift
let higoSDK = HigoCoreSDK.shared
// Use the SDK to perform actions
```
