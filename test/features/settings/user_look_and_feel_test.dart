import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_look_and_feel.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_sync_service.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/instance_runtime_config_override.dart';
import '../../helpers/open_test_database.dart';

class _NoopUserSettingsSyncService extends UserSettingsSyncService {
  _NoopUserSettingsSyncService(super.ref);

  @override
  Future<void> pushTheme(UserSettingsUpdateRequestThemeTheme theme) async {}

  @override
  Future<UserSettingsResponse> fetchCurrentSettings() async =>
      _settingsResponseWithTheme('dark');
}

class _InertSyncedPreferencesStore extends SyncedPreferencesStore {
  // The superclass forwarding parameter is private outside its library.
  // ignore: use_super_parameters
  _InertSyncedPreferencesStore(Ref ref) : super(ref);

  @override
  void markDirty(SyncedPreferenceField field) {}

  @override
  void scheduleFlush() {}
}

class _BlockingUserSettingsSyncService extends UserSettingsSyncService {
  _BlockingUserSettingsSyncService(super.ref);

  Completer<void>? _gate;

  void hold() => _gate = Completer<void>();

  void release() => _gate?.complete();

  @override
  Future<void> pushTheme(UserSettingsUpdateRequestThemeTheme theme) async {
    final gate = _gate;
    if (gate != null) {
      await gate.future;
    }
  }

  @override
  Future<UserSettingsResponse> fetchCurrentSettings() async =>
      _settingsResponseWithTheme('dark');
}

class _FailingUserSettingsSyncService extends UserSettingsSyncService {
  _FailingUserSettingsSyncService(super.ref);

  @override
  Future<void> pushTheme(UserSettingsUpdateRequestThemeTheme theme) =>
      Future<void>.error(StateError('PATCH refused'));

  @override
  Future<UserSettingsResponse> fetchCurrentSettings() async =>
      _settingsResponseWithTheme('dark');
}

class _LightThemeUserSettingsSyncService extends UserSettingsSyncService {
  _LightThemeUserSettingsSyncService(super.ref);

  @override
  Future<void> pushTheme(UserSettingsUpdateRequestThemeTheme theme) async {}

  @override
  Future<UserSettingsResponse> fetchCurrentSettings() async =>
      _settingsResponseWithTheme('light');
}

UserSettingsResponse _settingsResponseWithTheme(String theme) =>
    UserSettingsResponse.fromJson(<String, Object?>{
      'status': 'online',
      'theme': theme,
      'locale': 'en-US',
      'restricted_guilds': <String>[],
      'bot_restricted_guilds': <String>[],
      'default_guilds_restricted': false,
      'bot_default_guilds_restricted': false,
      'inline_attachment_media': true,
      'inline_embed_media': true,
      'gif_auto_play': true,
      'render_embeds': true,
      'render_reactions': true,
      'animate_emoji': true,
      'animate_stickers': 0,
      'render_spoilers': 0,
      'message_display_compact': false,
      'friend_source_flags': 0,
      'incoming_call_flags': 0,
      'group_dm_add_permission_flags': 0,
      'guild_folders': <Map<String, Object?>>[],
      'afk_timeout': 600,
      'time_format': 0,
      'developer_mode': false,
      'trusted_domains': <String>[],
      'default_hide_muted_channels': false,
      'sensitive_content_friend_dm_filter': 0,
      'sensitive_content_non_friend_dm_filter': 0,
      'sensitive_content_guild_filter': 0,
      'suppress_unprivileged_self_mentions': false,
      'suppress_unprivileged_self_mentions_bypass_user_ids': <String>[],
      'staff_dm_access_user_ids': <String>[],
      'synced_preferences': '',
      'profile_privacy': 0,
      'default_share_voice_activity': false,
      'custom_status': null,
    });

Widget _wrap(Widget child, {required FluxerDatabase db}) {
  final colorTheme = buildDarkColorTheme();
  final container = ProviderContainer(
    overrides: [
      instanceRuntimeConfigOverride(),
      fluxerDatabaseProvider.overrideWithValue(db),
      userSettingsSyncProvider.overrideWith(_NoopUserSettingsSyncService.new),
    ],
  );
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      home: Scaffold(body: child),
    ),
  );
}

/// Suppress rendering overflow exceptions that originate from FluxerSlider's
/// fixed-size marker column in test environments.
void _ignoreSliderOverflows() {
  final previousHandler = FlutterError.onError;
  FlutterError.onError = (details) {
    if (details.exception.toString().contains('RenderFlex overflowed')) {
      return;
    }
    previousHandler?.call(details);
  };
  addTearDown(() => FlutterError.onError = previousHandler);
}

