import CryptoKit
import Foundation

enum WebPushRecordDecryptor {
  private static let recordSize = 2816
  private static let publicKeyLength = 65
  private static let headerLength = 16 + 4 + 1 + publicKeyLength
  private static let tagLength = 16

  static func resolvedUserInfo(_ userInfo: [AnyHashable: Any]) -> [AnyHashable: Any] {
    guard let encoded = userInfo["p"] as? String,
      encoded.count <= 4096,
      let record = WebPushKeychain.decodeBase64Url(encoded),
      let decrypted = decrypt(record: record)
    else {
      return userInfo
    }
    guard let data = decrypted.plaintext.data(using: .utf8),
      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    else {
      return userInfo
    }
    var merged = merge(json: json, into: userInfo)
    if !hasText(merged["target_user_id"]) {
      merged["target_user_id"] = decrypted.userId
    }
    return merged
  }

  static func decryptVoip(record: Data) -> (plaintext: String, userId: String)? {
    if let decrypted = decrypt(record: record, prefix: WebPushKeychain.voipKeyPrefix) {
      return decrypted
    }
    return decrypt(record: record, prefix: WebPushKeychain.alertKeyPrefix)
  }

  static func decrypt(record: Data) -> (plaintext: String, userId: String)? {
    return decrypt(record: record, prefix: WebPushKeychain.alertKeyPrefix)
  }

  private static func decrypt(
    record: Data,
    prefix: String
  ) -> (plaintext: String, userId: String)? {
    for account in WebPushKeychain.accountKeys(prefix: prefix) {
      if let plaintext = decrypt(
        record: record,
        privateKey: account.privateKey,
        authSecret: account.authSecret
      ) {
        return (plaintext, account.userId)
      }
    }
    return nil
  }

  static func decrypt(record: Data, privateKey: Data, authSecret: Data) -> String? {
    guard privateKey.count == 32, authSecret.count == 16 else {
      return nil
    }
    guard record.count <= recordSize,
      record.count >= headerLength + tagLength,
      record[20] == UInt8(publicKeyLength)
    else {
      return nil
    }
    let salt = record.subdata(in: 0..<16)
    let ephemeral = record.subdata(in: 21..<(21 + publicKeyLength))
    guard ephemeral.first == 0x04 else {
      return nil
    }
    let cipherStart = 21 + publicKeyLength
    guard record.count >= cipherStart + tagLength else {
      return nil
    }
    let cipherText = record.subdata(in: cipherStart..<(record.count - tagLength))
    let tag = record.subdata(in: (record.count - tagLength)..<record.count)
    do {
      let local = try P256.KeyAgreement.PrivateKey(rawRepresentation: privateKey)
      let remote = try P256.KeyAgreement.PublicKey(x963Representation: ephemeral)
      let shared = try local.sharedSecretFromKeyAgreement(with: remote)
      let recipientPublic = local.publicKey.x963Representation
      let info = webPushInfo(recipient: recipientPublic, ephemeral: ephemeral)
      let ikm = shared.hkdfDerivedSymmetricKey(
        using: SHA256.self,
        salt: authSecret,
        sharedInfo: info,
        outputByteCount: 32
      )
      let cek = HKDF<SHA256>.deriveKey(
        inputKeyMaterial: ikm,
        salt: salt,
        info: infoBytes("Content-Encoding: aes128gcm"),
        outputByteCount: 16
      )
      let nonceKey = HKDF<SHA256>.deriveKey(
        inputKeyMaterial: ikm,
        salt: salt,
        info: infoBytes("Content-Encoding: nonce"),
        outputByteCount: 12
      )
      let nonceData = nonceKey.withUnsafeBytes { Data($0) }
      let cekData = cek.withUnsafeBytes { Data($0) }
      let box = try AES.GCM.SealedBox(
        nonce: AES.GCM.Nonce(data: nonceData),
        ciphertext: cipherText,
        tag: tag
      )
      let clear = try AES.GCM.open(box, using: SymmetricKey(data: cekData))
      return unpad(clear)
    } catch {
      return nil
    }
  }

  private static func webPushInfo(recipient: Data, ephemeral: Data) -> Data {
    var info = infoBytes("WebPush: info")
    info.append(recipient)
    info.append(ephemeral)
    return info
  }

  private static func infoBytes(_ value: String) -> Data {
    var data = Data(value.utf8)
    data.append(0)
    return data
  }

  private static func unpad(_ clear: Data) -> String? {
    var end = clear.count
    while end > 0 && clear[end - 1] == 0 {
      end -= 1
    }
    guard end > 0, clear[end - 1] == 0x02 else {
      return nil
    }
    return String(data: clear.subdata(in: 0..<(end - 1)), encoding: .utf8)
  }

  private static func merge(json: [String: Any], into userInfo: [AnyHashable: Any]) -> [AnyHashable: Any] {
    var result = userInfo
    copyStrings(from: json, into: &result)
    if let notification = json["notification"] as? [String: Any] {
      if let title = notification["title"] as? String {
        result["title"] = title
      }
      if let body = notification["body"] as? String {
        result["body"] = body
      }
      if let navigate = notification["navigate"] as? String {
        result["url"] = navigate
      }
      if let nested = notification["data"] as? [String: Any] {
        copyStrings(from: nested, into: &result)
      }
    }
    if let nested = json["data"] as? [String: Any] {
      copyStrings(from: nested, into: &result)
      result["data"] = nested
    }
    return result
  }

  private static func hasText(_ value: Any?) -> Bool {
    guard let text = value as? String else {
      return false
    }
    return !text.isEmpty
  }

  private static func copyStrings(from source: [String: Any], into result: inout [AnyHashable: Any]) {
    for (key, value) in source {
      if key == "notification" || key == "aps" || key == "data" {
        continue
      }
      if let text = value as? String, !text.isEmpty {
        result[key] = text
      } else if let number = value as? NSNumber {
        if CFGetTypeID(number) == CFBooleanGetTypeID() {
          result[key] = number.boolValue ? "true" : "false"
        } else {
          result[key] = number.stringValue
        }
      }
    }
  }
}
