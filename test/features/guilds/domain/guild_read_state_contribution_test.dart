import 'package:fluxer_app/features/guilds/domain/guild_read_state_contribution.dart';
import 'package:fluxer_dart/export.dart';
import 'package:test/test.dart';

GuildReadStateContribution _contribution({
  bool isEligibleTextChannel = true,
  bool isPrivate = false,
  UserNotificationSettings? unreadBadgesLevel,
  bool isMutedForUnread = false,
  bool hasUnread = true,
  int mentionCount = 2,
}) {
  return resolveGuildReadStateContribution(
    isEligibleTextChannel: isEligibleTextChannel,
    isPrivate: isPrivate,
    unreadBadgesLevel: unreadBadgesLevel,
    isMutedForUnread: isMutedForUnread,
    hasUnread: hasUnread,
    mentionCount: mentionCount,
  );
}

void main() {
  group('resolveGuildReadStateContribution', () {
    test('suppresses channels that cannot contribute to guild read state', () {
      final GuildReadStateContribution result = _contribution(
        isEligibleTextChannel: false,
      );
      expect(result.mentionAllowed, isFalse);
      expect(result.unreadAllowed, isFalse);
    });

    test('keeps mention contribution when unread badges are disabled', () {
      final GuildReadStateContribution result = _contribution(
        unreadBadgesLevel: UserNotificationSettings.noMessages,
      );
      expect(result.mentionAllowed, isTrue);
      expect(result.unreadAllowed, isFalse);
    });

    test('applies unread badge policies before legacy mute behavior', () {
      final GuildReadStateContribution onlyMentions = _contribution(
        unreadBadgesLevel: UserNotificationSettings.onlyMentions,
      );
      expect(onlyMentions.mentionAllowed, isTrue);
      expect(onlyMentions.unreadAllowed, isFalse);

      final GuildReadStateContribution allMessages = _contribution(
        unreadBadgesLevel: UserNotificationSettings.allMessages,
      );
      expect(allMessages.mentionAllowed, isTrue);
      expect(allMessages.unreadAllowed, isTrue);
    });

    test(
      'keeps legacy muted channels mention-only and unmuted channels fully contributing',
      () {
        final GuildReadStateContribution muted = _contribution(
          isMutedForUnread: true,
        );
        expect(muted.mentionAllowed, isTrue);
        expect(muted.unreadAllowed, isFalse);

        final GuildReadStateContribution unmuted = _contribution();
        expect(unmuted.mentionAllowed, isTrue);
        expect(unmuted.unreadAllowed, isTrue);
      },
    );

    test('always allows private unread contribution when unread exists', () {
      final GuildReadStateContribution result = _contribution(
        isEligibleTextChannel: false,
        isPrivate: true,
        unreadBadgesLevel: UserNotificationSettings.noMessages,
        isMutedForUnread: true,
      );
      expect(result.mentionAllowed, isTrue);
      expect(result.unreadAllowed, isTrue);
    });

    test(
      'does not allow empty mentions or empty unread counts to contribute',
      () {
        final GuildReadStateContribution result = _contribution(
          mentionCount: 0,
          hasUnread: false,
        );
        expect(result.mentionAllowed, isFalse);
        expect(result.unreadAllowed, isFalse);
        expect(result.mentionCount, 0);
      },
    );
  });
}
