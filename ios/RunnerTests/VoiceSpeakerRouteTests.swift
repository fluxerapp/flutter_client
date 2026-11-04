import AVFAudio
import XCTest
@testable import Runner

final class VoiceSpeakerRouteTests: XCTestCase {
  func testSpeakerOverridesTheReceiver() {
    XCTAssertEqual(
      voiceOutputPortPlan(
        route: "speaker",
        availableInputPorts: [.builtInMic],
        currentOutputPorts: [.builtInReceiver]
      ),
      .speaker
    )
  }

  func testSpeakerKeepsHeadphonesTheSystemRoutedTo() {
    XCTAssertEqual(
      voiceOutputPortPlan(
        route: "speaker",
        availableInputPorts: [.bluetoothHFP],
        currentOutputPorts: [.bluetoothHFP]
      ),
      .keepSystemRoute
    )
    XCTAssertEqual(
      voiceOutputPortPlan(
        route: "speaker",
        availableInputPorts: [.builtInMic],
        currentOutputPorts: [.bluetoothA2DP]
      ),
      .keepSystemRoute
    )
  }

  func testEarpieceKeepsHeadphonesTheSystemRoutedTo() {
    XCTAssertEqual(
      voiceOutputPortPlan(
        route: "earpiece",
        availableInputPorts: [.bluetoothHFP, .builtInMic],
        currentOutputPorts: [.bluetoothHFP]
      ),
      .keepSystemRoute
    )
  }

  func testEarpieceStaysOnTheBuiltInReceiver() {
    XCTAssertEqual(
      voiceOutputPortPlan(
        route: "earpiece",
        availableInputPorts: [.bluetoothHFP, .builtInMic],
        currentOutputPorts: []
      ),
      .earpiece
    )
  }

  func testHeadsetPrefersBluetoothHfpOverA2dp() {
    XCTAssertEqual(
      voiceOutputPortPlan(
        route: "headset",
        availableInputPorts: [.bluetoothA2DP, .usbAudio, .bluetoothHFP],
        currentOutputPorts: []
      ),
      .headset(.bluetoothHFP)
    )
  }

  func testHeadsetFallsThroughToWiredThenUsb() {
    XCTAssertEqual(
      voiceOutputPortPlan(
        route: "headset",
        availableInputPorts: [.usbAudio, .headsetMic],
        currentOutputPorts: []
      ),
      .headset(.headsetMic)
    )
    XCTAssertEqual(
      voiceOutputPortPlan(
        route: "headset",
        availableInputPorts: [.usbAudio],
        currentOutputPorts: []
      ),
      .headset(.usbAudio)
    )
  }

  func testHeadsetWithoutACallInputDoesNotForceSpeaker() {
    XCTAssertEqual(
      voiceOutputPortPlan(
        route: "headset",
        availableInputPorts: [.bluetoothA2DP],
        currentOutputPorts: []
      ),
      .headsetUnavailable
    )
  }

  func testActiveRoutePrefersHeadsetOutputs() {
    XCTAssertEqual(
      voiceActiveRouteName(outputPorts: [.builtInReceiver, .bluetoothHFP]),
      "headset"
    )
    XCTAssertEqual(
      voiceActiveRouteName(outputPorts: [.headphones]),
      "headset"
    )
  }

  func testExternalOutputsReportTheHeadsetRoute() {
    for port: AVAudioSession.Port in [.airPlay, .carAudio, .HDMI, .lineOut, .usbAudio] {
      XCTAssertEqual(voiceActiveRouteName(outputPorts: [port]), "headset")
    }
  }

  func testSpeakerKeepsAnHdmiRouteTheSystemChose() {
    XCTAssertEqual(
      voiceOutputPortPlan(
        route: "speaker",
        availableInputPorts: [.builtInMic],
        currentOutputPorts: [.HDMI]
      ),
      .keepSystemRoute
    )
  }

  func testExternalOutputsUseTheirDeviceName() {
    XCTAssertEqual(
      voiceActiveRouteDeviceName(outputs: [(port: .carAudio, name: "Car Audio")]),
      "Car Audio"
    )
    XCTAssertEqual(
      voiceActiveRouteDeviceName(outputs: [(port: .airPlay, name: "Kitchen Speaker")]),
      "Kitchen Speaker"
    )
  }

  func testOnlyNamedExternalOutputsHaveADeviceName() {
    XCTAssertNil(
      voiceActiveRouteDeviceName(outputs: [(port: .bluetoothA2DP, name: "Bluetooth Headphones")])
    )
    XCTAssertNil(voiceActiveRouteDeviceName(outputs: [(port: .headphones, name: "Headphones")]))
    XCTAssertNil(voiceActiveRouteDeviceName(outputs: [(port: .builtInSpeaker, name: "Speaker")]))
    XCTAssertNil(voiceActiveRouteDeviceName(outputs: [(port: .airPlay, name: " ")]))
  }

  func testEmptyRouteHasNoActiveRoute() {
    XCTAssertNil(voiceActiveRouteName(outputPorts: []))
  }

  func testActiveRouteMapsReceiverAndSpeaker() {
    XCTAssertEqual(
      voiceActiveRouteName(outputPorts: [.builtInReceiver]),
      "earpiece"
    )
    XCTAssertEqual(
      voiceActiveRouteName(outputPorts: [.builtInSpeaker]),
      "speaker"
    )
  }
}
