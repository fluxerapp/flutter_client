import Flutter
import UIKit
import XCTest

class RunnerTests: XCTestCase {
  func testResolveChannelThreadIdentifierUsesApsThreadId() {
    let userInfo: [AnyHashable: Any] = [
      "aps": ["thread-id": "channel:456"],
      "message_id": "msg-1",
    ]
    XCTAssertEqual(
      PushNotificationPayload.resolveChannelThreadIdentifier(from: userInfo),
      "channel:456"
    )
    XCTAssertEqual(
      PushNotificationPayload.resolveThreadIdentifier(from: userInfo),
      "channel:456"
    )
  }

  func testResolveChannelThreadIdentifierFallsBackToChannelId() {
    let userInfo: [AnyHashable: Any] = [
      "channel_id": "456",
      "message_id": "msg-1",
    ]
    XCTAssertEqual(
      PushNotificationPayload.resolveChannelThreadIdentifier(from: userInfo),
      "channel:456"
    )
  }

  func testResolveChannelThreadIdentifierFallsBackToNestedChannelId() {
    let userInfo: [AnyHashable: Any] = [
      "data": ["channel_id": "789"],
      "message_id": "msg-2",
    ]
    XCTAssertEqual(
      PushNotificationPayload.resolveChannelThreadIdentifier(from: userInfo),
      "channel:789"
    )
  }

  func testResolveMessageIdFromTopLevelPayload() {
    let userInfo: [AnyHashable: Any] = [
      "message_id": "msg-1",
    ]
    XCTAssertEqual(PushNotificationPayload.resolveMessageId(from: userInfo), "msg-1")
  }

  func testResolveMessageIdFromNestedData() {
    let userInfo: [AnyHashable: Any] = [
      "data": ["message_id": "msg-nested"],
    ]
    XCTAssertEqual(PushNotificationPayload.resolveMessageId(from: userInfo), "msg-nested")
  }

  func testResolveMessageIdFallsBackToId() {
    let userInfo: [AnyHashable: Any] = [
      "id": "msg-fallback",
    ]
    XCTAssertEqual(PushNotificationPayload.resolveMessageId(from: userInfo), "msg-fallback")
  }

  func testResolveNotificationIdentifierUsesMessageId() {
    let userInfo: [AnyHashable: Any] = [
      "aps": ["thread-id": "channel:456"],
      "message_id": "msg-1",
    ]
    XCTAssertEqual(
      PushNotificationPayload.resolveNotificationIdentifier(from: userInfo),
      "msg-1"
    )
  }

  func testResolveNotificationIdentifierGeneratesUuidWhenMessageIdMissing() {
    let userInfo: [AnyHashable: Any] = [
      "aps": ["thread-id": "channel:456"],
    ]
    let identifier = PushNotificationPayload.resolveNotificationIdentifier(from: userInfo)
    XCTAssertFalse(identifier.isEmpty)
    XCTAssertNotEqual(identifier, "channel:456")
  }

  func testThreadAndNotificationIdentifiersAreIndependent() {
    let userInfo: [AnyHashable: Any] = [
      "aps": ["thread-id": "channel:456"],
      "message_id": "msg-1",
    ]
    let threadId = PushNotificationPayload.resolveChannelThreadIdentifier(from: userInfo)
    let notificationId = PushNotificationPayload.resolveNotificationIdentifier(from: userInfo)
    XCTAssertEqual(threadId, "channel:456")
    XCTAssertEqual(notificationId, "msg-1")
    XCTAssertNotEqual(threadId, notificationId)
  }

  func testIsClearPayloadDetectsRootAndNestedFields() {
    let rootClear: [AnyHashable: Any] = [
      "type": "notification_clear",
      "channel_id": "456",
    ]
    let nestedClear: [AnyHashable: Any] = [
      "data": ["action": "clear_channel", "channel_id": "456"],
    ]
    XCTAssertTrue(PushNotificationPayload.isClearPayload(from: rootClear))
    XCTAssertTrue(PushNotificationPayload.isClearPayload(from: nestedClear))
    XCTAssertFalse(PushNotificationPayload.isClearPayload(from: ["channel_id": "456"]))
  }

