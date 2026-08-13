import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/utils/guild_settings_actions.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('resolveGuildMessageNotificationsForDisplay', () {
    test('returns explicit stored levels unchanged', () {
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.onlyMentions,
        ),
        1,
      );
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.noMessages,
        ),
        2,
      );
    });

    test('resolves inherit to all messages by default', () {
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.inherit,
        ),
        0,
      );
    });

    test('resolves inherit to mentions only for large guilds', () {
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.inherit,
          memberCount: 251,
        ),
        1,
      );
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.inherit,
          features: const ['LARGE_GUILD_OVERRIDE'],
        ),
        1,
      );
    });
  });
}
