import CoreGraphics
import Foundation
import IOKit.hid

enum InputMonitoringAccess {
  private static let lock = NSLock()
  private static var requested = false

  static func status() -> MacPermissionStatus {
    let access = IOHIDCheckAccess(kIOHIDRequestTypeListenEvent)
    if access == kIOHIDAccessTypeUnknown && !lock.withLock({ requested }) {
      return .notDetermined
    }
    return canCreateListenOnlyTap() ? .granted : .denied
  }

  static func request() -> MacPermissionStatus {
    let granted = IOHIDRequestAccess(kIOHIDRequestTypeListenEvent)
    lock.withLock {
      requested = true
    }
    return granted ? .granted : status()
  }

  private static func canCreateListenOnlyTap() -> Bool {
    let tap = CGEvent.tapCreate(
      tap: .cgSessionEventTap,
      place: .tailAppendEventTap,
      options: .listenOnly,
      eventsOfInterest: CGEventMask(1) << CGEventType.keyDown.rawValue,
      callback: { _, _, event, _ in Unmanaged.passUnretained(event) },
      userInfo: nil
    )
    guard let tap else {
      return false
    }
    CFMachPortInvalidate(tap)
    return true
  }
}
