import Foundation
import Security

enum WebPushKeychain {
  private static let service = "flutter_secure_storage_service"
  static let alertKeyPrefix = "web_push_keys_"
  static let voipKeyPrefix = "web_push_voip_keys_"

  struct AccountKey {
    let userId: String
    let privateKey: Data
    let authSecret: Data
  }

  static func accountKeys(prefix: String = alertKeyPrefix) -> [AccountKey] {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service,
      kSecReturnAttributes as String: true,
      kSecReturnData as String: true,
      kSecMatchLimit as String: kSecMatchLimitAll,
    ]
    var result: CFTypeRef?
    let status = SecItemCopyMatching(query as CFDictionary, &result)
    guard status == errSecSuccess, let items = result as? [[String: Any]] else {
      return []
    }
    var keys: [AccountKey] = []
    for item in items {
      guard let account = item[kSecAttrAccount as String] as? String,
        account.hasPrefix(prefix),
        let data = item[kSecValueData as String] as? Data
      else {
        continue
      }
      let userId = String(account.dropFirst(prefix.count))
      guard !userId.isEmpty, let parsed = parse(data, userId: userId) else {
        continue
      }
      keys.append(parsed)
    }
    return keys
  }

  private static func parse(_ data: Data, userId: String) -> AccountKey? {
    guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
      let privateKey = json["private_key"] as? String,
      let authSecret = json["auth_secret"] as? String,
      let privateBytes = decodeBase64Url(privateKey),
      let authBytes = decodeBase64Url(authSecret),
      !privateBytes.isEmpty,
      authBytes.count == 16
    else {
      return nil
    }
    return AccountKey(userId: userId, privateKey: privateBytes, authSecret: authBytes)
  }

  static func decodeBase64Url(_ value: String) -> Data? {
    var base = value.replacingOccurrences(of: "-", with: "+").replacingOccurrences(of: "_", with: "/")
    let remainder = base.count % 4
    if remainder > 0 {
      base.append(String(repeating: "=", count: 4 - remainder))
    }
    return Data(base64Encoded: base)
  }
}
