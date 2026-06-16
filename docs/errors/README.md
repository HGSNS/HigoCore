# Error reference

Higo Core surfaces failures as ``HigoSDKError``. Device flows use ``HigoSDKError/DeviceError`` with nested ``HigoSDKError/BLEFailure``, ``HigoSDKError/BackendFailure``, ``HigoSDKError/ProvisioningFailure``, and ``HigoSDKError/InvalidUsage``.

## Handling pattern

```swift
do {
    try await deviceManager.initiatePairing(
        serialNumber: serialNumber,
        isDeviceAssigned: false,
        isLoggingEnabled: false
    )
} catch let error as HigoSDKError {
    switch error {
    case .notInitialized:
        // Call initialize(configuration:) first
        break
    case .device(let deviceError):
        switch deviceError.category {
        case .bluetooth:
            // Retry BLE, check permissions, keep session alive
            break
        case .backend:
            // Refresh token, verify assignment APIs
            break
        case .provisioning:
            // Wi‑Fi credentials or registration step
            break
        case .invalidUsage:
            // Fix call order (pair before scan/provision)
            break
        case .unknown:
            break
        }
    case .visit, .externalDevice, .alreadyInitialized:
        break
    }
}
```

Use ``HigoSDKError/BLEFailure/code`` and ``HigoSDKError/ProvisioningFailure/code`` for stable branching without pattern-matching associated values in tests.

## Top-level errors

| Case | When | Action |
|------|------|--------|
| `notInitialized` | Manager used before `initialize` | Initialize SDK after login |
| `alreadyInitialized` | Second `initialize` without `deinitialize` | Call `deinitialize` on logout |
| `device(...)` | Device manager failure | See tables below |
| `visit(...)` | Visit API failure | Inspect `BackendFailure` |
| `externalDevice(...)` | Third-party BLE device | See external device table |

## Device — Bluetooth (`DeviceError.bluetooth`)

| `BLEFailure` | Typical cause | Recommended action |
|--------------|---------------|-------------------|
| `bluetoothUnavailable` | Simulator or restricted device | Test on physical device with Bluetooth |
| `bluetoothPoweredOff` | BT off in Settings | Prompt user to enable Bluetooth |
| `scanTimeout(serialNumber:)` | Device not found during scan window | Device powered, in range, correct serial; avoid disconnect between steps |
| `connectionFailed` | GATT connect failed | Retry; check another app holding connection |
| `pairingHandshakeFailed` | Broker/user data rejected on device | Verify backend assignment and credentials |
| `notConnected` | Command without active session | Run pairing first; do not disconnect mid-flow |
| `wifiScanFailed` | Device did not return SSID list | Retry scan; keep BLE session; check firmware |
| `loggingSetupFailed` | Optional log enable failed | Retry with `isLoggingEnabled: false` |
| `ackRejected(...)` | Device NACK | See ACK table below |
| `commandFailed` | Post-pair command failed | Retry pairing from clean state |
| `cancelled` | Operation cancelled | Restart flow |

### ACK rejections (`ackRejected`)

| `AckRejection` | Meaning | Action |
|----------------|---------|--------|
| `wifiWrongPSK` | Wrong password | Re-enter password |
| `wifiNotInRange` | SSID not visible to device | Move device or pick another network |
| `wifiAddError` | Device could not add network | Retry; verify SSID spelling |
| `ipconfigFailed` | DHCP/static IP failed on device | Network policy issue; try another SSID |
| `wrongMessage` | Protocol/content rejected | Retry pairing; capture logs |

## Device — Backend (`DeviceError.backend`)

| `BackendFailure.Kind` | Typical cause | Action |
|-----------------------|---------------|--------|
| `unauthorized` | Expired token | Refresh OAuth token, re-init SDK |
| `forbidden` | User cannot assign device | Fix backend permissions / `isDeviceAssigned` |
| `notFound` | Unknown serial | Verify QR / registration |
| `conflict` | Device owned by another user | Unassign in backend or support flow |
| `serverError` | 5xx | Retry with backoff |
| `decodingFailed` | Contract mismatch | Align SDK version with API |

## Device — Provisioning (`DeviceError.provisioning`)

| Case | Typical cause | Action |
|------|---------------|--------|
| `wifiEncryptionFailed` | Backend encrypt API failed | Check network and auth |
| `wifiEncryptionResponseInvalid` | Unexpected encrypt payload | SDK/backend version alignment |
| `confirmRegistrationFailed` | Register device API failed | Backend logs; retry provision |
| `deviceMissingFirmwareInfo` | Session lost device metadata | Re-pair without disconnecting before provision |

## Device — Invalid usage (`DeviceError.invalidUsage`)

| Case | Cause | Action |
|------|-------|--------|
| `provisioningRequiresPairedDevice` | `provisionDevice(.setup)` without pair | Call `initiatePairing` first |
| `wifiSearchRequiresConnection` | Scan without BLE session | Pair/connect before `searchForWiFiNetworks` |

## External devices (`externalDevice`)

Out of scope for public integration guides; handle `deviceNotFound`, `timeout`, and `connectionFailed` with retry and user messaging.
