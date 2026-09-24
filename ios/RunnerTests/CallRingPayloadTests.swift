import XCTest

final class CallRingPayloadTests: XCTestCase {
  func testUsesCallerName() {
    let outcome = CallRingResolver.resolve(
      plaintext: """
        {"type":"call_ring","data":{"type":"call_ring","channel_id":"c","message_id":"m","target_user_id":"u","caller_name":"Ada","caller_avatar_url":"https://cdn.example/a.png","expires_at_ms":2000}}
        """,
      accountUserId: "u",
      nowMs: 1000,
      ringingMessageIds: [],
      isForeground: false
    )
    guard case .ring(let fields) = outcome else {
      return XCTFail("expected a ring")
    }
    XCTAssertEqual(fields.callerName, "Ada")
    XCTAssertEqual(fields.callerAvatarUrl, "https://cdn.example/a.png")
    XCTAssertEqual(fields.durationMs, 1000)
  }

  func testEndsWhenTypeIsNotARing() {
    let outcome = CallRingResolver.resolve(
      plaintext: #"{"type":"message","data":{"type":"message","channel_id":"c","message_id":"m"}}"#,
      accountUserId: "u",
      nowMs: 1000,
      ringingMessageIds: [],
      isForeground: false
    )
    XCTAssertEqual(outcome, .end)
  }

  func testEndsADuplicateMessage() {
    let outcome = CallRingResolver.resolve(
      plaintext: #"{"data":{"type":"call_ring","channel_id":"c","message_id":"m","expires_at_ms":5000}}"#,
      accountUserId: "u",
      nowMs: 1000,
      ringingMessageIds: ["m"],
      isForeground: false
    )
    XCTAssertEqual(outcome, .end)
  }

  func testEndsWhenAppIsForeground() {
    let outcome = CallRingResolver.resolve(
      plaintext: #"{"data":{"type":"call_ring","channel_id":"c","message_id":"m","expires_at_ms":5000}}"#,
      accountUserId: "u",
      nowMs: 1000,
      ringingMessageIds: [],
      isForeground: true
    )
    XCTAssertEqual(outcome, .end)
  }
}
