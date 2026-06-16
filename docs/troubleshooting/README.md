# Troubleshooting

Field issues and integration pitfalls for Higo Core device flows. For error codes see [errors/README.md](../errors/README.md).

## Device shows “continue in the mobile app” but SDK returns scan/connection errors

**Symptoms:** Device UI indicates an active session; SDK throws ``HigoSDKError/DeviceError`` with ``HigoSDKError/BLEFailure/scanTimeout`` or ``HigoSDKError/BLEFailure/notConnected`` on `initiatePairing`, `connectToDevice`, or a later step.

**Likely causes:**

- BLE session was dropped between pairing and Wi‑Fi steps (app called ``DeviceManaging/disconnect()``, backgrounded, or started another BLE stack).
- Scan timeout: serial number mismatch or device not advertising the expected local name.
- Another phone/app still connected to the device.

**Resolution:**

1. Run pairing → Wi‑Fi scan → provision in one continuous UI flow without disconnecting.
2. Verify serial number matches the device label/QR.
3. Power-cycle the device and retry with only one app connected.
4. Use ``HigoSDKError/BLEFailure/code`` logging to distinguish `scanTimeout` vs `notConnected`.

## Pairing fails with backend/forbidden errors

**Symptoms:** ``HigoSDKError/DeviceError/backend`` with ``HigoSDKError/BackendFailure/Kind/forbidden`` or `unauthorized` during `initiatePairing`.

**Likely causes:**

- Access token expired.
- Device assigned to another user (`isDeviceAssigned` does not match backend state).
- OAuth client credentials incorrect in ``CoreConfiguration``.

**Resolution:**

1. Refresh tokens before calling `initialize`.
2. Align `isDeviceAssigned` with your backend assignment API.
3. Confirm `ServerInfo` host and client credentials for the target environment.

## Provisioning fails after successful pairing

**Symptoms:** Pairing succeeds; `searchForWiFiNetworks` or `provisionDevice` fails with ``notConnected``, ``wifiScanFailed``, or provisioning errors.

**Likely causes:**

- Disconnect or navigation between screens tore down the BLE session.
- ``InvalidUsage/provisioningRequiresPairedDevice`` when calling `.setup` without a paired session.
- Wrong Wi‑Fi password (`ackRejected(.wifiWrongPSK)`).

**Resolution:**

1. Do not call ``disconnect()`` between pairing and provisioning.
2. For known SSID/password, skip scan per [pairing without Wi‑Fi scan](../integration/pairing-without-wifi-scan.md).
3. Surface ACK rejection cases to the user with actionable copy (wrong password vs network not in range).

## Wi‑Fi list missing some networks

**Symptoms:** User sees fewer SSIDs than expected; networks on the same channel as an listed SSID may be absent.

**Likely causes:**

- List reflects what **device firmware** reported, not the phone’s Wi‑Fi scan.
- SDK deduplicates identical SSID names only (no channel filtering).
- Stale cache if a spontaneous Wi‑Fi push arrived before subscribing to scan results (addressed in recent SDK versions).

**Resolution:**

1. Retry `searchForWiFiNetworks` with BLE session active.
2. Allow manual SSID entry via [pairing without scan](../integration/pairing-without-wifi-scan.md).
3. Escalate to firmware if a network is never reported despite being visible to the device.

## `deviceAlreadyProvisioned` during onboarding

**Symptoms:** `initiatePairing` returns `.deviceAlreadyProvisioned`.

**Meaning:** Device already has Wi‑Fi; full setup is not required.

**Resolution:** Skip scan/setup or use ``ProvisioningMode/wifiUpdate`` to change networks only.

## SDK not initialized errors

**Symptoms:** ``HigoSDKError/notInitialized`` when accessing managers.

**Resolution:** Call ``HigoCoreSDK/initialize(configuration:)`` after authentication; use ``deinitialize()`` only on logout.

## Debugging checklist

| Check | Pass criteria |
|-------|----------------|
| Physical device | Not simulator for BLE |
| Bluetooth permission | `NSBluetoothAlwaysUsageDescription` present |
| Single BLE owner | No parallel connection apps |
| Session continuity | No `disconnect` between pair and provision |
| Token freshness | Backend calls succeed before device flows |
| SDK version | Matches release notes for Wi‑Fi cache fixes |
