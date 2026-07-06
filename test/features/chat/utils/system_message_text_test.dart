import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/call_duration_format.dart';
import 'package:fluxer_app/features/chat/utils/system_message_text.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations_en.dart';

void main() {
  group('resolveGuildJoinMessage', () {
    final l10n = FluxerLocalizationsEn();

    test('falls back to the first message for invalid ids', () {
      expect(
        resolveGuildJoinMessage(
          l10n,
          messageId: 'not-a-snowflake',
          username: 'Sample User',
        ),
        "Glad you're here, Sample User!",
      );
    });

    test('preserves the username placeholder for rich text rendering', () {
      final template = resolveGuildJoinMessageTemplate(l10n, messageId: '0');

      expect(template, contains(kSystemMessageUsernamePlaceholder));
      expect(template, isNot(contains('Sample User')));
    });

    test('welcome variants match desktop order', () {
      expect(
        <String>[
          for (final builder in guildJoinMessageBuilders(l10n)) builder('X'),
        ],
        <String>[
          "Glad you're here, X!",
          'Welcome, X! Make yourself at home.',
          'Hello, X! Nice to have you here.',
          "Hello, X! Jump in whenever you're ready.",
          'Hey X, great to see you here!',
          'Hey there, X! Hope you enjoy your stay.',
          'Hey, X, welcome aboard!',
          'Glad you made it, X!',
          'Welcome in, X!',
          'Welcome, X!',
          "Welcome, X! We're glad you're here.",
          'Welcome, X! Hope you enjoy your time here.',
          'Welcome, X! Your next conversation starts here.',
          "Welcome, X. We're happy to have you here.",
          'Great to see you, X! Welcome in.',
          "You're here, X! Good to have you with us.",
          "You've arrived, X! Let's get started.",
        ],
      );
    });
  });

  group('resolvePinMessageTemplate', () {
    final l10n = FluxerLocalizationsEn();

    test('preserves username and link markers for rich text rendering', () {
      final template = resolvePinMessageTemplate(l10n);

      expect(template, contains(kSystemMessageUsernamePlaceholder));
      expect(template, contains(kSystemMessageMessageLinkPlaceholder));
      expect(template, contains(kSystemMessageAllPinsLinkPlaceholder));
      expect(template, isNot(contains('Sample User')));
    });
  });

  group('stringifySystemMessage', () {
    final l10n = FluxerLocalizationsEn();

    test('formats recipient remove self-leave', () {
      final String? text = stringifySystemMessage(
        l10n: l10n,
        message: Message(
          id: '1',
          channelId: 'c1',
          authorId: 'u1',
          authorName: 'Monty',
          content: '',
          timestamp: DateTime(2026),
          type: messageTypeRecipientRemove,
          mentionedUserIds: const <String>['u1'],
        ),
        authorName: 'Monty',
      );
      expect(text, 'Monty has left the group.');
    });

    test('formats unknown system message types', () {
      final String? text = stringifySystemMessage(
        l10n: l10n,
        message: Message(
          id: '1',
          channelId: 'c1',
          authorId: 'u1',
          authorName: 'Monty',
          content: 'legacy',
          timestamp: DateTime(2026),
          type: 42,
        ),
        authorName: 'Monty',
      );
      expect(text, 'Update Fluxer to view this message.');
    });
  });

  group('formatCallDuration', () {
    final l10n = FluxerLocalizationsEn();

    test('returns few seconds for short calls', () {
      expect(
        formatCallDuration(l10n: l10n, durationSeconds: 15),
        'a few seconds',
      );
    });

    test('formats multi-unit durations with conjunction', () {
      expect(
        formatCallDuration(l10n: l10n, durationSeconds: 3660),
        '1 hour and a minute',
      );
    });
  });
}
