

import Foundation

struct NotificationEmojiDecodeResult {
  let body: String
  let imageUrls: [URL]
}

enum NotificationEmojiDecoder {
  private static let emojiThumbnailSize = 96
  private static let customEmojiWirePattern = "<(a?):([a-zA-Z0-9_]+):(\\d+)>"
  private static let skinToneShortcodePattern = ":([a-zA-Z0-9_+\\-]+)::skin-tone-([1-5]):"
  private static let plainShortcodePattern = ":([a-zA-Z0-9_+\\-]+):"

  private static var nameToSurrogate: [String: String]?
  private static var emojiRegistry: [String: [[String: Any]]]?
  private static let registryLock = NSLock()

  static func decode(body: String) -> NotificationEmojiDecodeResult {
    var imageUrls: [URL] = []
    let wireDecoded = replaceCustomEmojiWireTokens(in: body, imageUrls: &imageUrls)
    let shortcodeDecoded = resolveUnicodeShortcodes(in: wireDecoded)
    return NotificationEmojiDecodeResult(body: shortcodeDecoded, imageUrls: imageUrls)
  }

  static func customEmojiImageUrl(id: String) -> URL? {
    guard !id.isEmpty else {
      return nil
    }
    var components = URLComponents()
    components.scheme = "https"
    components.host = "fluxerusercontent.com"
    components.path = "/emojis/\(id).webp"
    components.queryItems = [URLQueryItem(name: "size", value: "\(emojiThumbnailSize)")]
    return components.url
  }

  private static func replaceCustomEmojiWireTokens(
    in body: String,
    imageUrls: inout [URL]
  ) -> String {
    guard let regex = try? NSRegularExpression(pattern: customEmojiWirePattern) else {
      return body
    }
    let nsRange = NSRange(body.startIndex..<body.endIndex, in: body)
    var result = ""
    var lastIndex = body.startIndex
    regex.enumerateMatches(in: body, options: [], range: nsRange) { match, _, _ in
      guard let match, let matchRange = Range(match.range, in: body) else {
        return
      }
      result += body[lastIndex..<matchRange.lowerBound]
      let nameRange = Range(match.range(at: 2), in: body)
      let idRange = Range(match.range(at: 3), in: body)
      guard let nameRange, let idRange else {
        result += body[matchRange]
        lastIndex = matchRange.upperBound
        return
      }
      let name = String(body[nameRange])
      let id = String(body[idRange])
      result += ":\(name):"
      if let url = customEmojiImageUrl(id: id) {
        imageUrls.append(url)
      }
      lastIndex = matchRange.upperBound
    }
    result += body[lastIndex...]
    return result
  }

  private static func resolveUnicodeShortcodes(in body: String) -> String {
    let skinToneResolved = replaceShortcodes(
      in: body,
      pattern: skinToneShortcodePattern
    ) { name, tone in
      resolveSkinToneSurrogate(name: name, tone: tone) ?? ":\(name)::skin-tone-\(tone):"
    }
    return replaceShortcodes(in: skinToneResolved, pattern: plainShortcodePattern) { name, _ in
      resolveSurrogate(forName: name) ?? ":\(name):"
    }
  }

  private static func replaceShortcodes(
    in body: String,
    pattern: String,
    resolve: (String, String) -> String
  ) -> String {
    guard let regex = try? NSRegularExpression(pattern: pattern) else {
      return body
    }
    let nsRange = NSRange(body.startIndex..<body.endIndex, in: body)
    var result = ""
    var lastIndex = body.startIndex
    regex.enumerateMatches(in: body, options: [], range: nsRange) { match, _, _ in
      guard let match, let matchRange = Range(match.range, in: body) else {
        return
      }
      result += body[lastIndex..<matchRange.lowerBound]
      let nameRange = Range(match.range(at: 1), in: body)
      let toneRange = match.numberOfRanges > 2 ? Range(match.range(at: 2), in: body) : nil
      guard let nameRange else {
        result += body[matchRange]
        lastIndex = matchRange.upperBound
        return
      }
      let name = String(body[nameRange])
      let tone = toneRange.map { String(body[$0]) } ?? ""
      result += resolve(name, tone)
      lastIndex = matchRange.upperBound
    }
    result += body[lastIndex...]
    return result
  }

  private static func resolveSurrogate(forName name: String) -> String? {
    loadNameToSurrogate()[name]
  }

  private static func resolveSkinToneSurrogate(name: String, tone: String) -> String? {
    guard let toneIndex = Int(tone), toneIndex >= 1, toneIndex <= 5 else {
      return resolveSurrogate(forName: name)
    }
    for entries in loadEmojiRegistry().values {
      for entry in entries {
        guard let names = entry["names"] as? [String], names.contains(name),
          let skins = entry["skins"] as? [[String: Any]],
          toneIndex - 1 < skins.count,
          let skinSurrogates = skins[toneIndex - 1]["surrogates"] as? String
        else {
          continue
        }
        return skinSurrogates
      }
    }
    return resolveSurrogate(forName: name)
  }

  private static func loadNameToSurrogate() -> [String: String] {
    registryLock.lock()
    defer { registryLock.unlock() }
    if let cached = nameToSurrogate {
      return cached
    }
    var map: [String: String] = [:]
    for entries in loadEmojiRegistry().values {
      for entry in entries {
        guard let surrogates = entry["surrogates"] as? String, !surrogates.isEmpty,
          let names = entry["names"] as? [String]
        else {
          continue
        }
        for name in names {
          map[name] = surrogates
        }
      }
    }
    nameToSurrogate = map
    return map
  }

  private static func loadEmojiRegistry() -> [String: [[String: Any]]] {
    registryLock.lock()
    defer { registryLock.unlock() }
    if let cached = emojiRegistry {
      return cached
    }
    guard let url = Bundle.main.url(forResource: "emojis", withExtension: "json"),
      let data = try? Data(contentsOf: url),
      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    else {
      emojiRegistry = [:]
      return [:]
    }
    var registry: [String: [[String: Any]]] = [:]
    for (key, value) in json where key != "shortcuts" {
      if let entries = value as? [[String: Any]] {
        registry[key] = entries
      }
    }
    emojiRegistry = registry
    return registry
  }
}
