# Wi‑Fi provisioning

Send Wi‑Fi credentials to the device over BLE. Pairing and scan order are covered in [Happy path](happy-path.md).

## Scan networks

Requires an active BLE session after ``DeviceManaging/initiatePairing(serialNumber:isDeviceAssigned:isLoggingEnabled:)`` returns ``PairingResult/paired``.

```swift
let networks: [SSIDInfo] = try await deviceManager.searchForWiFiNetworks(
    isLoggingEnabled: false
)
for network in networks {
    print(network.ssid)
}
```

The list is produced by the device firmware. The SDK deduplicates SSID names but does not filter by Wi‑Fi channel.

## Provision

Call after the user selects an SSID and password (typically in a separate step from the scan):

```swift
try await deviceManager.provisionDevice(
    serialNumber: serialNumber,
    ssid: selectedSSID,
    password: wifiPassword,
    mode: .setup  // or .wifiUpdate
)
```

| Mode | Use when |
|------|----------|
| `.setup` | First-time onboarding after pairing |
| `.wifiUpdate` | Device already provisioned; only changing Wi‑Fi |

## Related

- [Happy path](happy-path.md) — typical pairing → scan → user selection → provision flow
- [Pairing without device Wi‑Fi scan](pairing-without-wifi-scan.md) — skip scan when SSID is known
