import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart' show UserSettingsResponse;
import 'package:fluxer_dart/models/locale.dart' as sdk;
import 'package:riverpod/src/framework.dart' show Override;

final NotifierProvider<_TestUserSettings, UserSettingsResponse?>
_testUserSettingsProvider =
    NotifierProvider<_TestUserSettings, UserSettingsResponse?>(
      _TestUserSettings.new,
    );

class _TestUserSettings extends Notifier<UserSettingsResponse?> {
  @override
  UserSettingsResponse? build() => null;

  void updateSettings(UserSettingsResponse? value) {
    if (!identical(state, value)) {
      state = value;
    }
  }
}

UserSettingsResponse _settingsWithLocale(sdk.Locale locale) {
  return UserSettingsResponse.fromJson(<String, Object?>{
    'status': 'online',
    'theme': 'dark',
    'locale': locale.json ?? 'unknown-locale',
    'time_format': 0,
    'render_embeds': true,
    'render_reactions': true,
    'inline_attachment_media': true,
    'inline_embed_media': true,
    'gif_auto_play': true,
    'animate_emoji': true,
    'animate_stickers': 0,
    'render_spoilers': 0,
    'message_display_compact': false,
    'friend_source_flags': 0,
    'incoming_call_flags': 0,
    'group_dm_add_permission_flags': 0,
    'guild_folders': <Map<String, Object?>>[],
    'custom_status': null,
    'afk_timeout': 300,
    'default_share_voice_activity': false,
    'developer_mode': false,
    'trusted_domains': <String>[],
    'default_hide_muted_channels': false,
    'sensitive_content_friend_dm_filter': 0,
    'sensitive_content_non_friend_dm_filter': 0,
    'sensitive_content_guild_filter': 0,
    'suppress_unprivileged_self_mentions': false,
    'suppress_unprivileged_self_mentions_bypass_user_ids': <String>[],
    'staff_dm_access_user_ids': <String>[],
    'profile_privacy': 0,
    'synced_preferences': '',
    'restricted_guilds': <String>[],
    'bot_restricted_guilds': <String>[],
    'default_guilds_restricted': false,
    'bot_default_guilds_restricted': false,
  });
}

