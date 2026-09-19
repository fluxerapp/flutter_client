import Foundation

enum AssistantDefaults {
  static let suiteName = "group.com.fluxer"

  static var store: UserDefaults {
    UserDefaults(suiteName: suiteName) ?? .standard
  }

  static func dictionary(forKey key: String) -> [String: Any]? {
    if let payload = store.dictionary(forKey: key) {
      return payload
    }
    guard let payload = UserDefaults.standard.dictionary(forKey: key) else {
      return nil
    }
    store.set(payload, forKey: key)
    return payload
  }

  static func set(_ payload: [String: Any], forKey key: String) {
    store.set(payload, forKey: key)
    UserDefaults.standard.set(payload, forKey: key)
  }

  static func remove(forKey key: String) {
    store.removeObject(forKey: key)
    UserDefaults.standard.removeObject(forKey: key)
  }
}
