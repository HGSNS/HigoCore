# Wi‑Fi provisioning

After pairing (``.paired``), fetch networks visible to the **device** and send credentials over BLE.

## Scan networks

```swift
let networks: [SSIDInfo] = try await deviceManager.searchForWiFiNetworks(
    isLoggingEnabled: true
)
for network in networks {
    print(network.ssid, network.signalStrength)
}
```

The list is produced by the device firmware. The SDK deduplicates SSID names but does not filter by Wi‑Fi channel.

## Provision

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

## Ordering

1. `initiatePairing` → `.paired`
2. `searchForWiFiNetworks` (optional if SSID is known—see [pairing without scan](pairing-without-wifi-scan.md))
3. `provisionDevice`

Do not call ``DeviceManaging/disconnect()`` between steps unless the user cancels the flow.

## Disconnect

``DeviceManaging/disconnect()`` ends the BLE session and does not throw. Use when leaving the device setup screen or on cancellation.
