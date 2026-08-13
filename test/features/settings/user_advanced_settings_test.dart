import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/observability_reporting_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_advanced_settings.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/settings/utils/platform_desktop_utils.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:riverpod/src/framework.dart';

import '../../helpers/test_l10n.dart';
import '../../helpers/wide_layout_test_sizes.dart';

class _InertSyncedPreferencesStore extends SyncedPreferencesStore {
  // ignore: use_super_parameters
  _InertSyncedPreferencesStore(Ref ref) : super(ref);

  @override
  void markDirty(SyncedPreferenceField field) {}

  @override
  void scheduleFlush() {}
}

class _FakeAdvancedPreferences extends AdvancedPreferences {
  @override
  AdvancedPreferencesState build() => const AdvancedPreferencesState();

  @override
  Future<void> setEnableTextSelection({required bool value}) async {
    state = state.copyWith(enableTextSelection: value);
  }
}

class _FakeAppearancePreferences extends AppearancePreferences {
  @override
  AppearancePreferencesState build() => const AppearancePreferencesState();
}

class _FakeChatPreferences extends ChatPreferences {
  @override
  ChatPreferencesState build() => const ChatPreferencesState();
}

class _FakeUserSettings extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => const UserSettingsViewState(
    userId: 'u1',
    username: 'tester',
    displayName: 'Tester',
    discriminator: '0',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: <String>[],
  );

  @override
  Future<void> setDeveloperMode({required bool value}) async {
    state = state.copyWith(developerMode: value);
  }
}

class _FakeVoiceSettings extends VoiceSettings {
  @override
  VoiceSettingsState build() => const VoiceSettingsState();
}

class _FakeObservabilityReporting extends ObservabilityReporting {
  @override
  bool build() => false;
}

List<Override> _overrides() {
  return [
    syncedPreferencesStoreProvider.overrideWith(
      _InertSyncedPreferencesStore.new,
    ),
    advancedPreferencesProvider.overrideWith(_FakeAdvancedPreferences.new),
    appearancePreferencesProvider.overrideWith(_FakeAppearancePreferences.new),
    chatPreferencesProvider.overrideWith(_FakeChatPreferences.new),
    userSettingsViewModelProvider.overrideWith(_FakeUserSettings.new),
    voiceSettingsProvider.overrideWith(_FakeVoiceSettings.new),
    observabilityReportingProvider.overrideWith(
      _FakeObservabilityReporting.new,
    ),
  ];
}

Widget _wrap(Widget child, {required Size size}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: _overrides(),
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: MediaQuery(
        data: MediaQueryData(size: size),
        child: Scaffold(body: child),
      ),
    ),
  );
}

void main() {
  Future<void> pumpAdvancedSettings(
    WidgetTester tester, {
    required Size size,
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(_wrap(const UserAdvancedSettings(), size: size));
    await tester.pumpAndSettle();
  }

  testWidgets('hides wide-layout text selection on narrow screens', (
    tester,
  ) async {
    await pumpAdvancedSettings(tester, size: const Size(400, 2000));
    expect(find.text('Enable text selection'), findsNothing);
    expect(find.text('Accessibility'), findsOneWidget);
    expect(find.text('Privacy'), findsOneWidget);
    expect(find.text('Enable video seek thumbnails'), findsOneWidget);
  });

  testWidgets('shows wide-layout text selection on wide screens', (
    tester,
  ) async {
    await pumpAdvancedSettings(
      tester,
      size: Size(kWideTestViewportSize.width, 2000),
    );
    expect(find.text('Enable text selection'), findsOneWidget);
  });

  testWidgets('hides keyboard hints on narrow mobile screens', (tester) async {
    if (isDesktopOs) {
      return;
    }
    await pumpAdvancedSettings(tester, size: const Size(400, 2000));
    expect(find.text('Keyboard hints'), findsNothing);
  });

  testWidgets('shows keyboard hints on wide screens', (tester) async {
    await pumpAdvancedSettings(
      tester,
      size: Size(kWideTestViewportSize.width, 2000),
    );
    expect(find.text('Keyboard hints'), findsOneWidget);
  });

  testWidgets('toggling developer mode updates provider state', (tester) async {
    await pumpAdvancedSettings(
      tester,
      size: Size(kWideTestViewportSize.width, 2000),
    );

    final container = ProviderScope.containerOf(
      tester.element(find.byType(UserAdvancedSettings)),
    );
    expect(
      container.read(userSettingsViewModelProvider).developerMode,
      isFalse,
    );

    final developerModeToggle = find.bySemanticsLabel(
      'Enable developer mode. Enable developer mode',
    );
    await tester.scrollUntilVisible(
      developerModeToggle,
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(developerModeToggle);
    await tester.pumpAndSettle();

    expect(container.read(userSettingsViewModelProvider).developerMode, isTrue);
  });

  testWidgets('toggling text selection updates advanced preferences', (
    tester,
  ) async {
    await pumpAdvancedSettings(
      tester,
      size: Size(kWideTestViewportSize.width, 2000),
    );

    final container = ProviderScope.containerOf(
      tester.element(find.byType(UserAdvancedSettings)),
    );
    expect(
      container.read(advancedPreferencesProvider).enableTextSelection,
      isFalse,
    );

    await tester.tap(find.text('Enable text selection'));
    await tester.pumpAndSettle();

    expect(
      container.read(advancedPreferencesProvider).enableTextSelection,
      isTrue,
    );
  });
}
