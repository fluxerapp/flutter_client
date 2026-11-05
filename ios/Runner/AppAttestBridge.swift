import DeviceCheck
import Flutter

final class AppAttestBridge {
  static let shared = AppAttestBridge()

  private var channel: FlutterMethodChannel?

  func register(messenger: FlutterBinaryMessenger) {
    if channel != nil {
      return
    }
    let channel = FlutterMethodChannel(
      name: "fluxer_app/app_attest",
      binaryMessenger: messenger
    )
    channel.setMethodCallHandler { call, result in
      Self.handle(call, result: result)
    }
    self.channel = channel
  }

  private static func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let service = DCAppAttestService.shared
    switch call.method {
    case "isSupported":
      result(service.isSupported)
    case "generateKey":
      Task { @MainActor in
        do {
          result(try await service.generateKey())
        } catch {
          result(flutterError(error))
        }
      }
    case "attestKey", "generateAssertion":
      guard
        let arguments = call.arguments as? [String: Any],
        let keyId = arguments["keyId"] as? String,
        let hash = arguments["clientDataHash"] as? FlutterStandardTypedData
      else {
        result(FlutterError(code: "invalidInput", message: nil, details: nil))
        return
      }
      let attest = call.method == "attestKey"
      Task { @MainActor in
        do {
          let data =
            attest
            ? try await service.attestKey(keyId, clientDataHash: hash.data)
            : try await service.generateAssertion(keyId, clientDataHash: hash.data)
          result(FlutterStandardTypedData(bytes: data))
        } catch {
          result(flutterError(error))
        }
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private static func flutterError(_ error: Error) -> FlutterError {
    guard let error = error as? DCError else {
      return FlutterError(code: "unknownSystemFailure", message: nil, details: nil)
    }
    let code: String
    switch error.code {
    case .featureUnsupported:
      code = "featureUnsupported"
    case .invalidInput:
      code = "invalidInput"
    case .invalidKey:
      code = "invalidKey"
    case .serverUnavailable:
      code = "serverUnavailable"
    default:
      code = "unknownSystemFailure"
    }
    return FlutterError(code: code, message: nil, details: nil)
  }
}
