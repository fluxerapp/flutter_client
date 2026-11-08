import DeclaredAgeRange
import Flutter
import UIKit

final class DeclaredAgeRangeBridge {
  static let shared = DeclaredAgeRangeBridge()

  private var channel: FlutterMethodChannel?

  func register(messenger: FlutterBinaryMessenger) {
    if channel != nil {
      return
    }
    let channel = FlutterMethodChannel(
      name: "fluxer_app/declared_age_range",
      binaryMessenger: messenger
    )
    channel.setMethodCallHandler { call, result in
      switch call.method {
      case "requirement":
        Task { @MainActor in
          result(await Self.requirement())
        }
      case "request":
        Task { @MainActor in
          result(await Self.request())
        }
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    self.channel = channel
  }

  @MainActor
  private static func requirement() async -> [String: Bool] {
    guard #available(iOS 26.2, *) else {
      return ["available": false, "required": false]
    }
    return ["available": true, "required": await isRequired()]
  }

  @available(iOS 26.2, *)
  @MainActor
  private static func isRequired() async -> Bool {
    do {
      if #available(iOS 26.4, *) {
        return try await AgeRangeService.shared.requiredRegulatoryFeatures
          .contains(.declaredAgeRangeRequired)
      }
      return try await AgeRangeService.shared.isEligibleForAgeFeatures
    } catch {
      return false
    }
  }

  @MainActor
  private static func request() async -> [String: Any] {
    guard #available(iOS 26.2, *) else {
      return ["status": "unavailable"]
    }
    do {
      guard let presenter = topViewController() else {
        return ["status": "unavailable"]
      }
      let response = try await AgeRangeService.shared.requestAgeRange(
        ageGates: 13, 16, 18,
        in: presenter
      )
      switch response {
      case .sharing(let range):
        var payload: [String: Any] = ["status": "sharing"]
        if let lower = range.lowerBound {
          payload["lowerBound"] = lower
        }
        if let upper = range.upperBound {
          payload["upperBound"] = upper
        }
        return payload
      case .declinedSharing:
        return ["status": "declined"]
      @unknown default:
        return ["status": "unavailable"]
      }
    } catch {
      return ["status": "unavailable"]
    }
  }

  @MainActor
  private static func topViewController() -> UIViewController? {
    let window = UIApplication.shared.connectedScenes
      .compactMap { ($0 as? UIWindowScene)?.keyWindow }
      .first
    var controller = window?.rootViewController
    while let presented = controller?.presentedViewController {
      controller = presented
    }
    return controller
  }
}
