import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

class FakeMacPermissions implements MacPermissions {
  FakeMacPermissions([
    Map<MacPermissionKind, MacPermissionStatus> initial =
        const <MacPermissionKind, MacPermissionStatus>{},
  ]) : statuses = <MacPermissionKind, MacPermissionStatus>{
         for (final MacPermissionKind kind in MacPermissionKind.values)
           kind: initial[kind] ?? MacPermissionStatus.notDetermined,
       };

  final Map<MacPermissionKind, MacPermissionStatus> statuses;
  final Map<MacPermissionKind, MacPermissionStatus> requestResults =
      <MacPermissionKind, MacPermissionStatus>{};
  final List<MacPermissionKind> requested = <MacPermissionKind>[];
  final List<MacPermissionKind> liveProbed = <MacPermissionKind>[];
  final List<MacPrivacyPane> opened = <MacPrivacyPane>[];

  @override
  Future<MacPermissionStatus> status(
    MacPermissionKind kind, {
    bool liveProbe = false,
  }) async {
    if (liveProbe) {
      liveProbed.add(kind);
    }
    return statuses[kind]!;
  }

  @override
  Future<MacPermissionStatus> request(MacPermissionKind kind) async {
    requested.add(kind);
    return statuses[kind] = requestResults[kind] ?? MacPermissionStatus.granted;
  }

  @override
  Future<void> openSettings(MacPrivacyPane pane) async => opened.add(pane);
}

FakeMacPermissions installFakeMacPermissions([
  Map<MacPermissionKind, MacPermissionStatus> initial =
      const <MacPermissionKind, MacPermissionStatus>{},
]) {
  final FakeMacPermissions fake = FakeMacPermissions(initial);
  macPermissions = MacPermissionsController(platform: fake, isSupported: true);
  return fake;
}

void resetMacPermissions() => macPermissions = MacPermissionsController();
