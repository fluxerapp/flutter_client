import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';
import 'package:fluxer_dart/export.dart';

Message _message({
  String content = 'body',
  DateTime? editedTimestamp,
  int flags = 0,
  bool isPinned = false,
  List<Embed> embeds = const [],
  List<Attachment> attachments = const [],
  List<Reaction> reactions = const [],
  List<String> mentionedUserIds = const [],
  MessageTranslation? translation,
}) {
  return Message(
    id: '0001',
    channelId: 'channel-1',
    authorId: 'author-1',
    authorName: 'Author',
    content: content,
    timestamp: DateTime.utc(2026),
    editedTimestamp: editedTimestamp,
    flags: flags,
    isPinned: isPinned,
    embeds: embeds,
    attachments: attachments,
    reactions: reactions,
    mentionedUserIds: mentionedUserIds,
    translation: translation,
  );
}

db.Message _emptyRow() {
  return db.Message(
    id: '0001',
    channelId: 'channel-1',
    authorId: 'author-1',
    authorName: 'Author',
    authorIsBot: false,
    authorIsSystem: false,
    authorPublicFlags: 0,
    content: 'hello',
    timestamp: DateTime.utc(2026),
    embedsJson: '[]',
    attachmentsJson: '[]',
    stickersJson: '[]',
    reactionsJson: '[]',
    messageSnapshotsJson: '[]',
    pinned: false,
    isMentioned: false,
    mentionedUserIdsJson: '[]',
    mentionChannelsJson: '[]',
    type: 0,
    flags: 0,
    deliveryState: 1,
    translationShowOriginal: false,
  );
}

const Attachment _attachmentA = Attachment(
  id: 'a1',
  filename: 'f.png',
  url: 'https://example.test/f.png',
);

