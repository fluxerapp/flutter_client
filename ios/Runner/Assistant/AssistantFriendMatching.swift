import Foundation

struct AssistantFriendRecord: Equatable {
  let id: String
  let name: String
  let username: String
  let avatarUrl: String

  func matches(_ query: String) -> Bool {
    let needle = Self.normalize(query)
    if needle.isEmpty {
      return false
    }
    if Self.equals(name, needle) || Self.equals(username, needle) {
      return true
    }
    return Self.sharesToken(name, needle) || Self.sharesToken(username, needle)
  }

  static func matching(_ query: String, in friends: [AssistantFriendRecord]) -> [AssistantFriendRecord] {
    let needle = normalize(query)
    if needle.isEmpty {
      return []
    }
    let exact = friends.filter { equals($0.name, needle) || equals($0.username, needle) }
    if !exact.isEmpty {
      return exact
    }
    if tokens(needle).count == 1 {
      let firstNameHits = friends.filter { friend in
        guard let first = tokens(friend.name).first else {
          return false
        }
        return equals(first, needle)
      }
      if !firstNameHits.isEmpty {
        return firstNameHits
      }
    }
    return friends.filter { $0.matches(needle) }
  }

  private static func normalize(_ value: String) -> String {
    value
      .trimmingCharacters(in: .whitespacesAndNewlines)
      .replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
  }

  private static func equals(_ left: String, _ right: String) -> Bool {
    let lhs = normalize(left)
    let rhs = normalize(right)
    return !lhs.isEmpty && lhs.caseInsensitiveCompare(rhs) == .orderedSame
  }

  private static func sharesToken(_ value: String, _ query: String) -> Bool {
    let valueTokens = tokens(value)
    let queryTokens = tokens(query)
    if valueTokens.isEmpty || queryTokens.isEmpty {
      return false
    }
    return queryTokens.contains { queryToken in
      valueTokens.contains { equals($0, queryToken) }
    }
  }

  private static func tokens(_ value: String) -> [String] {
    normalize(value)
      .split { $0.isWhitespace || $0 == "#" }
      .map(String.init)
      .filter { !$0.isEmpty }
  }
}
