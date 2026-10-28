# SDK diagnostic logging

HigoCore can forward SDK diagnostic logs (BLE flows, HTTP traffic, external devices) to your app so you can store them alongside your own logs.

Device firmware logs are a **separate pipeline**: when ``DeviceManaging/initiatePairing(serialNumber:isDeviceAssigned:isLoggingEnabled:)`` or ``DeviceManaging/searchForWiFiNetworks(isLoggingEnabled:)`` enables device logging, binary logs are written under `Documents/.DeviceLogs/` and uploaded to the backend on disconnect. That path is not covered here.

## Log handler

Register an optional ``SDKLogHandler`` on ``CoreConfiguration`` at initialization.

- When `logHandler` is **nil**, the SDK writes diagnostic entries to OSLog (visible in Xcode and Console.app).
- When `logHandler` is **non-nil**, the SDK delivers structured ``SDKLogEntry`` values **only** to that handler. It does not write the same entries to OSLog, so a host sink that logs through OSLog (or another shared destination) will not see duplicates.

``SDKLogEntry`` and ``SDKLogHandler`` are part of the `HigoCore` module (`import HigoCore` only). No separate logging package is required for binary SPM installs.

```swift
import HigoCore

#if !PRODUCTION
// Assigning a handler replaces OSLog. Persist or print entries here; the SDK will not also write them.
let logHandler: SDKLogHandler? = { entry in
    let prefix = "[\(entry.subsystem)/\(entry.category)]"
    switch entry.level {
    case .debug:
        appLogger.debug("\(prefix) \(entry.message)")
    case .info:
        appLogger.info("\(prefix) \(entry.message)")
    case .warning, .error:
        appLogger.error("\(prefix) \(entry.message)")
    }
}
#else
let logHandler: SDKLogHandler? = nil
#endif

try HigoCoreSDK.initialize(
    configuration: CoreConfiguration(
        serverInfo: serverInfo,
        authCredentials: authCredentials,
        isLoggingEnabled: logHandler != nil,
        logHandler: logHandler
    )
)
```

Call ``HigoCoreSDK/deinitialize()`` on logout; this clears the handler so later SDK logs are not forwarded to the host and go to OSLog instead (until the next ``HigoCoreSDK/initialize(configuration:)``).

## Configuration flags

| Flag | Purpose |
|------|---------|
| ``CoreConfiguration/logHandler`` | Host sink for SDK diagnostic entries (`nil` = OSLog only; non-nil = handler only, no SDK OSLog) |
| ``CoreConfiguration/isLoggingEnabled`` | Verbose HTTP request/response logging inside the SDK |
| ``DeviceManaging`` `isLoggingEnabled` parameter | Device firmware log collection and backend upload (separate concern) |

Align ``CoreConfiguration/isLoggingEnabled`` with your app’s debug/diagnostics feature flag when you want HTTP traces and host log forwarding enabled together.

## Log entry fields

Each ``SDKLogEntry`` includes:

- `level` — `.debug`, `.info`, `.warning`, or `.error`
- `message` — human-readable text
- `subsystem` — module name (for example `HigoBluetooth`, `HigoNetworking`, `ExternalDevicesCore`)
- `category` — area within the module (for example `WiFiProvisioning`, `APIClient`)

## Subsystems and categories

When no handler is configured, filter in Console.app by subsystem. When a handler is configured, the SDK does not write to OSLog; prefix host log lines with `[subsystem/category]` as in the example above so you can still filter in your own sink.

| Subsystem | Typical categories |
|-----------|-------------------|
| `HigoCore` | `SDK`, `DeviceManager`, `VisitManager`, `ExternalDeviceManager` |
| `HigoBluetooth` | `BluetoothClient`, `BluetoothDelegate`, `HigoPacket`, `WiFiProvisioning`, `Pairing` |
| `HigoNetworking` | `APIClient` |
| `ExternalDevicesCore` | `Session`, `Bluetooth`, `Commands`, `Peripheral` |

Network logs redact sensitive HTTP headers (`Authorization`, `Proxy-Authorization`, `Cookie`, `Set-Cookie`), omit request/response body contents (byte count only), and strip URL query strings — including from `URLError` failing URLs.

The `HigoCore` subsystem emits lifecycle and manager-level logs (SDK init/deinit, visit operations, device manager errors, external device connect/disconnect).

## Related guides

- [Getting started](getting-started.md)
- [Troubleshooting](../troubleshooting/README.md)