void main() {
  group('Message.isRenderEquivalent', () {
    test('true for two field-identical instances built separately', () {
      final a = _message(
        embeds: [const Embed(type: EmbedType.image, url: 'https://x/y.png')],
        attachments: [_attachmentA],
        reactions: [const Reaction(emoji: '👍', count: 2)],
        mentionedUserIds: ['u1', 'u2'],
      );
      final b = _message(
        embeds: [const Embed(type: EmbedType.image, url: 'https://x/y.png')],
        attachments: [
          const Attachment(
            id: 'a1',
            filename: 'f.png',
            url: 'https://example.test/f.png',
          ),
        ],
        reactions: [const Reaction(emoji: '👍', count: 2)],
        mentionedUserIds: ['u1', 'u2'],
      );
      expect(identical(a, b), isFalse);
      expect(a.isRenderEquivalent(b), isTrue);
    });

    test('false when content differs', () {
      expect(
        _message(content: 'a').isRenderEquivalent(_message(content: 'b')),
        isFalse,
      );
    });

    test('false when editedTimestamp differs', () {
      expect(
        _message().isRenderEquivalent(
          _message(editedTimestamp: DateTime.utc(2026, 1, 2)),
        ),
        isFalse,
      );
    });

    test('false when flags differ', () {
      expect(_message().isRenderEquivalent(_message(flags: 1)), isFalse);
    });

    test('false when isPinned differs', () {
      expect(_message().isRenderEquivalent(_message(isPinned: true)), isFalse);
    });

    test('false when a reaction count differs', () {
      expect(
        _message(
          reactions: [const Reaction(emoji: '👍', count: 1)],
        ).isRenderEquivalent(
          _message(reactions: [const Reaction(emoji: '👍', count: 2)]),
        ),
        isFalse,
      );
    });

    test('false when an embed differs', () {
      expect(
        _message(
          embeds: [const Embed(type: EmbedType.image, url: 'https://x/1.png')],
        ).isRenderEquivalent(
          _message(
            embeds: [
              const Embed(type: EmbedType.image, url: 'https://x/2.png'),
            ],
          ),
        ),
        isFalse,
      );
    });

    test('false when an attachment differs', () {
      expect(
        _message(attachments: [_attachmentA]).isRenderEquivalent(
          _message(
            attachments: [
              const Attachment(
                id: 'a2',
                filename: 'g.png',
                url: 'https://example.test/g.png',
              ),
            ],
          ),
        ),
        isFalse,
      );
    });
  });

  group('Embed.isMediaOnlyEmbed', () {
    test('is true for a Fluxer video link with no rich fields', () {
      const Embed embed = Embed(
        type: EmbedType.video,
        url: 'https://cdn.fluxer.app/attachments/1/2/clip.mp4',
        video: EmbedMedia(
          url: 'https://cdn.fluxer.app/attachments/1/2/clip.mp4',
          width: 1280,
          height: 720,
        ),
      );
      expect(embed.hasRichEmbedContent, isFalse);
      expect(embed.isMediaOnlyEmbed, isTrue);
    });

    test('is false for a video embed with a provider', () {
      const Embed embed = Embed(
        type: EmbedType.video,
        url: 'https://www.youtube.com/watch?v=abc',
        providerName: 'YouTube',
        providerUrl: 'https://www.youtube.com',
        title: 'A clip',
        video: EmbedMedia(
          url: 'https://www.youtube.com/embed/abc',
          width: 1280,
          height: 720,
        ),
      );
      expect(embed.hasRichEmbedContent, isTrue);
      expect(embed.isMediaOnlyEmbed, isFalse);
    });

    test('treats gifv provider as media-only', () {
      const Embed embed = Embed(
        type: EmbedType.gifv,
        url: 'https://tenor.example/a',
        providerName: 'Tenor',
        video: EmbedMedia(url: 'https://tenor.example/a.mp4'),
        thumbnail: EmbedMedia(url: 'https://tenor.example/a.gif'),
      );
      expect(embed.hasRichEmbedContent, isFalse);
      expect(embed.isMediaOnlyEmbed, isTrue);
    });
  });

  group('Message.shouldHideContent', () {
    const Embed imageEmbed = Embed(
      type: EmbedType.image,
      url: 'https://cdn.fluxer.app/attachments/1/2/pic.png',
      thumbnail: EmbedMedia(
        url: 'https://cdn.fluxer.app/attachments/1/2/pic.png',
      ),
    );
    const Embed videoEmbed = Embed(
      type: EmbedType.video,
      url: 'https://cdn.fluxer.app/attachments/1/2/clip.mp4',
      video: EmbedMedia(
        url: 'https://cdn.fluxer.app/attachments/1/2/clip.mp4',
        width: 1280,
        height: 720,
      ),
    );

    test('hides a pasted image url when embeds are rendered', () {
      expect(
        _message(
          content: 'https://cdn.fluxer.app/attachments/1/2/pic.png',
          embeds: const [imageEmbed],
        ).shouldHideContent(renderEmbeds: true),
        isTrue,
      );
    });

    test('hides a pasted Fluxer video url when embeds are rendered', () {
      expect(
        _message(
          content: 'https://cdn.fluxer.app/attachments/1/2/clip.mp4',
          embeds: const [videoEmbed],
        ).shouldHideContent(renderEmbeds: true),
        isTrue,
      );
    });

    test('keeps youtube-style video urls visible', () {
      expect(
        _message(
          content: 'https://www.youtube.com/watch?v=abc',
          embeds: const [
            Embed(
              type: EmbedType.video,
              url: 'https://www.youtube.com/watch?v=abc',
              providerName: 'YouTube',
              providerUrl: 'https://www.youtube.com',
              title: 'A clip',
              video: EmbedMedia(
                url: 'https://www.youtube.com/embed/abc',
                width: 1280,
                height: 720,
              ),
            ),
          ],
        ).shouldHideContent(renderEmbeds: true),
        isFalse,
      );
    });

    test('keeps the url when extra text is present', () {
      expect(
        _message(
          content: 'watch https://cdn.fluxer.app/attachments/1/2/clip.mp4',
          embeds: const [videoEmbed],
        ).shouldHideContent(renderEmbeds: true),
        isFalse,
      );
    });

    test('keeps the url when embeds are suppressed', () {
      expect(
        _message(
          content: 'https://cdn.fluxer.app/attachments/1/2/clip.mp4',
          embeds: const [videoEmbed],
          flags: messageFlagSuppressEmbeds,
        ).shouldHideContent(renderEmbeds: true),
        isFalse,
      );
    });
  });

  group('Message.embedsCopyableText', () {
    const Embed richEmbed = Embed(
      type: EmbedType.rich,
      providerName: 'Provider',
      author: EmbedAuthor(name: 'Author'),
      title: 'Title',
      description: 'Description',
      fields: [EmbedField(name: 'Field', value: 'Value')],
      footer: EmbedFooter(text: 'Footer'),
    );

    test('joins every text part in render order, one per line', () {
      expect(
        _message(embeds: const [richEmbed]).embedsCopyableText,
        'Provider\nAuthor\nTitle\nDescription\nField: Value\nFooter',
      );
    });

    test('skips media-only embeds and separates embeds with a blank line', () {
      final Message message = _message(
        embeds: const [
          Embed(type: EmbedType.image, url: 'https://x/y.png'),
          Embed(type: EmbedType.link, title: 'One', description: ' '),
          Embed(type: EmbedType.link, description: 'Two'),
        ],
      );
      expect(message.embedsCopyableText, 'One\n\nTwo');
    });

    test('is empty when embeds are suppressed', () {
      expect(
        _message(
          embeds: const [richEmbed],
          flags: messageFlagSuppressEmbeds,
        ).embedsCopyableText,
        isEmpty,
      );
    });
  });

  group('Message.fromRow empty sub-objects', () {
    test('returns shared const empty lists without decoding', () {
      // Fast path returns a canonical const []; old decode allocated fresh.
      final a = Message.fromRow(_emptyRow());
      final b = Message.fromRow(_emptyRow());
      expect(identical(a.embeds, b.embeds), isTrue);
      expect(identical(a.attachments, b.attachments), isTrue);
      expect(identical(a.stickers, b.stickers), isTrue);
      expect(identical(a.reactions, b.reactions), isTrue);
      expect(identical(a.messageSnapshots, b.messageSnapshots), isTrue);
      expect(identical(a.mentionedUserIds, b.mentionedUserIds), isTrue);
      expect(a.embeds, isEmpty);
      expect(a.mentionedUserIds, isEmpty);
    });
  });

  group('Message mention channels', () {
    test('round-trips mention channels from row', () {
      final db.Message row = db.Message(
        id: '0001',
        channelId: 'channel-1',
        authorId: 'author-1',
        authorName: 'Author',
        authorIsBot: false,
        authorIsSystem: false,
        authorPublicFlags: 0,
        content: 'see <#100>',
        timestamp: DateTime.utc(2026),
        embedsJson: '[]',
        attachmentsJson: '[]',
        stickersJson: '[]',
        reactionsJson: '[]',
        messageSnapshotsJson: '[]',
        pinned: false,
        isMentioned: false,
        mentionedUserIdsJson: '[]',
        mentionChannelsJson: '[{"id":"100","name":"rules","type":0}]',
        type: 0,
        flags: 0,
        deliveryState: 1,
        translationShowOriginal: false,
      );
      final Message parsed = Message.fromRow(row);
      expect(parsed.mentionChannels, hasLength(1));
      expect(parsed.mentionChannels.first.id, '100');
      expect(parsed.mentionChannels.first.name, 'rules');
      expect(parsed.mentionChannels.first.type, 0);
    });
  });

  group('Message translation', () {
    const MessageTranslation translation = MessageTranslation(
      translatedContent: 'Hello world',
      sourceLanguageCode: 'de',
      sourceContent: 'Hallo Welt',
      targetLanguageCode: 'en',
    );

    test('isValidFor is false after the source content changes', () {
      expect(translation.isValidFor('Hallo Welt'), isTrue);
      expect(translation.isValidFor('Hallo Welt!'), isFalse);
    });

    test('withStoredTranslation keeps the cache when content matches', () {
      final Message translated = _message(content: 'Hallo Welt')
          .withStoredTranslation(
            const MessageTranslationSnapshot(
              content: 'Hallo Welt',
              translation: translation,
            ),
          );
      expect(translated.translation?.translatedContent, 'Hello world');
    });

    test('withStoredTranslation drops the cache when content changed', () {
      final Message translated =
          _message(
            content: 'Hallo Welt!',
            translation: translation,
          ).withStoredTranslation(
            const MessageTranslationSnapshot(
              content: 'Hallo Welt',
              translation: translation,
            ),
          );
      expect(translated.translation, isNull);
    });

    test('displayedContent uses the translation until original is shown', () {
      final Message translated = _message(
        content: 'Hallo Welt',
        translation: translation,
      );
      expect(translated.displayedContent, 'Hello world');
      expect(
        translated
            .copyWith(translation: translation.copyWith(showOriginal: true))
            .displayedContent,
        'Hallo Welt',
      );
    });

    test('isRenderEquivalent is false when translation visibility changes', () {
      final Message a = _message(
        content: 'Hallo Welt',
        translation: translation,
      );
      final Message b = _message(
        content: 'Hallo Welt',
        translation: translation.copyWith(showOriginal: true),
      );
      expect(a.isRenderEquivalent(b), isFalse);
    });

    test('fromRow restores a stored translation', () {
      final db.Message row = db.Message(
        id: '0001',
        channelId: 'channel-1',
        authorId: 'author-1',
        authorName: 'Author',
        authorIsBot: false,
        authorIsSystem: false,
        authorPublicFlags: 0,
        content: 'Hallo Welt',
        timestamp: DateTime.utc(2026),
        embedsJson: '[]',
        attachmentsJson: '[]',
        stickersJson: '[]',
        reactionsJson: '[]',
        messageSnapshotsJson: '[]',
        pinned: false,
        isMentioned: false,
        mentionedUserIdsJson: '[]',
        mentionChannelsJson: '[]',
        type: 0,
        flags: 0,
        deliveryState: 1,
        translatedContent: 'Hello world',
        translationSourceLanguage: 'de',
        translatedSourceContent: 'Hallo Welt',
        translationTargetLanguage: 'en',
        translationShowOriginal: true,
      );
      final Message parsed = Message.fromRow(row);
      expect(parsed.translation, isNotNull);
      expect(parsed.translation!.translatedContent, 'Hello world');
      expect(parsed.translation!.showOriginal, isTrue);
      expect(parsed.toCompanion().translatedContent.present, isFalse);
    });

    test('applyGatewayUpdate clears translation when content changes', () {
      final Message existing = _message(
        content: 'Hallo Welt',
        translation: translation,
      );
      final Message updated = existing.applyGatewayUpdate(
        MessageResponseSchema(
          id: '0001',
          channelId: 'channel-1',
          author: const UserPartialResponse(
            id: 'author-1',
            username: 'Author',
            discriminator: '0001',
            globalName: null,
            avatar: null,
            avatarColor: null,
            flags: 0,
          ),
          type: MessageResponseSchemaTypeType.valueDefault,
          flags: 0,
          content: 'Hallo Welt!',
          timestamp: DateTime.utc(2026),
          pinned: false,
          mentionEveryone: false,
          tts: false,
          mentions: const [],
          mentionRoles: const [],
        ),
      );
      expect(updated.content, 'Hallo Welt!');
      expect(updated.translation, isNull);
    });

    test('applyGatewayUpdate keeps translation when content is unchanged', () {
      final Message existing = _message(
        content: 'Hallo Welt',
        translation: translation,
      );
      final Message updated = existing.applyGatewayUpdate(
        MessageResponseSchema(
          id: '0001',
          channelId: 'channel-1',
          author: const UserPartialResponse(
            id: 'author-1',
            username: 'Author',
            discriminator: '0001',
            globalName: null,
            avatar: null,
            avatarColor: null,
            flags: 0,
          ),
          type: MessageResponseSchemaTypeType.valueDefault,
          flags: 0,
          content: 'Hallo Welt',
          timestamp: DateTime.utc(2026),
          pinned: false,
          mentionEveryone: false,
          tts: false,
          mentions: const [],
          mentionRoles: const [],
        ),
      );
      expect(updated.translation, isNotNull);
      expect(updated.translation!.translatedContent, 'Hello world');
    });
  });

  group('Message.fromRows', () {
    test('matches fromRow for embed and attachment JSON', () {
      final db.Message row = db.Message(
        id: '0001',
        channelId: 'channel-1',
        authorId: 'author-1',
        authorName: 'Author',
        authorIsBot: false,
        authorIsSystem: false,
        authorPublicFlags: 0,
        content: 'hello',
        timestamp: DateTime.utc(2026),
        embedsJson: jsonEncode(<Map<String, Object?>>[
          <String, Object?>{
            'type': 'image',
            'url': 'https://example.test/a.png',
          },
        ]),
        attachmentsJson: jsonEncode(<Map<String, Object?>>[
          <String, Object?>{
            'id': 'a1',
            'filename': 'f.png',
            'url': 'https://example.test/f.png',
          },
        ]),
        stickersJson: '[]',
        reactionsJson: jsonEncode(<Map<String, Object?>>[
          <String, Object?>{'emoji': '👍', 'count': 2},
        ]),
        messageSnapshotsJson: '[]',
        pinned: false,
        isMentioned: false,
        mentionedUserIdsJson: '[]',
        mentionChannelsJson: '[]',
        type: 0,
        flags: 0,
        deliveryState: 1,
        translationShowOriginal: false,
      );
      final List<db.Message> rows = List<db.Message>.filled(8, row);
      final List<Message> decoded = Message.fromRows(rows);
      expect(decoded, hasLength(8));
      expect(decoded.first.isRenderEquivalent(Message.fromRow(row)), isTrue);
      expect(decoded.first.embeds, hasLength(1));
      expect(decoded.first.attachments, hasLength(1));
      expect(decoded.first.reactions, hasLength(1));
    });

    test('fromRowsAsync isolate path matches fromRows', () async {
      final db.Message row = _emptyRow();
      final List<db.Message> rows = <db.Message>[
        for (int i = 0; i < 8; i++)
          db.Message(
            id: '$i',
            channelId: row.channelId,
            authorId: row.authorId,
            authorName: row.authorName,
            authorIsBot: row.authorIsBot,
            authorIsSystem: row.authorIsSystem,
            authorPublicFlags: row.authorPublicFlags,
            content: row.content,
            timestamp: row.timestamp,
            embedsJson: row.embedsJson,
            attachmentsJson: row.attachmentsJson,
            stickersJson: row.stickersJson,
            reactionsJson: row.reactionsJson,
            messageSnapshotsJson: row.messageSnapshotsJson,
            pinned: row.pinned,
            isMentioned: row.isMentioned,
            mentionedUserIdsJson: row.mentionedUserIdsJson,
            mentionChannelsJson: row.mentionChannelsJson,
            type: row.type,
            flags: row.flags,
            deliveryState: row.deliveryState,
            translationShowOriginal: row.translationShowOriginal,
          ),
      ];
      final List<Message> isolated = await Message.fromRowsAsync(rows);
      final List<Message> sync = Message.fromRows(rows);
      expect(isolated, hasLength(sync.length));
      for (int i = 0; i < sync.length; i++) {
        expect(isolated[i].isRenderEquivalent(sync[i]), isTrue);
      }
    });
  });
}
