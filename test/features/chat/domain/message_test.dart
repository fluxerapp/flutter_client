import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/domain/message.dart';

Message _message({
  String content = 'body',
  DateTime? editedTimestamp,
  int flags = 0,
  bool isPinned = false,
  List<Embed> embeds = const [],
  List<Attachment> attachments = const [],
  List<Reaction> reactions = const [],
  List<String> mentionedUserIds = const [],
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
    type: 0,
    flags: 0,
    deliveryState: 1,
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
}
