import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/utils/guild_notification_resolution.dart';
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

    test('resolves inherit to community default', () {
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.inherit,
          defaultMessageNotifications: 1,
        ),
        1,
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

    test('treats unknown stored values like inherit', () {
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.$unknown,
          defaultMessageNotifications: 1,
        ),
        1,
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
