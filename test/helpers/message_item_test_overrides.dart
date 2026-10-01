import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/accessibility/providers/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:riverpod/src/framework.dart' show Override;

import 'open_test_database.dart';

void messageItemTestWidgets(
  String description,
  WidgetTesterCallback callback, {
  bool skip = false,
  Timeout? timeout,
}) {
  testWidgets(description, (WidgetTester tester) async {
    await callback(tester);
    await releaseTestWidgetTree(tester);
  }, skip: skip, timeout: timeout);
}

const UserSettingsViewState kMessageItemTestUserSettings = UserSettingsViewState(
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

List<Override> messageItemTestProviderOverrides() => [
  advancedPreferencesProvider.overrideWithValue(
    const AdvancedPreferencesState(),
  ),
  appearancePreferencesProvider.overrideWithValue(
    const AppearancePreferencesState(),
  ),
  userSettingsViewModelProvider.overrideWithValue(kMessageItemTestUserSettings),
  androidAnimatorDurationDisabledProvider.overrideWith(
    (ref) => Stream<bool>.value(false),
  ),
];
