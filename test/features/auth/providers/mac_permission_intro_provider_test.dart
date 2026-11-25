import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/auth/providers/mac_permission_intro_provider.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

import '../../../helpers/fake_mac_permissions.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late FluxerDatabase db;
  late FakeMacPermissions fake;

  setUp(() {
    db = FluxerDatabase.forTesting(NativeDatabase.memory());
    fake = installFakeMacPermissions(<MacPermissionKind, MacPermissionStatus>{
      MacPermissionKind.camera: MacPermissionStatus.granted,
    });
  });

  tearDown(() async {
    resetMacPermissions();
    await db.close();
  });

  Future<ProviderContainer> boot() async {
    final ProviderContainer container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);
    await container.read(localSettingsStoreProvider).load();
    return container;
  }

  Future<void> grant(MacPermissionKind kind) async {
    fake.statuses[kind] = MacPermissionStatus.granted;
    await macPermissions.refreshKind(kind);
  }

  test('walks the pending kinds and completes once', () async {
    final ProviderContainer container = await boot();
    final MacPermissionIntro intro = container.read(
      macPermissionIntroProvider.notifier,
    );
    await intro.start();
    expect(
      container.read(macPermissionIntroProvider).steps,
      <MacPermissionKind>[
        MacPermissionKind.microphone,
        MacPermissionKind.screen,
        MacPermissionKind.inputMonitoring,
      ],
    );

    intro.advance();
    expect(
      container.read(macPermissionIntroProvider).current,
      MacPermissionKind.microphone,
    );

    await grant(MacPermissionKind.microphone);
    intro.advance();
    expect(
      container.read(macPermissionIntroProvider).current,
      MacPermissionKind.screen,
    );

    intro
      ..skip()
      ..skip();
    expect(container.read(macPermissionIntroProvider).current, isNull);
    expect(intro.isPending, isFalse);
  });

  test('skipped kinds stay skipped after a relaunch', () async {
    final ProviderContainer first = await boot();
    final MacPermissionIntro intro = first.read(
      macPermissionIntroProvider.notifier,
    );
    await intro.start();
    intro.skip();
    await first.read(localSettingsStoreProvider).flush();

    final ProviderContainer second = await boot();
    await second.read(macPermissionIntroProvider.notifier).start();
    expect(
      second.read(macPermissionIntroProvider).current,
      MacPermissionKind.screen,
    );
    expect(
      second
          .read(localSettingsStoreProvider)
          .read(LocalSettingKeys.macPermissionIntroSkipped),
      <String>['microphone'],
    );
  });

  test('does nothing off macOS', () async {
    macPermissions = MacPermissionsController(
      platform: fake,
      isSupported: false,
    );
    final ProviderContainer container = await boot();
    final MacPermissionIntro intro = container.read(
      macPermissionIntroProvider.notifier,
    );
    await intro.start();
    expect(intro.isPending, isFalse);
    expect(container.read(macPermissionIntroProvider).current, isNull);
  });
}
