import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer/mention_reply_preference_utils.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('resolveMentionReplyPreference', () {
    test('uses guild member override when set', () {
      final MentionReplyPreferences actual = resolveMentionReplyPreference(
        memberMentionFlags: MentionReplyPreferences.preferNoMention,
        userMentionFlags: MentionReplyPreferences.preferMention,
      );

      expect(actual, MentionReplyPreferences.preferNoMention);
    });

    test('falls back to user preference when member has no preference', () {
      final MentionReplyPreferences actual = resolveMentionReplyPreference(
        memberMentionFlags: MentionReplyPreferences.noPreference,
        userMentionFlags: MentionReplyPreferences.preferMention,
      );

      expect(actual, MentionReplyPreferences.preferMention);
    });
  });

  group('getReplyMentionPreferenceConflict', () {
    test('returns prefersMention when disabling against preferMention', () {
      final ReplyMentionPreferenceConflict? actual =
          getReplyMentionPreferenceConflict(
            mentioning: false,
            preference: MentionReplyPreferences.preferMention,
          );

      expect(actual, ReplyMentionPreferenceConflict.prefersMention);
    });

    test('returns prefersNoMention when enabling against preferNoMention', () {
      final ReplyMentionPreferenceConflict? actual =
          getReplyMentionPreferenceConflict(
            mentioning: true,
            preference: MentionReplyPreferences.preferNoMention,
          );

      expect(actual, ReplyMentionPreferenceConflict.prefersNoMention);
    });

    test('returns null when toggle matches preference', () {
      final ReplyMentionPreferenceConflict? actual =
          getReplyMentionPreferenceConflict(
            mentioning: true,
            preference: MentionReplyPreferences.preferMention,
          );

      expect(actual, isNull);
    });
  });

  group('getDefaultReplyMention', () {
    test('returns false for own messages', () {
      expect(
        getDefaultReplyMention(
          isOwnMessage: true,
          guildId: '1',
          preference: MentionReplyPreferences.noPreference,
        ),
        isFalse,
      );
    });

    test('returns false for direct messages', () {
      expect(
        getDefaultReplyMention(
          isOwnMessage: false,
          guildId: null,
          preference: MentionReplyPreferences.noPreference,
        ),
        isFalse,
      );
    });

    test('returns true when recipient prefers mention', () {
      expect(
        getDefaultReplyMention(
          isOwnMessage: false,
          guildId: '1',
          preference: MentionReplyPreferences.preferMention,
        ),
        isTrue,
      );
    });

    test('returns false when recipient prefers no mention', () {
      expect(
        getDefaultReplyMention(
          isOwnMessage: false,
          guildId: '1',
          preference: MentionReplyPreferences.preferNoMention,
        ),
        isFalse,
      );
    });

    test('uses fallback when recipient has no preference', () {
      expect(
        getDefaultReplyMention(
          isOwnMessage: false,
          guildId: '1',
          preference: MentionReplyPreferences.noPreference,
          fallbackMention: false,
        ),
        isFalse,
      );
    });
  });
}
