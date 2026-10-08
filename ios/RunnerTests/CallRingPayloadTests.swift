import XCTest

final class CallRingPayloadTests: XCTestCase {
  func testUsesCallerNameFromTheRingEnvelope() {
    let outcome = CallRingResolver.resolve(
      plaintext: """
        {"web_push":8030,"type":"call_ring","data":{"type":"call_ring","channel_id":"c","message_id":"m","target_user_id":"u","caller_id":"ada","caller_name":"Ada","caller_avatar_url":"https://cdn.example/a.png","started_at_ms":1000,"expires_at_ms":2000}}
        """,
      accountUserId: "u",
      nowMs: 1000
    )
    guard case .ring(let fields) = outcome else {
      return XCTFail("expected a ring")
    }
    XCTAssertEqual(fields.callerName, "Ada")
    XCTAssertEqual(fields.callerId, "ada")
    XCTAssertEqual(fields.callerAvatarUrl, "https://cdn.example/a.png")
    XCTAssertEqual(fields.channelId, "c")
    XCTAssertEqual(fields.messageId, "m")
    XCTAssertEqual(fields.durationMs, 1000)
    XCTAssertEqual(
      fields.callUUID.uuidString.lowercased(),
      "1bd2b375-788b-5871-9fbb-3b369b2519d1"
    )
  }

  func testRejectsWhenTypeIsNotARing() {
    let outcome = CallRingResolver.resolve(
      plaintext: #"{"type":"message","data":{"type":"message","channel_id":"c","message_id":"m"}}"#,
      accountUserId: "u",
      nowMs: 1000
    )
    XCTAssertEqual(outcome, .reject(messageId: nil))
  }

  func testRejectsAnExpiredRingAndKeepsTheMessageId() {
    let outcome = CallRingResolver.resolve(
      plaintext: #"{"data":{"type":"call_ring","channel_id":"c","message_id":"m","expires_at_ms":500}}"#,
      accountUserId: "u",
      nowMs: 20_000
    )
    XCTAssertEqual(outcome, .reject(messageId: "m"))
  }

  func testRejectsARingForAnotherAccount() {
    let outcome = CallRingResolver.resolve(
      plaintext: #"{"data":{"type":"call_ring","channel_id":"c","message_id":"m","target_user_id":"other","expires_at_ms":5000}}"#,
      accountUserId: "u",
      nowMs: 1000
    )
    XCTAssertEqual(outcome, .reject(messageId: "m"))
  }

  func testRejectsARingMissingChannelOrMessage() {
    let missingChannel = CallRingResolver.resolve(
      plaintext: #"{"data":{"type":"call_ring","message_id":"m","expires_at_ms":5000}}"#,
      accountUserId: "u",
      nowMs: 1000
    )
    XCTAssertEqual(missingChannel, .reject(messageId: "m"))

    let missingMessage = CallRingResolver.resolve(
      plaintext: #"{"data":{"type":"call_ring","channel_id":"c","expires_at_ms":5000}}"#,
      accountUserId: "u",
      nowMs: 1000
    )
    XCTAssertEqual(missingMessage, .reject(messageId: nil))
  }

  func testUsesDefaultDurationWhenExpiryIsMissing() {
    let outcome = CallRingResolver.resolve(
      plaintext: #"{"type":"call_ring","channel_id":"c","message_id":"m"}"#,
      accountUserId: "u",
      nowMs: 1000
    )
    guard case .ring(let fields) = outcome else {
      return XCTFail("expected a ring")
    }
    XCTAssertEqual(fields.durationMs, CallRingResolver.defaultDurationMs)
  }

  func testUsesFallbackNameAndFloorsAShortRemainingWindow() {
    let outcome = CallRingResolver.resolve(
      plaintext: #"{"type":"call_ring","channel_id":"c","message_id":"m","expires_at_ms":1500}"#,
      accountUserId: "u",
      nowMs: 1000
    )
    guard case .ring(let fields) = outcome else {
      return XCTFail("expected a ring")
    }
    XCTAssertEqual(fields.callerName, CallRingResolver.fallbackHandle)
    XCTAssertEqual(fields.handle, CallRingResolver.fallbackHandle)
    XCTAssertEqual(fields.durationMs, CallRingResolver.minimumDurationMs)
    XCTAssertEqual(fields.channelId, "c")
  }

  func testAcceptsARingForTheSignedInAccount() {
    let outcome = CallRingResolver.resolve(
      plaintext: #"{"data":{"type":"call_ring","channel_id":42,"message_id":7,"target_user_id":"u","expires_at_ms":5000}}"#,
      accountUserId: "u",
      nowMs: 1000
    )
    guard case .ring(let fields) = outcome else {
      return XCTFail("expected a ring")
    }
    XCTAssertEqual(fields.channelId, "42")
    XCTAssertEqual(fields.messageId, "7")
    XCTAssertEqual(fields.durationMs, 4000)
  }

  func testCallUuidIsStableForTheSameMessage() {
    let first = CallRingUuid.v5(name: "m")
    let second = CallRingUuid.v5(name: "m")
    let other = CallRingUuid.v5(name: "message-1")
    XCTAssertEqual(first, second)
    XCTAssertNotEqual(first, other)
    XCTAssertEqual(other.uuidString.lowercased(), "8146be86-bada-5038-87d5-7b21e7c93021")
  }
}
