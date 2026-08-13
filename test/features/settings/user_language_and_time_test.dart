import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_language_and_time.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_sync_service.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/models/locale.dart' as sdk;
import '../../helpers/test_l10n.dart';

class _NoopUserSettingsSyncService extends UserSettingsSyncService {
  _NoopUserSettingsSyncService(super.ref);

  @override
  Future<void> pushTimeFormat(TimeFormatTypes timeFormat) async {}
}

UserSettingsResponse _settingsResponse({String locale = 'en-US'}) {
  return UserSettingsResponse.fromJson(<String, Object?>{
    'status': 'online',
    'theme': 'dark',
    'locale': locale,
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

Widget _wrap(Widget child, {String locale = 'en-US'}) {
  final FluxerColorTheme colorTheme = buildDarkColorTheme();
  final ProviderContainer container = ProviderContainer(
    overrides: [
      userSettingsSyncProvider.overrideWith(_NoopUserSettingsSyncService.new),
      userSettingsStatusProvider.overrideWithValue(
        _settingsResponse(locale: locale),
      ),
      appearancePreferencesProvider.overrideWith(
        _TestAppearancePreferences.new,
      ),
    ],
  );
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

class _TestAppearancePreferences extends AppearancePreferences {
  @override
  AppearancePreferencesState build() => const AppearancePreferencesState();

  @override
  Future<void> setUseSystemLocaleForTimeFormat({required bool value}) async {
    state = state.copyWith(useSystemLocaleForTimeFormat: value);
  }
}

void main() {
  testWidgets('renders time format options and auto switch', (tester) async {
    await tester.pumpWidget(_wrap(const UserLanguageAndTime()));
    await tester.pumpAndSettle();

    expect(find.text('Time format'), findsOneWidget);
    expect(
      find.text('Choose how times are displayed throughout the app'),
      findsOneWidget,
    );
    expect(find.text('Auto'), findsOneWidget);
    expect(find.text('12-hour'), findsOneWidget);
    expect(find.text('24-hour'), findsOneWidget);
    expect(find.text('Use system locale for time format'), findsOneWidget);
  });

  testWidgets('unsupported saved locale is not exposed as a selection', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_wrap(const UserLanguageAndTime(), locale: 'bg'));
    await tester.pumpAndSettle();

    final FluxerSelect<sdk.Locale> select = tester.widget(
      find.byWidgetPredicate(
        (Widget widget) => widget is FluxerSelect<sdk.Locale>,
      ),
    );
    expect(select.value, isNull);
    expect(
      select.items.map((FluxerSelectItem<sdk.Locale> item) => item.value),
      isNot(contains(sdk.Locale.bg)),
    );
    expect(
      select.items.map((FluxerSelectItem<sdk.Locale> item) => item.value),
      contains(sdk.Locale.fr),
    );
  });

  testWidgets('renders language section on mobile', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_wrap(const UserLanguageAndTime()));
    await tester.pumpAndSettle();

    expect(find.text('Interface language'), findsOneWidget);
    expect(
      find.text('Choose the language used throughout the app'),
      findsOneWidget,
    );
    expect(find.text('English (United States) (English)'), findsOneWidget);
    expect(find.text('Open language settings'), findsOneWidget);
  }, skip: !Platform.isIOS && !Platform.isAndroid);
}
