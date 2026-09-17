import XCTest
@testable import Runner

final class AssistantSendAndCallTests: XCTestCase {
  private let accountId = "999999999999999999"
  private let ada = AssistantFriendRecord(
    id: "111111111111111111",
    name: "Ada Lovelace",
    username: "ada",
    avatarUrl: ""
  )
  private let lin = AssistantFriendRecord(
    id: "222222222222222222",
    name: "Lin",
    username: "lin",
    avatarUrl: ""
  )

  override func setUp() {
    super.setUp()
    AssistantPendingCommand.performsInBackground = false
    AssistantPendingCommand.clear()
    seedFriends()
  }

  override func tearDown() {
    AssistantPendingCommand.clear()
    AssistantPendingCommand.performsInBackground = true
    AssistantEntityStore.shared.replace([
      "friends": [],
      "guilds": [],
      "channels": [],
    ])
    super.tearDown()
  }

  func testSendPayloadUsesFriendIdAndText() {
    let payload = AssistantPendingCommand.sendDmPayload(
      friendId: ada.id,
      text: "hello from shortcuts"
    )
    XCTAssertEqual(payload["type"] as? String, "sendDm")
    XCTAssertEqual(payload["friendId"] as? String, ada.id)
    XCTAssertEqual(payload["text"] as? String, "hello from shortcuts")
    XCTAssertEqual(payload["accountUserId"] as? String, accountId)
    XCTAssertNil(payload["channelId"])
  }

  func testCallPayloadUsesFriendIdWithoutMessageText() {
    let payload = AssistantPendingCommand.callPayload(friendId: ada.id)
    XCTAssertEqual(payload["type"] as? String, "voiceStartDmCall")
    XCTAssertEqual(payload["friendId"] as? String, ada.id)
    XCTAssertEqual(payload["accountUserId"] as? String, accountId)
    XCTAssertNil(payload["text"])
  }

  func testPendingSendIsTakenForCurrentAccount() {
    AssistantPendingCommand.store(
      AssistantPendingCommand.sendDmPayload(friendId: ada.id, text: "queued")
    )
    let pending = AssistantPendingCommand.takeIfAccount(accountId)
    XCTAssertEqual(pending?["type"] as? String, "sendDm")
    XCTAssertEqual(pending?["friendId"] as? String, ada.id)
    XCTAssertEqual(pending?["text"] as? String, "queued")
    XCTAssertNil(AssistantPendingCommand.takeIfAccount(accountId))
  }

  func testPendingCallIsTakenForCurrentAccount() {
    AssistantPendingCommand.store(
      AssistantPendingCommand.callPayload(friendId: lin.id)
    )
    let pending = AssistantPendingCommand.takeIfAccount(accountId)
    XCTAssertEqual(pending?["type"] as? String, "voiceStartDmCall")
    XCTAssertEqual(pending?["friendId"] as? String, lin.id)
  }

  func testPendingStaysWhenAccountDoesNotMatch() {
    AssistantPendingCommand.store(
      AssistantPendingCommand.sendDmPayload(friendId: ada.id, text: "stay")
    )
    XCTAssertNil(AssistantPendingCommand.takeIfAccount("888888888888888888"))
    let pending = AssistantPendingCommand.takeIfAccount(accountId)
    XCTAssertEqual(pending?["text"] as? String, "stay")
  }

  func testInFlightPendingIsNotTaken() {
    AssistantPendingCommand.store(
      AssistantPendingCommand.callPayload(friendId: ada.id)
    )
    AssistantPendingCommand.beginSend()
    XCTAssertNil(AssistantPendingCommand.takeIfAccount(accountId))
    AssistantPendingCommand.endSend()
    XCTAssertEqual(
      AssistantPendingCommand.takeIfAccount(accountId)?["friendId"] as? String,
      ada.id
    )
  }

  func testDuplicateFriendIdsAreDeduped() {
    AssistantEntityStore.shared.replace([
      "accountUserId": accountId,
      "friends": [
        ["id": ada.id, "name": ada.name, "username": ada.username],
        ["id": ada.id, "name": "Ada Copy", "username": "ada2"],
        ["id": lin.id, "name": lin.name, "username": lin.username],
      ],
      "guilds": [],
      "channels": [],
    ])
    XCTAssertEqual(AssistantEntityStore.shared.friends.map(\.id), [ada.id, lin.id])
  }

  func testQueueLeavesPendingWhenBackgroundSendIsDisabled() {
    AssistantPendingCommand.queueSend(friendId: ada.id, text: "queued only")
    let pending = AssistantPendingCommand.takeIfAccount(accountId)
    XCTAssertEqual(pending?["type"] as? String, "sendDm")
    XCTAssertEqual(pending?["text"] as? String, "queued only")
  }

  func testFriendQueryFindsDisplayNameAndUsername() async throws {
    let query = AssistantFriendEntityQuery()
    let byName = try await query.entities(matching: "Ada Lovelace")
    XCTAssertEqual(byName.map(\.id), [ada.id])
    let byUsername = try await query.entities(matching: "lin")
    XCTAssertEqual(byUsername.map(\.id), [lin.id])
    let suggested = try await query.suggestedEntities()
    XCTAssertEqual(suggested.map(\.id), [ada.id, lin.id])
  }

  func testFriendQuerySkipsUnknownIds() async throws {
    let query = AssistantFriendEntityQuery()
    let found = try await query.entities(for: [ada.id, "missing"])
    XCTAssertEqual(found.map(\.id), [ada.id])
  }

  func testFriendQueryMatchesSpokenFirstName() async throws {
    let query = AssistantFriendEntityQuery()
    let found = try await query.entities(matching: "Ada")
    XCTAssertEqual(found.map(\.id), [ada.id])
  }

  private func seedFriends() {
    AssistantEntityStore.shared.replace([
      "accountUserId": accountId,
      "friends": [
        ["id": ada.id, "name": ada.name, "username": ada.username],
        ["id": lin.id, "name": lin.name, "username": lin.username],
      ],
      "guilds": [],
      "channels": [],
    ])
  }
}
