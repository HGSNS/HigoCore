# Pairing

Pairing establishes a BLE session with the Higo device and exchanges broker configuration from your backend.

## API

```swift
let result = try await deviceManager.initiatePairing(
    serialNumber: serialNumber,
    isDeviceAssigned: isDeviceAssigned,
    isLoggingEnabled: isLoggingEnabled
)
```

- **serialNumber** — From QR code or manual entry; must match the device advertisement local name.
- **isDeviceAssigned** — Pass `true` when the device is already assigned to the current user in your backend; `false` when the SDK should perform assignment as part of pairing.
- **isLoggingEnabled** — When `true`, the SDK may enable device log collection for supported firmware.

## Results

| `PairingResult` | Meaning |
|-----------------|--------|
| `.paired` | Device paired; proceed to Wi‑Fi scan/provision |
| `.deviceAlreadyProvisioned` | Device already has Wi‑Fi; pairing completed without needing setup |

## Connect without full pairing

For an already-known device where you only need a BLE session (no broker exchange), use:

```swift
let connection = try await deviceManager.connectToDevice(serialNumber: serialNumber)
```

Inspect ``ConnectionResult`` for whether the device is paired or provisioned.

## Session continuity

Pairing holds an active BLE connection inside the SDK. Starting unrelated BLE operations or disconnecting before provisioning commonly causes later steps to fail. Run Wi‑Fi scan and provision in the same UI flow without releasing the session.

## Unpair

```swift
try await deviceManager.unpairDevice(serialNumber: serialNumber)
```
