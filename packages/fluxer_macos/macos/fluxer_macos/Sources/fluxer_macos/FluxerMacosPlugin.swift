import FlutterMacOS
import Foundation

public final class FluxerMacosPlugin: NSObject, FlutterPlugin {
  private static var inputHook: MacInputHook?

  public static func register(with registrar: FlutterPluginRegistrar) {
    inputHook?.shutDown()
    let hook = MacInputHook(
      flutterApi: MacInputHookFlutterApi(binaryMessenger: registrar.messenger)
    )
    inputHook = hook
    MacPermissionsHostApiSetup.setUp(
      binaryMessenger: registrar.messenger,
      api: MacPermissions()
    )
    MacInputHookHostApiSetup.setUp(binaryMessenger: registrar.messenger, api: hook)
  }
}
