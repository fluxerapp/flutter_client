import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_accessibility.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:material_ui/material_ui.dart';

import '../../helpers/test_l10n.dart';

class _InertSyncedPreferencesStore extends SyncedPreferencesStore {
  // Test stub does not use super parameters.
  // ignore: use_super_parameters
  _InertSyncedPreferencesStore(Ref ref) : super(ref);

  @override
  void markDirty(SyncedPreferenceField field) {}

  @override
  void scheduleFlush() {}
}

class _FakeAppearancePreferences extends AppearancePreferences {
  @override
  AppearancePreferencesState build() => const AppearancePreferencesState();

  @override
  Future<void> setScreenReaderAnnounceNewMessages({required bool value}) async {
    state = state.copyWith(screenReaderAnnounceNewMessages: value);
  }

  @override
  Future<void> setSyncReducedMotionWithSystem({required bool value}) async {
    state = state.copyWith(syncReducedMotionWithSystem: value);
  }

  @override
  Future<void> setReducedMotionOverride({required bool value}) async {
    state = state.copyWith(reducedMotionOverride: value);
  }

  @override
  Future<void> setAlwaysUnderlineLinks({required bool value}) async {
    state = state.copyWith(alwaysUnderlineLinks: value);
  }
}

class _FakeUserSettingsViewModel extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => const UserSettingsViewState(
    userId: '1',
    username: 'preview',
    displayName: 'Preview',
    discriminator: '0000',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: <String>[],
  );
}

class _TouchPrimaryModality extends InputModalityNotifier {
  @override
  bool build() => true;
}

class _MousePrimaryModality extends InputModalityNotifier {
  @override
  bool build() => false;
}

Widget _app(
  Widget child, {
  bool touchPrimary = false,
  Size surfaceSize = const Size(1200, 900),
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      syncedPreferencesStoreProvider.overrideWith(
        _InertSyncedPreferencesStore.new,
      ),
      appearancePreferencesProvider.overrideWith(
        _FakeAppearancePreferences.new,
      ),
      userSettingsViewModelProvider.overrideWith(
        _FakeUserSettingsViewModel.new,
      ),
      inputModalityProvider.overrideWith(
        touchPrimary ? _TouchPrimaryModality.new : _MousePrimaryModality.new,
      ),
    ],
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
        data: MediaQueryData(size: surfaceSize),
        child: Scaffold(body: child),
      ),
    ),
  );
}

void main() {
  testWidgets('shows web-ordered accessibility sections on desktop', (
    tester,
  ) async {
    await tester.pumpWidget(_app(const UserAccessibility()));
    await tester.pumpAndSettle();

    final FluxerLocalizations l10n = lookupFluxerLocalizations(
      const Locale('en', 'US'),
    );

    expect(find.text(l10n.accessibilityPreviewButtonLabel), findsOneWidget);
    expect(find.text(l10n.accessibilityVisualGroupTitle), findsOneWidget);
    expect(
      find.text(l10n.accessibilityAlwaysUnderlineLinksLabel),
      findsOneWidget,
    );
    expect(
      find.text(l10n.accessibilityScreenReaderAnnounceNewMessagesLabel),
      findsOneWidget,
    );
    expect(find.text(l10n.accessibilityKeyboardGroupTitle), findsOneWidget);
    expect(find.text(l10n.accessibilityAnimationGroupTitle), findsOneWidget);
    expect(find.text(l10n.accessibilityMotionGroupTitle), findsOneWidget);
    expect(find.text('Unread indicators'), findsNothing);
    expect(find.text('Media Buttons'), findsNothing);
  });

  testWidgets('hides keyboard section on touch-primary devices', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(const UserAccessibility(), touchPrimary: true),
    );
    await tester.pumpAndSettle();

    final FluxerLocalizations l10n = lookupFluxerLocalizations(
      const Locale('en', 'US'),
    );

    expect(find.text(l10n.accessibilityKeyboardGroupTitle), findsNothing);
    expect(find.text(l10n.accessibilityMotionGroupTitle), findsOneWidget);
  });

  testWidgets('hides preview on mobile layout', (tester) async {
    await tester.pumpWidget(
      _app(const UserAccessibility(), surfaceSize: const Size(390, 844)),
    );
    await tester.pumpAndSettle();

    final FluxerLocalizations l10n = lookupFluxerLocalizations(
      const Locale('en', 'US'),
    );

    expect(find.text(l10n.accessibilityPreviewButtonLabel), findsNothing);
    expect(find.text(l10n.accessibilityVisualGroupTitle), findsOneWidget);
  });
}
