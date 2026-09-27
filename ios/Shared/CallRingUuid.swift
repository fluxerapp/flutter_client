import CryptoKit
import Foundation

enum CallRingUuid {
  static let namespace = "8c1a0e4a-6b2d-5f7e-9a10-0b1c2d3e4f50"

  static func v5(name: String) -> UUID {
    let hex = namespace.replacingOccurrences(of: "-", with: "")
    var namespaceBytes = [UInt8]()
    namespaceBytes.reserveCapacity(16)
    var index = hex.startIndex
    while index < hex.endIndex, namespaceBytes.count < 16 {
      let next = hex.index(index, offsetBy: 2, limitedBy: hex.endIndex) ?? hex.endIndex
      guard let byte = UInt8(hex[index..<next], radix: 16) else {
        break
      }
      namespaceBytes.append(byte)
      index = next
    }
    var material = Data(namespaceBytes)
    material.append(Data(name.utf8))
    let digest = Array(Insecure.SHA1.hash(data: material).prefix(16))
    var bytes = digest
    bytes[6] = (bytes[6] & 0x0f) | 0x50
    bytes[8] = (bytes[8] & 0x3f) | 0x80
    return UUID(uuid: (
      bytes[0], bytes[1], bytes[2], bytes[3],
      bytes[4], bytes[5], bytes[6], bytes[7],
      bytes[8], bytes[9], bytes[10], bytes[11],
      bytes[12], bytes[13], bytes[14], bytes[15]
    ))
  }
}
