import XCTest
@testable import Runner

final class AssistantFriendMatchingTests: XCTestCase {
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

  func testUsernameMatchesFriend() {
    XCTAssertEqual(AssistantFriendRecord.matching("ada", in: [ada, lin]).map(\.id), [ada.id])
  }

  func testDisplayNameMatchesFriend() {
    XCTAssertEqual(
      AssistantFriendRecord.matching("Ada Lovelace", in: [ada, lin]).map(\.id),
      [ada.id]
    )
  }

  func testSpokenFirstNameFindsUniqueDisplayName() {
    let named = AssistantFriendRecord(
      id: ada.id,
      name: "Ada Lovelace",
      username: "lovelace",
      avatarUrl: ""
    )
    XCTAssertEqual(AssistantFriendRecord.matching("Ada", in: [named, lin]).map(\.id), [named.id])
  }

  func testSharedFirstNameReturnsBothFriends() {
    let adaLee = AssistantFriendRecord(
      id: "333333333333333333",
      name: "Ada Lee",
      username: "adalee",
      avatarUrl: ""
    )
    let adaLovelace = AssistantFriendRecord(
      id: ada.id,
      name: "Ada Lovelace",
      username: "lovelace",
      avatarUrl: ""
    )
    XCTAssertEqual(
      Set(AssistantFriendRecord.matching("Ada", in: [adaLovelace, adaLee]).map(\.id)),
      Set([adaLovelace.id, adaLee.id])
    )
  }

  func testDisplayNameIgnoresExtraWhitespace() {
    XCTAssertEqual(
      AssistantFriendRecord.matching("  ada   lovelace  ", in: [ada, lin]).map(\.id),
      [ada.id]
    )
  }

  func testUnknownUsernameDoesNotMatch() {
    XCTAssertTrue(AssistantFriendRecord.matching("notafriend", in: [ada, lin]).isEmpty)
  }

  func testRecordMatchesUsesNameAndUsername() {
    XCTAssertTrue(ada.matches("Ada"))
    XCTAssertTrue(ada.matches("ada"))
    XCTAssertFalse(ada.matches("lin"))
  }
}
