import XCTest

@testable import Runner

final class MeasureLogRedactionTests: XCTestCase {
  func testScrubsHttpUrlsAndSnowflakes() {
    XCTAssertEqual(
      MeasureLogRedaction.scrubForMeasure("GET https://my.guild.host/channels failed"),
      "GET https://instance/channels failed"
    )
    XCTAssertEqual(
      MeasureLogRedaction.scrubForMeasure(
        "Message 1558635549802102784 not found for someone@example.com"
      ),
      "Message :id not found for email"
    )
  }

  func testScrubsHostLookupMessages() {
    XCTAssertEqual(
      MeasureLogRedaction.scrubForMeasure(
        "SocketException: Failed host lookup: 'chat.example.org' (OS Error)"
      ),
      "SocketException: Failed host lookup: 'instance' (OS Error)"
    )
  }

  func testRedactErrorScrubsLocalizedDescription() {
    let original = NSError(
      domain: "test",
      code: 1,
      userInfo: [
        NSLocalizedDescriptionKey:
          "Failed for chat.example.org channel 1558633981610557440",
      ]
    )
    let redacted = MeasureLogRedaction.redactErrorForMeasure(original)
    XCTAssertEqual(redacted.localizedDescription, "Failed for instance channel :id")
  }

  func testFluxerNativeMeasureScrubAttribute() {
    XCTAssertEqual(
      FluxerNativeMeasure.scrubAttribute("host chat.example.org"),
      "host instance"
    )
    let value = String(repeating: "x", count: 300)
    XCTAssertEqual(FluxerNativeMeasure.scrubAttribute(value).count, 256)
  }
}
