import 'package:fluxer_macos/src/messages.g.dart';

class MacPermissions {
  MacPermissions({MacPermissionsHostApi? api})
    : _api = api ?? MacPermissionsHostApi();

  final MacPermissionsHostApi _api;

  Future<MacPermissionStatus> status(
    MacPermissionKind kind, {
    bool liveProbe = false,
  }) => _api.status(kind, liveProbe);

  Future<MacPermissionStatus> request(MacPermissionKind kind) =>
      _api.request(kind);

  Future<void> openSettings(MacPrivacyPane pane) => _api.openSettings(pane);
}
