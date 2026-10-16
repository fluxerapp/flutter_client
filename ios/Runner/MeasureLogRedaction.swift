import Foundation

enum MeasureLogRedaction {
  private static let redactedHost = "instance"
  private static let redactedId = ":id"
  private static let redactedValue = ":value"
  private static let redactedEmail = "email"

  private static let segmentsBeforeValue: Set<String> = [
    "invite",
    "invites",
    "gift",
    "gifts",
    "template",
    "templates",
    "reactions",
    "vanity-url",
  ]

  private static let fileExtensions: Set<String> = [
    "aab", "apk", "arb", "cc", "cpp", "css", "dart", "db", "dll", "dylib", "exe",
    "framework", "gif", "html", "ipa", "java", "jpeg", "jpg", "js", "json", "kt",
    "log", "m4a", "mjs", "mov", "mp3", "mp4", "plist", "png", "so", "sqlite",
    "svg", "swift", "txt", "wasm", "webp", "xml", "yaml", "yml", "zip",
  ]

  private static let routeWord = try! NSRegularExpression(
    pattern: #"^(?:[a-z][a-z-]*|@me|v\d+)$"#
  )
  private static let digitsOnly = try! NSRegularExpression(pattern: #"^\d+$"#)
  private static let url =
    try! NSRegularExpression(
      pattern:
        #"\b([a-z][a-z0-9+.\-]*)://([^\s/?#'"<>()\[\]{}|\\^`]+)([^\s?#'"<>()\[\]{}|\\^`]*)"# +
        #"(?:\?[^\s#'"<>()]*)?(?:#[^\s'"<>()]*)?"#,
      options: [.caseInsensitive]
    )
  private static let email = try! NSRegularExpression(
    pattern: #"[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}"#,
    options: [.caseInsensitive]
  )
  private static let hostAfterLabel = try! NSRegularExpression(
    pattern: #"(host lookup: '|address = |host: |CN=)([^\s',)/]+)"#,
    options: [.caseInsensitive]
  )
  private static let ipv4 =
    try! NSRegularExpression(pattern: #"(?<![\d.])(?:\d{1,3}\.){3}\d{1,3}(?![\d.])"#)
  private static let ipv6 = try! NSRegularExpression(
    pattern: #"(?<![\w.:])\[?(?=[0-9a-f:]*::)[0-9a-f]{0,4}(?::[0-9a-f]{0,4}){2,7}\]?(?![\w.:])"#,
    options: [.caseInsensitive]
  )
  private static let hostname = try! NSRegularExpression(
    pattern:
      #"(?<![\w./@:\-])((?:[a-z0-9](?:[a-z0-9\-]{0,61}[a-z0-9])?\.)+[a-z][a-z0-9\-]{0,61}[a-z0-9])(?![\w(\[\-]|\.[\w])"#,
    options: [.caseInsensitive]
  )
  private static let snowflake = try! NSRegularExpression(pattern: #"(?<!\d)\d{15,20}(?!\d)"#)

  static func scrubPathForMeasure(_ path: String) -> String {
    let segments = path.split(separator: "/", omittingEmptySubsequences: false).map(String.init)
    var scrubbed: [String] = []
    var previous: String?
    for segment in segments {
      if segment.isEmpty {
        scrubbed.append(segment)
      } else if let previous, segmentsBeforeValue.contains(previous) {
        scrubbed.append(redactedValue)
      } else if matches(digitsOnly, in: segment, wholeString: true) {
        scrubbed.append(redactedId)
      } else if matches(routeWord, in: segment, wholeString: true) {
        scrubbed.append(segment)
      } else {
        scrubbed.append(redactedValue)
      }
      previous = segment
    }
    return scrubbed.joined(separator: "/")
  }

  static func scrubForMeasure(_ value: String) -> String {
    if value.isEmpty {
      return value
    }
    var result = replaceUrls(in: value)
    result = replaceAll(email, in: result, with: redactedEmail)
    result = replaceAll(hostAfterLabel, in: result, template: "$1\(redactedHost)")
    result = replaceAll(ipv4, in: result, with: redactedHost)
    result = replaceAll(ipv6, in: result, with: redactedHost)
    result = replaceHostnames(in: result)
    return replaceAll(snowflake, in: result, with: redactedId)
  }

  static func redactErrorForMeasure(_ error: Error) -> NSError {
    let nsError = error as NSError
    var userInfo = nsError.userInfo
    userInfo[NSLocalizedDescriptionKey] = scrubForMeasure(nsError.localizedDescription)
    for key in userInfo.keys where key != NSUnderlyingErrorKey {
      if let string = userInfo[key] as? String {
        userInfo[key] = scrubForMeasure(string)
      }
    }
    if let underlying = nsError.userInfo[NSUnderlyingErrorKey] as? Error {
      userInfo[NSUnderlyingErrorKey] = redactErrorForMeasure(underlying)
    }
    return NSError(domain: nsError.domain, code: nsError.code, userInfo: userInfo)
  }

  private static func replaceUrls(in value: String) -> String {
    let nsRange = NSRange(value.startIndex..<value.endIndex, in: value)
    var result = value
    for match in url.matches(in: value, options: [], range: nsRange).reversed() {
      guard let matchRange = Range(match.range, in: result) else { continue }
      let scheme = (result as NSString).substring(with: match.range(at: 1)).lowercased()
      let path = match.range(at: 3).location != NSNotFound
        ? (result as NSString).substring(with: match.range(at: 3))
        : ""
      result.replaceSubrange(
        matchRange,
        with: "\(scheme)://\(redactedHost)\(scrubPathForMeasure(path))"
      )
    }
    return result
  }

  private static func replaceHostnames(in value: String) -> String {
    var result = value
    let nsRange = NSRange(result.startIndex..<result.endIndex, in: result)
    for match in hostname.matches(in: result, options: [], range: nsRange).reversed() {
      guard let matchRange = Range(match.range, in: result) else { continue }
      let host = (result as NSString).substring(with: match.range(at: 1))
      let lastLabel = host.split(separator: ".").last.map(String.init) ?? ""
      if fileExtensions.contains(lastLabel) {
        continue
      }
      result.replaceSubrange(matchRange, with: redactedHost)
    }
    return result
  }

  private static func matches(
    _ regex: NSRegularExpression,
    in value: String,
    wholeString: Bool
  ) -> Bool {
    let range = NSRange(value.startIndex..<value.endIndex, in: value)
    if wholeString {
      return regex.firstMatch(in: value, options: [], range: range)?.range == range
    }
    return regex.firstMatch(in: value, options: [], range: range) != nil
  }

  private static func replaceAll(
    _ regex: NSRegularExpression,
    in value: String,
    with replacement: String
  ) -> String {
    regex.stringByReplacingMatches(
      in: value,
      range: NSRange(value.startIndex..<value.endIndex, in: value),
      withTemplate: replacement
    )
  }

  private static func replaceAll(
    _ regex: NSRegularExpression,
    in value: String,
    template: String
  ) -> String {
    regex.stringByReplacingMatches(
      in: value,
      range: NSRange(value.startIndex..<value.endIndex, in: value),
      withTemplate: template
    )
  }
}
