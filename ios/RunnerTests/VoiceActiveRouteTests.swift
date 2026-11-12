import AVFAudio
import XCTest
@testable import Runner

final class VoiceActiveRouteTests: XCTestCase {
  func testActiveRoutePrefersHeadsetOutputs() {
    XCTAssertEqual(
      voiceActiveRouteName(outputPorts: [.builtInReceiver, .bluetoothHFP]),
      NativeVoiceRoute.headset
    )
    XCTAssertEqual(
      voiceActiveRouteName(outputPorts: [.headphones]),
      NativeVoiceRoute.headset
    )
  }

  func testExternalOutputsReportTheHeadsetRoute() {
    for port: AVAudioSession.Port in [.airPlay, .carAudio, .HDMI, .lineOut, .usbAudio] {
      XCTAssertEqual(voiceActiveRouteName(outputPorts: [port]), .headset)
    }
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
      NativeVoiceRoute.earpiece
    )
    XCTAssertEqual(
      voiceActiveRouteName(outputPorts: [.builtInSpeaker]),
      NativeVoiceRoute.speaker
    )
  }
}