  func testSpeakableGroupNameUsesChannelNameForGuilds() {
    XCTAssertEqual(
      PushNotificationPayload.resolveSpeakableGroupName(title: "Alice (#general, My Server)"),
      "general"
    )
  }

  func testSpeakableGroupNameUsesGroupDmFallback() {
    XCTAssertEqual(
      PushNotificationPayload.resolveSpeakableGroupName(title: "Alice (Group DM)"),
      "Group DM"
    )
  }

  func testSpeakableGroupNameIsNilForDirectMessages() {
    XCTAssertNil(PushNotificationPayload.resolveSpeakableGroupName(title: "Alice"))
  }

  func testMessageIsCoveredByAckKeepsNewerMessages() {
    XCTAssertFalse(
      PushNotificationPayload.messageIsCoveredByAck(messageId: "200", upToMessageId: "100")
    )
    XCTAssertTrue(
      PushNotificationPayload.messageIsCoveredByAck(messageId: "100", upToMessageId: "200")
    )
    XCTAssertTrue(
      PushNotificationPayload.messageIsCoveredByAck(messageId: "100", upToMessageId: nil)
    )
    XCTAssertFalse(
      PushNotificationPayload.messageIsCoveredByAck(messageId: nil, upToMessageId: "100")
    )
  }

  func testResolveChannelIdFromClearPayload() {
    let userInfo: [AnyHashable: Any] = [
      "type": "notification_clear",
      "channel_id": "456",
    ]
    XCTAssertEqual(PushNotificationPayload.resolveChannelId(from: userInfo), "456")
  }

  func testResolveChannelIdFromDmPayload() {
    let userInfo: [AnyHashable: Any] = [
      "channel_id": "dm-99",
      "guild_id": "null",
      "message_id": "msg-1",
    ]
    XCTAssertEqual(PushNotificationPayload.resolveChannelId(from: userInfo), "dm-99")
  }

  func testResolveChannelIdFromUrlWhenChannelIdMissing() {
    let userInfo: [AnyHashable: Any] = [
      "url": "/channels/@me/dm-42/msg-7",
      "message_id": "msg-7",
    ]
    XCTAssertEqual(PushNotificationPayload.resolveChannelId(from: userInfo), "dm-42")
  }

  func testResolveChannelIdFromGuildNavigateUrl() {
    let userInfo: [AnyHashable: Any] = [
      "navigate": "/channels/guild-9/chan-3/msg-1",
    ]
    XCTAssertEqual(PushNotificationPayload.resolveChannelId(from: userInfo), "chan-3")
  }

  func testCustomEmojiImageUrlIsStaticWebpWithoutAnimatedParam() {
    let url = NotificationEmojiDecoder.customEmojiImageUrl(id: "99")
    XCTAssertEqual(url?.absoluteString, "https://fluxerusercontent.com/emojis/99.webp?size=96")
    XCTAssertFalse(url?.absoluteString.contains("animated") ?? true)
  }

  func testDecodeRewritesCustomEmojiWireTokenInBody() {
    let result = NotificationEmojiDecoder.decode(body: "Hi <:party:99>")
    XCTAssertEqual(result.body, "Hi :party:")
    XCTAssertEqual(result.imageUrls.count, 1)
    XCTAssertEqual(
      result.imageUrls.first?.absoluteString,
      "https://fluxerusercontent.com/emojis/99.webp?size=96"
    )
  }

  func testDecodeTreatsAnimatedWireTokenSameAsStaticForImageUrl() {
    let staticResult = NotificationEmojiDecoder.decode(body: "<:wave:123>")
    let animatedResult = NotificationEmojiDecoder.decode(body: "<a:wave:123>")
    XCTAssertEqual(staticResult.body, ":wave:")
    XCTAssertEqual(animatedResult.body, ":wave:")
    XCTAssertEqual(
      staticResult.imageUrls.first?.absoluteString,
      animatedResult.imageUrls.first?.absoluteString
    )
    XCTAssertFalse(animatedResult.imageUrls.first?.absoluteString.contains("animated") ?? true)
  }

