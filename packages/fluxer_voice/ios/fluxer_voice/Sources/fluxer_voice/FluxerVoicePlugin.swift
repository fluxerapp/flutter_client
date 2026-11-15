import Flutter
import UIKit

public final class FluxerVoicePlugin: NSObject, FlutterPlugin {
  private let activeRoute = VoiceActiveRouteBridge()
  private let callGuard = SystemVoiceCallGuard()
  private let pip: VoicePipController

  private init(registrar: FlutterPluginRegistrar) {
    pip = VoicePipController { [weak registrar] in
      registrar?.viewController?.view
    }
    super.init()
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let messenger = registrar.messenger()
    let plugin = FluxerVoicePlugin(registrar: registrar)
    plugin.activeRoute.register(messenger: messenger)
    SystemVoiceCallGuardHostApiSetup.setUp(binaryMessenger: messenger, api: plugin.callGuard)
    VoicePipHostApiSetup.setUp(binaryMessenger: messenger, api: plugin.pip)
    VoicePipEventsStreamHandler.register(with: messenger, streamHandler: plugin.pip.events)
    registrar.register(
      VoiceRoutePickerViewFactory(messenger: messenger),
      withId: "fluxer_app/voice_route_picker"
    )
    registrar.publish(plugin)
  }
}