void main() {
  late FluxerDatabase db;

  setUp(() {
    db = openTestDatabase();
  });

  testWidgets('renders all section titles', (tester) async {
    _ignoreSliderOverflows();
    tester.view.physicalSize = const Size(800, 2000);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      _wrap(UserLookAndFeel(scrollController: ScrollController()), db: db),
    );
    await tester.pump();

    expect(find.text('Theme'), findsOneWidget);
    expect(find.text('High dynamic range'), findsOneWidget);
    expect(find.text('App zoom level'), findsOneWidget);
    expect(find.text('Messages'), findsOneWidget);
    expect(find.text('Interface'), findsOneWidget);
    expect(find.text('Channel List'), findsOneWidget);
    expect(find.text('Active Now'), findsOneWidget);
    expect(find.text('Favorites'), findsOneWidget);
  });

  testWidgets('tapping light swatch updates theme preference', (tester) async {
    _ignoreSliderOverflows();
    tester.view.physicalSize = const Size(800, 2000);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final container = ProviderContainer(
      overrides: [
        instanceRuntimeConfigOverride(),
        fluxerDatabaseProvider.overrideWithValue(db),
        userSettingsSyncProvider.overrideWith(_NoopUserSettingsSyncService.new),
        syncedPreferencesStoreProvider.overrideWith(
          _InertSyncedPreferencesStore.new,
        ),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          theme: buildFluxerTheme(
            colorTheme: buildDarkColorTheme(),
            textTheme: FluxerTextTheme.fromColors(buildDarkColorTheme()),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          home: Scaffold(
            body: UserLookAndFeel(scrollController: ScrollController()),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.bySemanticsLabel('Light Theme'));
    await tester.pump();

    expect(container.read(themePreferenceProvider).mode, FluxerThemeMode.light);
  });

  testWidgets('toggling Enable Favorites updates provider', (tester) async {
    _ignoreSliderOverflows();
    tester.view.physicalSize = const Size(800, 4000);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final container = ProviderContainer(
      overrides: [
        instanceRuntimeConfigOverride(),
        fluxerDatabaseProvider.overrideWithValue(db),
        userSettingsSyncProvider.overrideWith(_NoopUserSettingsSyncService.new),
        syncedPreferencesStoreProvider.overrideWith(
          _InertSyncedPreferencesStore.new,
        ),
      ],
    );
    addTearDown(container.dispose);

    await db.userPreferencesDao.savePreferences(
      const UserPreferencesTableCompanion(userId: Value('u1')),
    );
    await container.read(appearancePreferencesProvider.notifier).load('u1');

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          theme: buildFluxerTheme(
            colorTheme: buildDarkColorTheme(),
            textTheme: FluxerTextTheme.fromColors(buildDarkColorTheme()),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          home: Scaffold(
            body: UserLookAndFeel(scrollController: ScrollController()),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(container.read(appearancePreferencesProvider).showFavorites, isTrue);

    await tester.dragUntilVisible(
      find.bySemanticsLabel(RegExp('Enable Favorites')),
      find.byType(Scrollable),
      const Offset(0, -200),
    );
    await tester.tap(find.bySemanticsLabel(RegExp('Enable Favorites')));
    await tester.pump();

    expect(
      container.read(appearancePreferencesProvider).showFavorites,
      isFalse,
    );

    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump();
  });

  test('setTheme blocks subsequent taps while a PATCH is in flight', () async {
    final container = ProviderContainer(
      overrides: [
        instanceRuntimeConfigOverride(),
        fluxerDatabaseProvider.overrideWithValue(db),
        userSettingsSyncProvider.overrideWith(
          (ref) => _BlockingUserSettingsSyncService(ref)..hold(),
        ),
      ],
    );
    addTearDown(container.dispose);

    final blocking =
        container.read(userSettingsSyncProvider)
            as _BlockingUserSettingsSyncService;
    final notifier = container.read(themePreferenceProvider.notifier);

    final firstTap = notifier.setTheme(FluxerThemeMode.coal);

    expect(
      container.read(themePreferenceProvider).inflightTheme,
      FluxerThemeMode.coal,
    );
    expect(
      container.read(themePreferenceProvider).mode,
      FluxerThemeMode.dark,
      reason: 'mode does not move until the server acks',
    );

    await notifier.setTheme(FluxerThemeMode.light);
    expect(
      container.read(themePreferenceProvider).inflightTheme,
      FluxerThemeMode.coal,
      reason: 'second tap is dropped while a PATCH is in flight',
    );

    blocking.release();
    await firstTap;

    expect(container.read(themePreferenceProvider).mode, FluxerThemeMode.coal);
    expect(container.read(themePreferenceProvider).inflightTheme, isNull);
  });

  test('setTheme reverts inflight on PATCH failure and rethrows', () async {
    final container = ProviderContainer(
      overrides: [
        instanceRuntimeConfigOverride(),
        fluxerDatabaseProvider.overrideWithValue(db),
        userSettingsSyncProvider.overrideWith(
          _FailingUserSettingsSyncService.new,
        ),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(themePreferenceProvider.notifier);

    await expectLater(
      notifier.setTheme(FluxerThemeMode.coal),
      throwsA(isA<StateError>()),
    );

    expect(
      container.read(themePreferenceProvider).mode,
      FluxerThemeMode.dark,
      reason: 'mode stays on the previous value when PATCH fails',
    );
    expect(
      container.read(themePreferenceProvider).inflightTheme,
      isNull,
      reason: 'inflight cleared on failure so swatches re-enable',
    );
  });

  test('applyServerSettings is a no-op when local mode is system', () async {
    await db.userPreferencesDao.savePreferences(
      const UserPreferencesTableCompanion(
        userId: Value('u1'),
        theme: Value('system'),
      ),
    );

    final container = ProviderContainer(
      overrides: [
        instanceRuntimeConfigOverride(),
        fluxerDatabaseProvider.overrideWithValue(db),
        userSettingsSyncProvider.overrideWith(_NoopUserSettingsSyncService.new),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(themePreferenceProvider.notifier);
    await notifier.load('u1');
    expect(
      container.read(themePreferenceProvider).mode,
      FluxerThemeMode.system,
    );

    await notifier.applyServerSettings(_settingsResponseWithTheme('coal'));

    expect(
      container.read(themePreferenceProvider).mode,
      FluxerThemeMode.system,
      reason: 'gateway theme update must not knock the user out of system',
    );
  });

  test(
    'applyServerSettings is a no-op while a local PATCH is inflight',
    () async {
      final container = ProviderContainer(
        overrides: [
          instanceRuntimeConfigOverride(),
          fluxerDatabaseProvider.overrideWithValue(db),
          userSettingsSyncProvider.overrideWith(
            (ref) => _BlockingUserSettingsSyncService(ref)..hold(),
          ),
        ],
      );
      addTearDown(container.dispose);

      final blocking =
          container.read(userSettingsSyncProvider)
              as _BlockingUserSettingsSyncService;

      await db.userPreferencesDao.savePreferences(
        const UserPreferencesTableCompanion(userId: Value('u1')),
      );
      final notifier = container.read(themePreferenceProvider.notifier);
      await notifier.load('u1');

      final pending = notifier.setTheme(FluxerThemeMode.coal);
      expect(
        container.read(themePreferenceProvider).inflightTheme,
        FluxerThemeMode.coal,
      );

      await notifier.applyServerSettings(_settingsResponseWithTheme('light'));

      expect(
        container.read(themePreferenceProvider).mode,
        FluxerThemeMode.dark,
        reason: 'gateway echo must not interfere with the inflight change',
      );
      expect(
        container.read(themePreferenceProvider).inflightTheme,
        FluxerThemeMode.coal,
      );

      blocking.release();
      await pending;

      expect(
        container.read(themePreferenceProvider).mode,
        FluxerThemeMode.coal,
      );
    },
  );

  test(
    'load resets to defaults when the user has no local preferences',
    () async {
      await db.userPreferencesDao.savePreferences(
        const UserPreferencesTableCompanion(
          userId: Value('user-a'),
          theme: Value('light'),
          syncAcrossDevices: Value(false),
        ),
      );

      final container = ProviderContainer(
        overrides: [
          instanceRuntimeConfigOverride(),
          fluxerDatabaseProvider.overrideWithValue(db),
          userSettingsSyncProvider.overrideWith(
            _NoopUserSettingsSyncService.new,
          ),
        ],
      );
      addTearDown(container.dispose);

      final ThemePreference notifier = container.read(
        themePreferenceProvider.notifier,
      );
      await notifier.load('user-a');
      expect(
        container.read(themePreferenceProvider).mode,
        FluxerThemeMode.light,
      );

      await notifier.load('user-b');

      expect(
        container.read(themePreferenceProvider).mode,
        FluxerThemeMode.dark,
      );
    },
  );

  test('load applies stored preferences for the target user', () async {
    await db.userPreferencesDao.savePreferences(
      const UserPreferencesTableCompanion(
        userId: Value('user-a'),
        theme: Value('light'),
        syncAcrossDevices: Value(false),
      ),
    );
    await db.userPreferencesDao.savePreferences(
      const UserPreferencesTableCompanion(
        userId: Value('user-b'),
        theme: Value('coal'),
        syncAcrossDevices: Value(false),
      ),
    );

    final container = ProviderContainer(
      overrides: [
        instanceRuntimeConfigOverride(),
        fluxerDatabaseProvider.overrideWithValue(db),
        userSettingsSyncProvider.overrideWith(_NoopUserSettingsSyncService.new),
      ],
    );
    addTearDown(container.dispose);

    final ThemePreference notifier = container.read(
      themePreferenceProvider.notifier,
    );
    await notifier.load('user-a');
    await notifier.load('user-b');

    expect(container.read(themePreferenceProvider).mode, FluxerThemeMode.coal);
  });

  test('load clears inflightTheme from the previous user', () async {
    final container = ProviderContainer(
      overrides: [
        instanceRuntimeConfigOverride(),
        fluxerDatabaseProvider.overrideWithValue(db),
        userSettingsSyncProvider.overrideWith(
          (ref) => _BlockingUserSettingsSyncService(ref)..hold(),
        ),
      ],
    );
    addTearDown(container.dispose);

    await db.userPreferencesDao.savePreferences(
      const UserPreferencesTableCompanion(userId: Value('user-a')),
    );
    final ThemePreference notifier = container.read(
      themePreferenceProvider.notifier,
    );
    await notifier.load('user-a');
    unawaited(notifier.setTheme(FluxerThemeMode.coal));
    expect(
      container.read(themePreferenceProvider).inflightTheme,
      FluxerThemeMode.coal,
    );

    await notifier.load('user-b');

    expect(container.read(themePreferenceProvider).inflightTheme, isNull);
    expect(container.read(themePreferenceProvider).mode, FluxerThemeMode.dark);
  });

  test(
    'load fetches the server theme when sync across devices is enabled',
    () async {
      final container = ProviderContainer(
        overrides: [
          instanceRuntimeConfigOverride(),
          fluxerDatabaseProvider.overrideWithValue(db),
          userSettingsSyncProvider.overrideWith(
            _LightThemeUserSettingsSyncService.new,
          ),
        ],
      );
      addTearDown(container.dispose);

      final ThemePreference notifier = container.read(
        themePreferenceProvider.notifier,
      );
      await notifier.load('user-a');

      expect(
        container.read(themePreferenceProvider).mode,
        FluxerThemeMode.light,
      );
    },
  );

  test(
    'load skips server theme fetch when sync across devices is disabled',
    () async {
      await db.userPreferencesDao.savePreferences(
        const UserPreferencesTableCompanion(
          userId: Value('user-a'),
          theme: Value('coal'),
          syncAcrossDevices: Value(false),
        ),
      );

      final container = ProviderContainer(
        overrides: [
          instanceRuntimeConfigOverride(),
          fluxerDatabaseProvider.overrideWithValue(db),
          userSettingsSyncProvider.overrideWith(
            _LightThemeUserSettingsSyncService.new,
          ),
        ],
      );
      addTearDown(container.dispose);

      final ThemePreference notifier = container.read(
        themePreferenceProvider.notifier,
      );
      await notifier.load('user-a');

      expect(
        container.read(themePreferenceProvider).mode,
        FluxerThemeMode.coal,
      );
    },
  );

  test('applyServerSettings ignores hydration for a different user', () async {
    await db.userPreferencesDao.savePreferences(
      const UserPreferencesTableCompanion(
        userId: Value('user-a'),
        theme: Value('dark'),
        syncAcrossDevices: Value(true),
      ),
    );

    final container = ProviderContainer(
      overrides: [
        instanceRuntimeConfigOverride(),
        fluxerDatabaseProvider.overrideWithValue(db),
        userSettingsSyncProvider.overrideWith(_NoopUserSettingsSyncService.new),
        currentUserIdProvider.overrideWithValue('user-b'),
      ],
    );
    addTearDown(container.dispose);

    final ThemePreference notifier = container.read(
      themePreferenceProvider.notifier,
    );
    await notifier.load('user-a');

    expect(container.read(themePreferenceProvider).mode, FluxerThemeMode.dark);

    await notifier.applyServerSettings(_settingsResponseWithTheme('light'));

    expect(
      container.read(themePreferenceProvider).mode,
      FluxerThemeMode.dark,
      reason: 'hydration must not apply to a user other than the loaded one',
    );
  });
}
