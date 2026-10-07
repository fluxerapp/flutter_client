import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/messages/spoiler_utils.dart';
import 'package:test/test.dart';

void main() {
  group('extractSpoileredUrls', () {
    test('extracts urls from spoiler blocks', () {
      expect(extractSpoileredUrls('||https://google.com||'), <String>{
        'https://google.com',
      });
      expect(
        extractSpoileredUrls('before ||https://youtu.be/abc|| after'),
        <String>{'https://youtu.be/abc'},
      );
    });
  });

  group('normalizeSpoilerUrl', () {
    test('lowercases host and strips trailing slash', () {
      expect(
        normalizeSpoilerUrl('https://WWW.Google.com/'),
        'https://www.google.com',
      );
    });
  });

  group('spoilerSyncKeysForEmbed', () {
    const Embed googleEmbed = Embed(
      type: EmbedType.link,
      url: 'https://www.google.com',
      title: 'Google',
      thumbnail: EmbedMedia(url: 'https://www.google.com/favicon.ico'),
    );

    test('matches www when spoiler omits www', () {
      final spoilered = extractSpoileredUrls('||https://google.com||');
      expect(spoilerSyncKeysForEmbed(googleEmbed, spoilered), <String>[
        'https://google.com',
      ]);
    });

    test('matches youtube watch url to youtu.be spoiler', () {
      const Embed youtubeEmbed = Embed(
        type: EmbedType.rich,
        url: 'https://www.youtube.com/watch?v=abc',
        providerName: 'YouTube',
        providerUrl: 'https://www.youtube.com',
        title: 'Clip',
        video: EmbedMedia(url: 'https://www.youtube.com/embed/abc'),
      );
      final spoilered = extractSpoileredUrls('||https://youtu.be/abc||');
      expect(spoilerSyncKeysForEmbed(youtubeEmbed, spoilered), <String>[
        'https://youtu.be/abc',
      ]);
    });

    test('matches exact fluxer embed url', () {
      const Embed fluxerEmbed = Embed(
        type: EmbedType.link,
        url: 'https://fluxer.app/foo',
        title: 'Fluxer',
      );
      final spoilered = extractSpoileredUrls('||https://fluxer.app/foo||');
      expect(spoilerSyncKeysForEmbed(fluxerEmbed, spoilered), <String>[
        'https://fluxer.app/foo',
      ]);
    });

    test('returns empty when spoiler url is unrelated', () {
      final spoilered = extractSpoileredUrls('||https://example.com||');
      expect(spoilerSyncKeysForEmbed(googleEmbed, spoilered), isEmpty);
    });
  });

  group('spoilerSyncKeysForMessageEmbed', () {
    test('single embed inherits spoiler urls when metadata does not match', () {
      const Embed embed = Embed(
        type: EmbedType.link,
        url: 'https://redirect.example/landing',
        title: 'Site',
      );
      expect(
        spoilerSyncKeysForMessageEmbed(
          messageContent: '||https://google.com||',
          embed: embed,
          messageEmbeds: const [embed],
        ),
        <String>['https://google.com'],
      );
    });

    test('skips fallback when message has text outside spoilers', () {
      const Embed embed = Embed(
        type: EmbedType.link,
        url: 'https://redirect.example/landing',
      );
      expect(
        spoilerSyncKeysForMessageEmbed(
          messageContent: 'look ||https://google.com||',
          embed: embed,
          messageEmbeds: const [embed],
        ),
        isEmpty,
      );
    });

    test('does not apply single-embed fallback when multiple embeds', () {
      const Embed a = Embed(type: EmbedType.link, url: 'https://a.com');
      const Embed b = Embed(type: EmbedType.link, url: 'https://b.com');
      expect(
        spoilerSyncKeysForMessageEmbed(
          messageContent: '||https://google.com||',
          embed: a,
          messageEmbeds: const [a, b],
        ),
        isEmpty,
      );
    });
  });

  group('forwardedSnapshotScope', () {
    test('scopes forwarded snapshot content to the wrapping message', () {
      expect(forwardedSnapshotScope('message-1'), 'message-1-forward');
    });
  });

  group('spoilerSyncKeysForAttachment', () {
    test('returns empty list for non-spoiler attachments', () {
      expect(
        spoilerSyncKeysForAttachment(
          scope: 'message-1',
          attachment: const Attachment(
            id: 'attachment-1',
            filename: 'image.png',
            url: 'https://cdn.example/image.png',
          ),
        ),
        isEmpty,
      );
    });

    test('uses attachment id in sync key', () {
      expect(
        spoilerSyncKeysForAttachment(
          scope: 'message-1',
          attachment: const Attachment(
            id: 'attachment-1',
            filename: 'secret.png',
            url: 'https://cdn.example/secret.png',
            flags: attachmentFlagIsSpoiler,
          ),
        ),
        <String>['attachment:message-1:attachment-1'],
      );
    });

    test('falls back to url when attachment id is empty', () {
      expect(
        spoilerSyncKeysForAttachment(
          scope: 'message-1',
          attachment: const Attachment(
            id: '',
            filename: 'secret.png',
            url: 'https://cdn.example/secret.png',
            flags: attachmentFlagIsSpoiler,
          ),
        ),
        <String>['attachment:message-1:https://cdn.example/secret.png'],
      );
    });

    test('uses forwarded snapshot scope without affecting message id', () {
      expect(
        spoilerSyncKeysForAttachment(
          scope: forwardedSnapshotScope('message-1'),
          attachment: const Attachment(
            id: 'attachment-1',
            filename: 'secret.png',
            url: 'https://cdn.example/secret.png',
            flags: attachmentFlagIsSpoiler,
          ),
        ),
        <String>['attachment:message-1-forward:attachment-1'],
      );
    });
  });
}