  func testDecodeUsesFirstEmojiImageUrlForMultipleTokens() {
    let result = NotificationEmojiDecoder.decode(body: "<:one:1> <:two:2>")
    XCTAssertEqual(result.body, ":one: :two:")
    XCTAssertEqual(result.imageUrls.count, 2)
    XCTAssertEqual(
      result.imageUrls.first?.absoluteString,
      "https://fluxerusercontent.com/emojis/1.webp?size=96"
    )
  }

  func testDecodeResolvesUnicodeShortcodeWhenEmojiRegistryIsAvailable() {
    let result = NotificationEmojiDecoder.decode(body: "Hello :grinning:")
    XCTAssertTrue(result.body.contains("😀") || result.body == "Hello :grinning:")
    XCTAssertTrue(result.imageUrls.isEmpty)
  }

  func testForegroundPushPolicyDiscardsAlertPushesWhileAppIsForeground() {
    let alertPayload: [AnyHashable: Any] = [
      "aps": ["alert": ["title": "Ping", "body": "Hello"]],
      "channel_id": "456",
      "message_id": "msg-1",
    ]
    XCTAssertFalse(
      ForegroundPushNotificationPolicy.shouldProcessPush(
        userInfo: alertPayload,
        isAppForeground: true
      )
    )
    XCTAssertTrue(
      ForegroundPushNotificationPolicy.shouldProcessPush(
        userInfo: alertPayload,
        isAppForeground: false
      )
    )
  }

  func testForegroundPushPolicyAlwaysProcessesClearPayloads() {
    let clearPayload: [AnyHashable: Any] = [
      "type": "notification_clear",
      "channel_id": "456",
    ]
    XCTAssertTrue(
      ForegroundPushNotificationPolicy.shouldProcessPush(
        userInfo: clearPayload,
        isAppForeground: true
      )
    )
    XCTAssertTrue(
      ForegroundPushNotificationPolicy.shouldProcessPush(
        userInfo: clearPayload,
        isAppForeground: false
      )
    )
  }

  func testHasApsAlertDetectsAlertPayload() {
    let alertPayload: [AnyHashable: Any] = [
      "aps": ["alert": ["title": "Ping", "body": "Hello"]],
    ]
    let dataOnlyPayload: [AnyHashable: Any] = [
      "channel_id": "456",
      "message_id": "msg-1",
    ]
    XCTAssertTrue(PushNotificationPayload.hasApsAlert(alertPayload))
    XCTAssertFalse(PushNotificationPayload.hasApsAlert(dataOnlyPayload))
  }

  func testIsCallRingPayloadDetectsRootAndNestedType() {
    let root: [AnyHashable: Any] = ["type": "call_ring", "channel_id": "c"]
    let nested: [AnyHashable: Any] = ["data": ["type": "call_ring", "channel_id": "c"]]
    XCTAssertTrue(PushNotificationPayload.isCallRingPayload(from: root))
    XCTAssertTrue(PushNotificationPayload.isCallRingPayload(from: nested))
    XCTAssertFalse(PushNotificationPayload.isCallRingPayload(from: ["channel_id": "c"]))
  }

  func testCallAlertCoversRingsAndEmptyCallMessages() {
    XCTAssertTrue(
      PushNotificationPayload.isCallAlert(from: [
        "type": "call_ring",
        "message_id": "m",
      ])
    )
    XCTAssertTrue(
      PushNotificationPayload.isCallAlert(from: [
        "message_id": "m",
        "channel_id": "c",
        "title": "Ada",
        "body": "",
      ])
    )
    XCTAssertFalse(
      PushNotificationPayload.isCallAlert(from: [
        "message_id": "m",
        "body": "hello",
      ])
    )
    XCTAssertFalse(
      PushNotificationPayload.isCallAlert(from: [
        "body": "",
      ])
    )
    XCTAssertFalse(
      PushNotificationPayload.isCallAlert(from: [
        "type": "notification_clear",
        "message_id": "m",
        "body": "",
      ])
    )
  }

  func testCallRingPayloadCannotReplyAndHasNoMessageSound() {
    let userInfo: [AnyHashable: Any] = [
      "type": "call_ring",
      "channel_id": "c",
      "message_id": "m",
      "guild_id": "null",
    ]
    XCTAssertFalse(PushNotificationPayload.canReply(from: userInfo))
    XCTAssertNil(PushNotificationPayload.resolveNotificationSound(from: userInfo))
  }

