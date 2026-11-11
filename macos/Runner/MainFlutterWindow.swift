import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  private var hasHiddenAtLaunch = false

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

    super.awakeFromNib()
  }

  override public func order(_ place: NSWindow.OrderingMode, relativeTo otherWin: Int) {
    super.order(place, relativeTo: otherWin)
    if !hasHiddenAtLaunch {
      hasHiddenAtLaunch = true
      setIsVisible(false)
    }
  }
}
