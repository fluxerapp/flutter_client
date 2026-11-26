import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

import '../../../helpers/fake_mac_permissions.dart';

void main() {
  late FakeMacPermissions fake;

  setUp(() => fake = installFakeMacPermissions());
  tearDown(resetMacPermissions);

  test('reports unsupported off macOS without calling the platform', () async {
    macPermissions = MacPermissionsController(
      platform: fake,
      isSupported: false,
    );
    expect(
      await macPermissions.ensure(MacPermissionKind.microphone),
      MacPermissionStatus.unsupported,
    );
    expect(fake.requested, isEmpty);
  });

  test('ensure requests only while not determined', () async {
    expect(
      await macPermissions.ensure(MacPermissionKind.camera),
      MacPermissionStatus.granted,
    );
    fake.statuses[MacPermissionKind.camera] = MacPermissionStatus.denied;
    expect(
      await macPermissions.ensure(MacPermissionKind.camera),
      MacPermissionStatus.denied,
    );
    expect(fake.requested, <MacPermissionKind>[MacPermissionKind.camera]);
  });

  test('screen denial shows advice and the still-blocked state', () async {
    fake.requestResults[MacPermissionKind.screen] = MacPermissionStatus.denied;
    await macPermissions.request(MacPermissionKind.screen);
    expect(
      macPermissions.state.showsQuitPromptAdvice(MacPermissionKind.screen),
      isTrue,
    );
    expect(macPermissions.state.screenStillBlockedAfterReturn, isFalse);
    await macPermissions.refreshAfterReturn();
    expect(macPermissions.state.screenStillBlockedAfterReturn, isTrue);

    fake.statuses[MacPermissionKind.screen] = MacPermissionStatus.granted;
    await macPermissions.refreshKind(MacPermissionKind.screen);
    expect(macPermissions.state.screenStillBlockedAfterReturn, isFalse);
    expect(macPermissions.state.changeRequested, isEmpty);
  });

  test('microphone never shows quit prompt advice', () async {
    fake.requestResults[MacPermissionKind.microphone] =
        MacPermissionStatus.denied;
    await macPermissions.request(MacPermissionKind.microphone);
    expect(macPermissions.state.anyQuitPromptAdvice, isFalse);
  });

  test('returning to the window never live probes the screen', () async {
    await macPermissions.refreshAfterReturn();
    expect(fake.liveProbed, isEmpty);
    await macPermissions.ensure(MacPermissionKind.screen, liveProbe: true);
    expect(fake.liveProbed, <MacPermissionKind>[MacPermissionKind.screen]);
  });

  test(
    'opening settings marks an ungranted kind as change requested',
    () async {
      await macPermissions.openSettings(MacPermissionKind.inputMonitoring);
      expect(fake.opened, <MacPrivacyPane>[MacPrivacyPane.inputMonitoring]);
      expect(macPermissions.state.anyQuitPromptAdvice, isTrue);
    },
  );
}
