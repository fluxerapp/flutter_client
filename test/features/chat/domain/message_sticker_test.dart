import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_dart/export.dart' as sdk;

void main() {
  test('MessageSticker converts from sdk and json', () {
    final sticker = MessageSticker.fromSdk(
      const sdk.MessageStickerResponse(
        id: 'sticker-1',
        name: 'party_blob',
        animated: true,
      ),
    );

    expect(sticker.id, 'sticker-1');
    expect(sticker.name, 'party_blob');
    expect(sticker.animated, isTrue);
    expect(sticker.toJson(), {
      'id': 'sticker-1',
      'name': 'party_blob',
      'animated': true,
    });
    expect(MessageSticker.fromJson(sticker.toJson()).animated, isTrue);
  });

  test('Message.fromSdk preserves stickers', () {
    final message = Message.fromSdk(
      sdk.MessageResponseSchema(
        id: 'message-1',
        channelId: 'channel-1',
        author: const sdk.UserPartialResponse(
          id: 'user-1',
          username: 'monty',
          discriminator: '0001',
          globalName: null,
          avatar: null,
          avatarColor: null,
          flags: 0,
        ),
        type: sdk.MessageResponseSchemaTypeType.valueDefault,
        flags: 0,
        content: '',
        timestamp: DateTime.utc(2026),
        pinned: false,
        mentionEveryone: false,
        tts: false,
        mentions: const [],
        mentionRoles: const [],
        stickers: const [
          sdk.MessageStickerResponse(
            id: 'sticker-1',
            name: 'party_blob',
            animated: true,
          ),
        ],
      ),
    );

    expect(message.hasStickers, isTrue);
    expect(message.stickers.single.id, 'sticker-1');
  });

  test('Message.fromRow decodes persisted stickers', () {
    final message = Message.fromRow(
      db.Message(
        id: 'message-1',
        channelId: 'channel-1',
        authorId: 'user-1',
        authorName: 'monty',
        authorIsBot: false,
        authorIsSystem: false,
        authorPublicFlags: 0,
        content: '',
        timestamp: DateTime.utc(2026),
        embedsJson: '[]',
        attachmentsJson: '[]',
        stickersJson:
            '[{"id":"sticker-1","name":"party_blob","animated":true}]',
        reactionsJson: '[]',
        messageSnapshotsJson: '[]',
        pinned: false,
        isMentioned: false,
        mentionedUserIdsJson: '[]',
        mentionChannelsJson: '[]',
        type: 0,
        flags: 0,
        deliveryState: MessageDeliveryState.sent.index,
      ),
    );

    expect(message.stickers.single.name, 'party_blob');
    expect(message.toCompanion().stickersJson.value, contains('sticker-1'));
  });

  test('Message supports delivery state transitions', () {
    final base = Message(
      id: 'local-1',
      channelId: 'channel-1',
      authorId: 'user-1',
      authorName: 'Test',
      content: 'hello',
      timestamp: DateTime.utc(2026),
      deliveryState: MessageDeliveryState.sending,
      clientNonce: 'local-1',
    );

    final failed = base.copyWith(
      deliveryState: MessageDeliveryState.failed,
      sendError: 'Failed to send message',
    );
    final sent = failed.copyWith(
      id: 'server-1',
      deliveryState: MessageDeliveryState.sent,
      sendError: null,
    );

    expect(base.isSending, isTrue);
    expect(failed.hasFailed, isTrue);
    expect(failed.sendError, 'Failed to send message');
    expect(sent.id, 'server-1');
    expect(sent.deliveryState, MessageDeliveryState.sent);
  });
}