  func testResolvedAlertBodyKeepsCallMessageFromGoingBlank() {
    XCTAssertEqual(
      PushNotificationPayload.resolvedAlertBody(
        decryptedBody: "",
        currentBody: "",
        fallback: "New message"
      ),
      "New message"
    )
    XCTAssertEqual(
      PushNotificationPayload.resolvedAlertBody(
        decryptedBody: "",
        currentBody: "New message",
        fallback: "Incoming call"
      ),
      "New message"
    )
    XCTAssertEqual(
      PushNotificationPayload.resolvedAlertBody(
        decryptedBody: "hello",
        currentBody: "",
        fallback: "New message"
      ),
      "hello"
    )
  }

  func testHasDisplayableAlertRequiresTitleOrBody() {
    XCTAssertTrue(PushNotificationPayload.hasDisplayableAlert(title: "Ada", body: ""))
    XCTAssertTrue(PushNotificationPayload.hasDisplayableAlert(title: "", body: "Incoming call"))
    XCTAssertFalse(PushNotificationPayload.hasDisplayableAlert(title: "", body: ""))
    XCTAssertFalse(PushNotificationPayload.hasDisplayableAlert(title: "  ", body: "\n"))
  }

  func testResolveSenderIdentifierPrefersAuthorId() {
    let userInfo: [AnyHashable: Any] = [
      "author_id": "42",
      "author_avatar_url": "https://cdn.example/avatars/99/hash.png",
      "target_user_id": "7",
    ]
    XCTAssertEqual(PushNotificationPayload.resolveSenderIdentifier(from: userInfo), "42")
  }

  func testResolveSenderIdentifierReadsNestedAuthorId() {
    let userInfo: [AnyHashable: Any] = [
      "data": ["author_id": 42],
      "target_user_id": "7",
    ]
    XCTAssertEqual(PushNotificationPayload.resolveSenderIdentifier(from: userInfo), "42")
  }

  func testResolveSenderIdentifierParsesAvatarUrl() {
    let userInfo: [AnyHashable: Any] = [
      "author_avatar_url": "https://cdn.example/avatars/123456/hash.png",
      "target_user_id": "7",
    ]
    XCTAssertEqual(PushNotificationPayload.resolveSenderIdentifier(from: userInfo), "123456")
  }

  func testResolveSenderIdentifierIgnoresDefaultAvatarUrlAndRecipient() {
    let userInfo: [AnyHashable: Any] = [
      "icon": "https://cdn.example/avatars/0.png",
      "target_user_id": "7",
    ]
    XCTAssertNil(PushNotificationPayload.resolveSenderIdentifier(from: userInfo))
  }

  func testAvatarUrlRequestsPngFromTheProxy() {
    let userInfo: [AnyHashable: Any] = [
      "author_avatar_url": "https://cdn.example/avatars/123456/hash.webp",
    ]
    let url = NotificationPayloadMedia.resolveAvatarUrl(from: userInfo)
    let query = url.flatMap { URLComponents(url: $0, resolvingAgainstBaseURL: false) }?
      .queryItems ?? []
    XCTAssertEqual(url?.path, "/avatars/123456/hash.webp")
    XCTAssertEqual(query.first(where: { $0.name == "format" })?.value, "png")
    XCTAssertEqual(query.first(where: { $0.name == "animated" })?.value, "false")
    XCTAssertEqual(query.first(where: { $0.name == "size" })?.value, "160")
  }

  func testAvatarUrlKeepsAnExistingSizeAndReplacesFormat() {
    let source = URL(string: "https://cdn.example/avatars/1/a.webp?format=webp&size=64&foo=bar")!
    let url = NotificationPayloadMedia.pngNotificationURL(source)
    let query = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems ?? []
    XCTAssertEqual(query.first(where: { $0.name == "format" })?.value, "png")
    XCTAssertEqual(query.first(where: { $0.name == "animated" })?.value, "false")
    XCTAssertEqual(query.first(where: { $0.name == "size" })?.value, "64")
    XCTAssertEqual(query.first(where: { $0.name == "foo" })?.value, "bar")
  }
}
