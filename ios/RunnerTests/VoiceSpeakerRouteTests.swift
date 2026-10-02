import AVFAudio
import XCTest

final class VoiceSpeakerRouteTests: XCTestCase {
  func testSpeakerClearsToTheLoudspeaker() {
    XCTAssertEqual(
      voiceOutputPortPlan(route: "speaker", availableInputPorts: [.bluetoothHFP]),
      .speaker
    )
  }

  func testEarpieceStaysOnTheBuiltInReceiver() {
    XCTAssertEqual(
      voiceOutputPortPlan(
        route: "earpiece",
        availableInputPorts: [.bluetoothHFP, .builtInMic]
      ),
      .earpiece
    )
  }

  func testHeadsetPrefersBluetoothHfpOverA2dp() {
    XCTAssertEqual(
      voiceOutputPortPlan(
        route: "headset",
        availableInputPorts: [.bluetoothA2DP, .usbAudio, .bluetoothHFP]
      ),
      .headset(.bluetoothHFP)
    )
  }

  func testHeadsetFallsThroughToWiredThenUsb() {
    XCTAssertEqual(
      voiceOutputPortPlan(
        route: "headset",
        availableInputPorts: [.usbAudio, .headsetMic]
      ),
      .headset(.headsetMic)
    )
    XCTAssertEqual(
      voiceOutputPortPlan(route: "headset", availableInputPorts: [.usbAudio]),
      .headset(.usbAudio)
    )
  }

  func testHeadsetWithoutACallInputDoesNotForceSpeaker() {
    XCTAssertEqual(
      voiceOutputPortPlan(route: "headset", availableInputPorts: [.bluetoothA2DP]),
      .headsetUnavailable
    )
  }
}
