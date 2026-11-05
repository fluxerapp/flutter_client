import Foundation

enum NativeStrings {
  static func text(_ key: String, _ english: String) -> String {
    let value = appBundle.localizedString(forKey: key, value: english, table: nil)
    if value.isEmpty || value == key {
      return english
    }
    return value
  }

  static func format(_ key: String, _ english: String, _ arguments: CVarArg...) -> String {
    String(format: text(key, english), locale: Locale.current, arguments: arguments)
  }

  private static let appBundle: Bundle = {
    let url = Bundle.main.bundleURL
    guard url.pathExtension == "appex" else {
      return .main
    }
    return Bundle(url: url.deletingLastPathComponent().deletingLastPathComponent()) ?? .main
  }()
}
