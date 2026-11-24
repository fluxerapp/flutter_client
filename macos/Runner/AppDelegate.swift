import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  static var launchedAtLogin = false

  override init() {
    super.init()
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(captureLaunchEvent(_:)),
      name: NSApplication.willFinishLaunchingNotification,
      object: nil
    )
  }

  @objc private func captureLaunchEvent(_ notification: Notification) {
    guard let event = NSAppleEventManager.shared().currentAppleEvent,
      event.eventID == kAEOpenApplication,
      event.paramDescriptor(forKeyword: keyAEPropData)?.enumCodeValue
        == keyAELaunchedAsLogInItem
    else {
      return
    }
    AppDelegate.launchedAtLogin = true
  }

  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return false
  }

  override func applicationShouldHandleReopen(
    _ sender: NSApplication,
    hasVisibleWindows flag: Bool
  ) -> Bool {
    if !flag {
      for window in NSApp.windows {
        if !window.isVisible {
          window.setIsVisible(true)
        }
        window.makeKeyAndOrderFront(self)
        NSApp.activate(ignoringOtherApps: true)
      }
    }
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
}
