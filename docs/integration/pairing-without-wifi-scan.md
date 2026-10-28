# Pairing without device Wi‑Fi scan

When the user already knows the SSID and password (for example a hospital guest network printed on signage), skip ``DeviceManaging/searchForWiFiNetworks(isLoggingEnabled:)`` and provision directly after pairing.

## Flow

```swift
let deviceManager = try HigoCoreSDK.deviceManager

let pairingResult = try await deviceManager.initiatePairing(
    serialNumber: serialNumber,
    isDeviceAssigned: false,
    isLoggingEnabled: false
)

guard case .paired = pairingResult else {
    return
}

try await deviceManager.provisionDevice(
    serialNumber: serialNumber,
    ssid: knownSSID,
    password: knownPassword,
    mode: .setup
)
```

## When to scan anyway

- Let the user pick from networks the device actually sees
- Validate the SSID is in range before provisioning
- Debug field reports of “missing” networks (see [troubleshooting](../troubleshooting/README.md))

## Wi‑Fi update only

For an already provisioned device changing networks, pairing may return `.deviceAlreadyProvisioned`. Use `.wifiUpdate` and the same skip-scan pattern if credentials are known:

```swift
try await deviceManager.provisionDevice(
    serialNumber: serialNumber,
    ssid: knownSSID,
    password: knownPassword,
    mode: .wifiUpdate
)
```
