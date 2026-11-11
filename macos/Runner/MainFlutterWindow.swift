import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  private var hasHiddenAtLaunch = false
  private var hideAfterFullScreenExit = false

  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    self.titlebarAppearsTransparent = true
    self.titleVisibility = .hidden
    self.styleMask.insert(.fullSizeContentView)
    self.tabbingMode = .disallowed

    RegisterGeneratedPlugins(registry: flutterViewController)

    NotificationCenter.default.addObserver(
      self,
      selector: #selector(didExitFullScreen(_:)),
      name: NSWindow.didExitFullScreenNotification,
      object: self
    )

    super.awakeFromNib()
    routeCloseButton()
  }

  override public func order(_ place: NSWindow.OrderingMode, relativeTo otherWin: Int) {
    super.order(place, relativeTo: otherWin)
    routeCloseButton()
    if !hasHiddenAtLaunch {
      hasHiddenAtLaunch = true
      setIsVisible(false)
    }
  }

  override func becomeKey() {
    super.becomeKey()
    routeCloseButton()
  }

  override func performClose(_ sender: Any?) {
    handleCloseRequest()
  }

  @objc private func closeButtonPressed(_ sender: Any?) {
    handleCloseRequest()
  }

  private var closeKeepsAppRunning: Bool {
    let defaults = UserDefaults.standard
    let showTrayIcon = defaults.object(forKey: "flutter.desktop_show_tray_icon") as? Bool ?? true
    let closeToTray = defaults.object(forKey: "flutter.desktop_close_to_tray") as? Bool ?? true
    return showTrayIcon && closeToTray
  }

  private func handleCloseRequest() {
    if closeKeepsAppRunning {
      hideKeepingAppRunning()
    } else {
      NSApp.terminate(nil)
    }
  }

  @objc private func didExitFullScreen(_ notification: Notification) {
    guard hideAfterFullScreenExit else {
      return
    }
    hideAfterFullScreenExit = false
    orderOut(nil)
  }

  private func hideKeepingAppRunning() {
    if styleMask.contains(.fullScreen) {
      hideAfterFullScreenExit = true
      toggleFullScreen(nil)
      return
    }
    orderOut(nil)
  }

  private func routeCloseButton() {
    guard let closeButton = standardWindowButton(.closeButton) else {
      return
    }
    closeButton.target = self
    closeButton.action = #selector(closeButtonPressed(_:))
  }
}
