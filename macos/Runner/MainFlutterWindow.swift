import Cocoa
import FlutterMacOS
import ServiceManagement

class MainFlutterWindow: NSWindow {
  private var hasHiddenAtLaunch = false
  private var hideAfterFullScreenExit = false
  private var platformChannel: FlutterMethodChannel?

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
    registerPlatformChannel(flutterViewController)

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

  private func registerPlatformChannel(_ controller: FlutterViewController) {
    let channel = FlutterMethodChannel(
      name: "fluxer_app/desktop_platform",
      binaryMessenger: controller.engine.binaryMessenger
    )
    channel.setMethodCallHandler { call, result in
      switch call.method {
      case "wasLaunchedAtLogin":
        result(AppDelegate.launchedAtLogin)
      case "autostartIsEnabled":
        if #available(macOS 13.0, *) {
          result(SMAppService.mainApp.status == .enabled)
        } else {
          result(false)
        }
      case "autostartSetEnabled":
        let arguments = call.arguments as? [String: Any]
        let enabled = arguments?["enabled"] as? Bool ?? false
        guard #available(macOS 13.0, *) else {
          result(nil)
          return
        }
        do {
          if enabled {
            try SMAppService.mainApp.register()
          } else {
            try SMAppService.mainApp.unregister()
          }
          result(nil)
        } catch {
          result(
            FlutterError(
              code: "autostart_failed",
              message: error.localizedDescription,
              details: nil
            )
          )
        }
      case "setDockBadge":
        let arguments = call.arguments as? [String: Any]
        let label = arguments?["label"] as? String
        NSApp.dockTile.badgeLabel = label
        result(nil)
      case "revealFile":
        let arguments = call.arguments as? [String: Any]
        guard let path = arguments?["path"] as? String else {
          result(
            FlutterError(code: "reveal_failed", message: "Missing path", details: nil)
          )
          return
        }
        NSWorkspace.shared.activateFileViewerSelecting([URL(fileURLWithPath: path)])
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    platformChannel = channel
  }
}
