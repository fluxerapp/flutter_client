import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/accessibility/providers/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:riverpod/src/framework.dart' show Override;

import 'open_test_database.dart';

void messageItemTestWidgets(
  String description,
  WidgetTesterCallback callback, {
  bool skip = false,
  Timeout? timeout,
}) {
  testWidgets(
    description,
    (WidgetTester tester) async {
      await callback(tester);
      await releaseTestWidgetTree(tester);
    },
    skip: skip,
    timeout: timeout,
  );
}

const UserSettingsViewState kMessageItemTestUserSettings =
    UserSettingsViewState(
      userId: 'test-user',
      username: 'tester',
      displayName: 'Tester',
      discriminator: '0000',
      avatar: null,
      avatarColor: null,
      memberSince: null,
      status: 'online',
      messageDisplayCompact: false,
      developerMode: false,
      trustedDomains: <String>[],
    );

class _TestUserSettings extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => kMessageItemTestUserSettings;
}

class _TestAdvancedPreferences extends AdvancedPreferences {
  @override
  AdvancedPreferencesState build() => const AdvancedPreferencesState();
}

class _TestAppearancePreferences extends AppearancePreferences {
  @override
  AppearancePreferencesState build() => const AppearancePreferencesState();
}

List<Override> messageItemTestProviderOverrides() => [
  advancedPreferencesProvider.overrideWith(_TestAdvancedPreferences.new),
  appearancePreferencesProvider.overrideWith(_TestAppearancePreferences.new),
  userSettingsViewModelProvider.overrideWith(_TestUserSettings.new),
  androidAnimatorDurationDisabledProvider.overrideWith(
    (ref) => Stream<bool>.value(false),
  ),
];
