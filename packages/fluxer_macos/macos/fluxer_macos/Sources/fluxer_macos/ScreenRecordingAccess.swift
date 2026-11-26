import CoreGraphics
import Foundation
import ScreenCaptureKit

final class ScreenRecordingAccess {
  private static let requestedKey = "fluxer_macos_screen_recording_requested"
  private static let probeTimeout: TimeInterval = 3

  private let queue = DispatchQueue(label: "fluxer_macos.screen_recording")
  private var liveGranted = false
  private var probeWaiters: [() -> Void]?

  func status(liveProbe: Bool, completion: @escaping (MacPermissionStatus) -> Void) {
    queue.async {
      guard liveProbe else {
        completion(self.currentStatus())
        return
      }
      self.refreshLiveGrant {
        completion(self.currentStatus())
      }
    }
  }

  func request(completion: @escaping (MacPermissionStatus) -> Void) {
    queue.async {
      let granted = CGRequestScreenCaptureAccess()
      UserDefaults.standard.set(true, forKey: Self.requestedKey)
      completion(granted ? .granted : self.currentStatus())
    }
  }

  private var hasRequested: Bool {
    UserDefaults.standard.bool(forKey: Self.requestedKey)
  }

  private func currentStatus() -> MacPermissionStatus {
    if CGPreflightScreenCaptureAccess() || liveGranted {
      return .granted
    }
    return hasRequested ? .denied : .notDetermined
  }

  private func refreshLiveGrant(completion: @escaping () -> Void) {
    if CGPreflightScreenCaptureAccess() || !hasRequested {
      liveGranted = false
      completion()
      return
    }
    if probeWaiters != nil {
      probeWaiters?.append(completion)
      return
    }
    guard #available(macOS 12.3, *) else {
      completion()
      return
    }
    probeWaiters = [completion]
    var settled = false
    let settle: (Bool?) -> Void = { outcome in
      self.queue.async {
        guard !settled else {
          return
        }
        settled = true
        if let outcome {
          self.liveGranted = outcome
        }
        let waiters = self.probeWaiters ?? []
        self.probeWaiters = nil
        waiters.forEach { $0() }
      }
    }
    SCShareableContent.getExcludingDesktopWindows(false, onScreenWindowsOnly: true) {
      content, _ in
      settle(content != nil)
    }
    queue.asyncAfter(deadline: .now() + Self.probeTimeout) {
      settle(nil)
    }
  }
}
