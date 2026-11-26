import AVFoundation
import AppKit
import Foundation

final class MacPermissions: MacPermissionsHostApi {
  private let screenRecording = ScreenRecordingAccess()
  private let inputMonitoringQueue = DispatchQueue(label: "fluxer_macos.input_monitoring")

  func status(
    kind: MacPermissionKind,
    liveProbe: Bool,
    completion: @escaping (Result<MacPermissionStatus, Error>) -> Void
  ) {
    switch kind {
    case .microphone:
      completion(.success(mediaStatus(.audio)))
    case .camera:
      completion(.success(mediaStatus(.video)))
    case .screen:
      screenRecording.status(liveProbe: liveProbe) { Self.reply($0, to: completion) }
    case .inputMonitoring:
      inputMonitoringQueue.async {
        Self.reply(InputMonitoringAccess.status(), to: completion)
      }
    }
  }

  func request(
    kind: MacPermissionKind,
    completion: @escaping (Result<MacPermissionStatus, Error>) -> Void
  ) {
    switch kind {
    case .microphone:
      requestMedia(.audio, completion: completion)
    case .camera:
      requestMedia(.video, completion: completion)
    case .screen:
      screenRecording.request { Self.reply($0, to: completion) }
    case .inputMonitoring:
      inputMonitoringQueue.async {
        Self.reply(InputMonitoringAccess.request(), to: completion)
      }
    }
  }

  func openSettings(pane: MacPrivacyPane) throws {
    let anchor: String
    switch pane {
    case .microphone:
      anchor = "Privacy_Microphone"
    case .camera:
      anchor = "Privacy_Camera"
    case .screen:
      anchor = "Privacy_ScreenCapture"
    case .inputMonitoring:
      anchor = "Privacy_ListenEvent"
    case .photos:
      anchor = "Privacy_Photos"
    }
    let address = "x-apple.systempreferences:com.apple.preference.security?\(anchor)"
    guard let url = URL(string: address) else {
      return
    }
    NSWorkspace.shared.open(url)
  }

  private func mediaStatus(_ mediaType: AVMediaType) -> MacPermissionStatus {
    switch AVCaptureDevice.authorizationStatus(for: mediaType) {
    case .authorized:
      return .granted
    case .denied, .restricted:
      return .denied
    case .notDetermined:
      return .notDetermined
    @unknown default:
      return .notDetermined
    }
  }

  private func requestMedia(
    _ mediaType: AVMediaType,
    completion: @escaping (Result<MacPermissionStatus, Error>) -> Void
  ) {
    AVCaptureDevice.requestAccess(for: mediaType) { granted in
      Self.reply(granted ? .granted : .denied, to: completion)
    }
  }

  private static func reply(
    _ status: MacPermissionStatus,
    to completion: @escaping (Result<MacPermissionStatus, Error>) -> Void
  ) {
    DispatchQueue.main.async {
      completion(.success(status))
    }
  }
}
