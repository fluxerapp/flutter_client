import Foundation

/// Fluxer snowflake layout: timestamp ms since 2015-01-01 UTC in the high bits (>> 22).
enum SnowflakeTime {
  static let epochMs: Int64 = 1_420_070_400_000

  static func timestampMs(from id: String) -> Int64? {
    let trimmed = id.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty, let snowflake = UInt64(trimmed) else {
      return nil
    }
    let sentMs = Int64(snowflake >> 22) + epochMs
    guard sentMs >= epochMs else {
      return nil
    }
    return sentMs
  }

  static func date(from id: String) -> Date? {
    guard let sentMs = timestampMs(from: id) else {
      return nil
    }
    return Date(timeIntervalSince1970: TimeInterval(sentMs) / 1000)
  }
}
