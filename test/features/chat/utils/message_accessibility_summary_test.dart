import 'dart:ui' show Locale;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/message_accessibility_summary.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart' hide Locale;

FluxerLocalizations _l10n() =>
    lookupFluxerLocalizations(const Locale('en', 'US'));

void main() {
  group('plainTextFromMessageContent', () {
    test('strips markdown formatting and spoilers', () {
      final FluxerLocalizations l10n = _l10n();
      expect(
        plainTextFromMessageContent('**hello** ||secret||', l10n),
        'hello Spoiler',
      );
    });

    test('replaces custom emoji syntax with names', () {
      final FluxerLocalizations l10n = _l10n();
      expect(
        plainTextFromMessageContent('wave <:wave:1475037642086498372>', l10n),
        'wave :wave:',
      );
    });

    test('replaces mention tokens with readable symbols', () {
      final FluxerLocalizations l10n = _l10n();
      expect(
        plainTextFromMessageContent('hey <@123> in <#456>', l10n),
        'hey @ in #',
      );
    });
  });

  group('messageAccessibilitySummary', () {
    test('uses plain text content when present', () {
      final FluxerLocalizations l10n = _l10n();
      final Message message = Message(
        id: '1',
        channelId: 'c1',
        authorId: 'a1',
        authorName: 'Alice',
        content: '**Hello** there',
        timestamp: DateTime.utc(2026),
      );

      expect(messageAccessibilitySummary(message, l10n), 'Hello there');
    });

    test('falls back to sticker name when content is empty', () {
      final FluxerLocalizations l10n = _l10n();
      final Message message = Message(
        id: '1',
        channelId: 'c1',
        authorId: 'a1',
        authorName: 'Alice',
        content: '',
        timestamp: DateTime.utc(2026),
        stickers: const [
          MessageSticker(id: 's1', name: 'Wave', animated: false),
        ],
      );

      expect(
        messageAccessibilitySummary(message, l10n),
        l10n.messageAccessibilityStickerSummary('Wave'),
      );
    });

    test('uses image summary for image attachments', () {
      final FluxerLocalizations l10n = _l10n();
      final Message message = Message(
        id: '1',
        channelId: 'c1',
        authorId: 'a1',
        authorName: 'Alice',
        content: '',
        timestamp: DateTime.utc(2026),
        attachments: const [
          Attachment(
            id: 'att1',
            filename: 'photo.png',
            size: 1,
            url: 'https://example.com/photo.png',
            contentType: 'image/png',
          ),
        ],
      );

      expect(
        messageAccessibilitySummary(message, l10n),
        l10n.messageAccessibilityImageSummary,
      );
    });

    test('uses voice message summary for voice attachments', () {
      final FluxerLocalizations l10n = _l10n();
      final Message message = Message(
        id: '1',
        channelId: 'c1',
        authorId: 'a1',
        authorName: 'Alice',
        content: '',
        timestamp: DateTime.utc(2026),
        flags: kMessageFlagVoiceMessage,
        attachments: const [
          Attachment(
            id: 'att1',
            filename: 'voice.ogg',
            size: 1,
            url: 'https://example.com/voice.ogg',
            contentType: 'audio/ogg',
            waveform: 'abc',
          ),
        ],
      );

      expect(
        messageAccessibilitySummary(message, l10n),
        l10n.voiceMessageTitle,
      );
    });

    test('uses embed title when content and attachments are empty', () {
      final FluxerLocalizations l10n = _l10n();
      final Message message = Message(
        id: '1',
        channelId: 'c1',
        authorId: 'a1',
        authorName: 'Alice',
        content: '',
        timestamp: DateTime.utc(2026),
        embeds: const [Embed(type: EmbedType.rich, title: 'Fluxer changelog')],
      );

      expect(messageAccessibilitySummary(message, l10n), 'Fluxer changelog');
    });

    test('uses forwarded snapshot content when message is forwarded', () {
      final FluxerLocalizations l10n = _l10n();
      final Message message = Message(
        id: '1',
        channelId: 'c1',
        authorId: 'a1',
        authorName: 'Alice',
        content: '',
        timestamp: DateTime.utc(2026),
        messageReference: const MessageReference(
          messageId: '2',
          channelId: 'c2',
          type: MessageReferenceType.forward,
        ),
        messageSnapshots: [
          MessageSnapshot(
            timestamp: DateTime.utc(2026),
            content: 'Forwarded note',
          ),
        ],
      );

      expect(messageAccessibilitySummary(message, l10n), 'Forwarded note');
    });

    test('truncates long summaries', () {
      final FluxerLocalizations l10n = _l10n();
      final String longContent = 'a' * 200;
      final Message message = Message(
        id: '1',
        channelId: 'c1',
        authorId: 'a1',
        authorName: 'Alice',
        content: longContent,
        timestamp: DateTime.utc(2026),
      );

      final String summary = messageAccessibilitySummary(message, l10n);
      expect(summary.length, kMessageAccessibilitySummaryMaxLength);
      expect(summary.endsWith('...'), isTrue);
    });
  });
}
