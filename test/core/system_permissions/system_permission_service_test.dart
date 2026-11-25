import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/system_permissions/media_permission_error.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_settings.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

import '../../helpers/fake_mac_permissions.dart';

void main() {
  tearDown(() {
    resetMacPermissions();
    debugDefaultTargetPlatformOverride = null;
  });

  test('macOS media permissions bypass permission_handler', () async {
    final FakeMacPermissions fake = installFakeMacPermissions();
    expect(
      await requestSystemPermission(SystemPermissionKind.microphone),
      SystemPermissionOutcome.granted,
    );
    expect(fake.requested, <MacPermissionKind>[MacPermissionKind.microphone]);
  });

  test('macOS denial requires settings', () async {
    installFakeMacPermissions(<MacPermissionKind, MacPermissionStatus>{
      MacPermissionKind.camera: MacPermissionStatus.denied,
    });
    expect(
      await requestSystemPermission(SystemPermissionKind.camera),
      SystemPermissionOutcome.requiresSettings,
    );
  });

  test('macOS settings open the matching privacy pane', () async {
    final FakeMacPermissions fake = installFakeMacPermissions();
    await openSystemPermissionSettings(SystemPermissionKind.photos);
    await openSystemPermissionSettings(SystemPermissionKind.camera);
    expect(fake.opened, <MacPrivacyPane>[
      MacPrivacyPane.photos,
      MacPrivacyPane.camera,
    ]);
  });

  test('Linux microphone and camera are not gated', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    expect(
      await requestSystemPermission(SystemPermissionKind.microphone),
      SystemPermissionOutcome.granted,
    );
    expect(
      await requestSystemPermission(SystemPermissionKind.camera),
      SystemPermissionOutcome.granted,
    );
  });

  test('Windows media settings use ms-settings links', () {
    expect(
      windowsPrivacySettingsUri(SystemPermissionKind.microphone).toString(),
      'ms-settings:privacy-microphone',
    );
    expect(
      windowsPrivacySettingsUri(SystemPermissionKind.camera).toString(),
      'ms-settings:privacy-webcam',
    );
  });

  test('recognises permission failures only', () {
    expect(
      isMediaPermissionDeniedError('Unable to getUserMedia: NotAllowedError'),
      isTrue,
    );
    expect(
      isMediaPermissionDeniedError(Exception('Permission denied')),
      isTrue,
    );
    expect(
      isMediaPermissionDeniedError(Exception('source not found')),
      isFalse,
    );
  });
}
