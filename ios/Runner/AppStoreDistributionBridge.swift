import Flutter
import StoreKit

final class AppStoreDistributionBridge {
  static let shared = AppStoreDistributionBridge()

  private var channel: FlutterMethodChannel?
  private var resolution: Task<String, Never>?

  func register(messenger: FlutterBinaryMessenger) {
    if channel != nil {
      return
    }
    let channel = FlutterMethodChannel(
      name: "fluxer_app/app_store_distribution",
      binaryMessenger: messenger
    )
    channel.setMethodCallHandler { [weak self] call, result in
      switch call.method {
      case "distribution":
        self?.distribution(result: result)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    self.channel = channel
  }

  private func distribution(result: @escaping FlutterResult) {
    let resolution = self.resolution ?? Task { await Self.resolve() }
    self.resolution = resolution
    Task { @MainActor in
      result(await resolution.value)
    }
  }

  private static func resolve() async -> String {
    do {
      guard case .verified(let transaction) = try await AppTransaction.shared else {
        return receiptDistribution()
      }
      switch transaction.environment {
      case .production:
        return "production"
      case .sandbox:
        return "testflight"
      case .xcode:
        return "development"
      default:
        return receiptDistribution()
      }
    } catch {
      return receiptDistribution()
    }
  }

  private static func receiptDistribution() -> String {
    #if targetEnvironment(simulator)
      return "development"
    #else
      guard let receipt = Bundle.main.appStoreReceiptURL else {
        return "unknown"
      }
      if receipt.lastPathComponent == "sandboxReceipt" {
        return "testflight"
      }
      return "production"
    #endif
  }
}