ProviderContainer _container({sdk.Locale? appLocale}) {
  final ProviderContainer container = ProviderContainer(
    overrides: <Override>[
      userSettingsStatusProvider.overrideWithValue(
        appLocale == null ? null : _settingsWithLocale(appLocale),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('every app locale has Material localisation data', () {
    for (final Locale locale in FluxerLocalizations.supportedLocales) {
      expect(
        GlobalMaterialLocalizations.delegate.isSupported(locale),
        isTrue,
        reason: locale.toLanguageTag(),
      );
    }
  });

  test('selected app locale wins over the system locale', () {
    final ProviderContainer container = _container(appLocale: sdk.Locale.fr);
    container.read(systemLocalesProvider.notifier).updateFromPlatform(
      const <Locale>[Locale('de', 'DE')],
    );

    expect(container.read(effectiveAppLocaleProvider), const Locale('fr'));
    expect(
      container.read(appLocalizationsProvider).gatewayConnectedToast,
      'Connecté',
    );
  });

  test('selected regional and script locales are preserved', () {
    final Map<sdk.Locale, Locale> cases = <sdk.Locale, Locale>{
      sdk.Locale.enGb: const Locale('en', 'GB'),
      sdk.Locale.es419: const Locale('es', '419'),
      sdk.Locale.ptBr: const Locale('pt', 'BR'),
      sdk.Locale.zhTw: const Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hant',
      ),
    };

    for (final MapEntry<sdk.Locale, Locale> entry in cases.entries) {
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          userSettingsStatusProvider.overrideWithValue(
            _settingsWithLocale(entry.key),
          ),
        ],
      );
      expect(container.read(effectiveAppLocaleProvider), entry.value);
      container.dispose();
    }
  });

  test('unknown app locale follows the system locale', () {
    final ProviderContainer container = _container(
      appLocale: sdk.Locale.$unknown,
    );
    container.read(systemLocalesProvider.notifier).updateFromPlatform(
      const <Locale>[Locale('de', 'DE')],
    );

    expect(container.read(effectiveAppLocaleProvider), const Locale('de'));
    expect(
      container.read(appLocalizationsProvider).gatewayConnectedToast,
      'Verbunden',
    );
  });

  test('stored locale without a catalogue follows the system locale', () {
    final ProviderContainer container = _container(appLocale: sdk.Locale.bg);
    container.read(systemLocalesProvider.notifier).updateFromPlatform(
      const <Locale>[Locale('de', 'DE')],
    );

    expect(container.read(effectiveAppLocaleProvider), const Locale('de'));
    expect(
      container.read(appLocalizationsProvider).gatewayConnectedToast,
      'Verbunden',
    );
  });

  test('system fallback considers the complete preference list', () {
    final ProviderContainer container = _container();
    container.read(systemLocalesProvider.notifier).updateFromPlatform(
      const <Locale>[Locale('pt', 'PT'), Locale('pt', 'BR')],
    );

    expect(
      container.read(effectiveAppLocaleProvider),
      const Locale('pt', 'BR'),
    );
  });

  test('automatic locale reacts to system changes', () {
    final ProviderContainer container = _container();

    container.read(systemLocalesProvider.notifier).updateFromPlatform(
      const <Locale>[Locale('de', 'DE')],
    );
    expect(container.read(effectiveAppLocaleProvider), const Locale('de'));

    container.read(systemLocalesProvider.notifier).updateFromPlatform(
      const <Locale>[Locale('fr', 'FR')],
    );
    expect(container.read(effectiveAppLocaleProvider), const Locale('fr'));
  });

  test('selected locale ignores subsequent system changes', () {
    final ProviderContainer container = _container(appLocale: sdk.Locale.fr);

    container.read(systemLocalesProvider.notifier).updateFromPlatform(
      const <Locale>[Locale('de', 'DE')],
    );
    expect(container.read(effectiveAppLocaleProvider), const Locale('fr'));

    container.read(systemLocalesProvider.notifier).updateFromPlatform(
      const <Locale>[Locale('en', 'US')],
    );
    expect(container.read(effectiveAppLocaleProvider), const Locale('fr'));
  });

  test('effective locale reacts to app-language changes', () {
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        userSettingsStatusProvider.overrideWith(
          (Ref ref) => ref.watch(_testUserSettingsProvider),
        ),
      ],
    );
    addTearDown(container.dispose);
    container.read(systemLocalesProvider.notifier).updateFromPlatform(
      const <Locale>[Locale('de', 'DE')],
    );
    expect(container.read(effectiveAppLocaleProvider), const Locale('de'));

    container
        .read(_testUserSettingsProvider.notifier)
        .updateSettings(_settingsWithLocale(sdk.Locale.fr));

    expect(container.read(effectiveAppLocaleProvider), const Locale('fr'));
    expect(
      container.read(appLocalizationsProvider).gatewayConnectedToast,
      'Connecté',
    );
  });

  testWidgets('binding observer forwards runtime locale changes', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = _container();
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const AppUiLifecycleObserver(child: SizedBox()),
      ),
    );

    tester.binding.platformDispatcher.localesTestValue = const <Locale>[
      Locale('de', 'DE'),
      Locale('fr', 'FR'),
    ];
    addTearDown(tester.binding.platformDispatcher.clearLocalesTestValue);
    await tester.pump();

    expect(container.read(systemLocalesProvider), const <Locale>[
      Locale('de', 'DE'),
      Locale('fr', 'FR'),
    ]);
    expect(container.read(effectiveAppLocaleProvider), const Locale('de'));
  });
}
