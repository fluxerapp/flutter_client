import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/message_repository.dart';

void main() {
  group('buildForwardMessageBody', () {
    test('emits a type-1 reference with required ids and no content', () {
      final Map<String, dynamic> body = buildForwardMessageBody(
        sourceChannelId: 'chan_1',
        sourceMessageId: 'msg_1',
      );

      final Map<String, dynamic> reference =
          body['message_reference'] as Map<String, dynamic>;
      expect(reference['type'], 1);
      expect(reference['channel_id'], 'chan_1');
      expect(reference['message_id'], 'msg_1');

      expect(body.containsKey('content'), isFalse);
      expect(body.containsKey('embeds'), isFalse);
      expect(body.containsKey('attachments'), isFalse);
      expect(body.containsKey('sticker_ids'), isFalse);
      expect(body.containsKey('flags'), isFalse);
      expect(body.containsKey('nonce'), isFalse);
    });

    test('omits guild_id / media selectors when not supplied', () {
      final Map<String, dynamic> reference =
          buildForwardMessageBody(
                sourceChannelId: 'chan_1',
                sourceMessageId: 'msg_1',
                sourceGuildId: '',
                attachmentIds: const <String>[],
                embedIndices: const <int>[],
              )['message_reference']
              as Map<String, dynamic>;

      expect(reference.containsKey('guild_id'), isFalse);
      expect(reference.containsKey('attachment_ids'), isFalse);
      expect(reference.containsKey('embed_indices'), isFalse);
    });

    test('includes guild_id, media selectors and nonce when supplied', () {
      final Map<String, dynamic> body = buildForwardMessageBody(
        sourceChannelId: 'chan_1',
        sourceMessageId: 'msg_1',
        sourceGuildId: 'guild_1',
        attachmentIds: const <String>['a1', 'a2'],
        embedIndices: const <int>[0, 2],
        clientNonce: 'nonce_1',
      );

      final Map<String, dynamic> reference =
          body['message_reference'] as Map<String, dynamic>;
      expect(reference['guild_id'], 'guild_1');
      expect(reference['attachment_ids'], <String>['a1', 'a2']);
      expect(reference['embed_indices'], <int>[0, 2]);
      expect(body['nonce'], 'nonce_1');
    });

    test('sends the comment flags with the forward', () {
      final Map<String, dynamic> body = buildForwardMessageBody(
        sourceChannelId: 'chan_1',
        sourceMessageId: 'msg_1',
        messageFlags: 4096,
      );

      expect(body['flags'], 4096);
    });
  });

  group('forward comment body (buildMessageCreateBody)', () {
    test('is a plain content + nonce message with no reference', () {
      final Map<String, dynamic> body = buildMessageCreateBody(
        content: 'nice find',
        clientNonce: 'nonce_2',
      );

      expect(body['content'], 'nice find');
      expect(body['nonce'], 'nonce_2');
      expect(body.containsKey('message_reference'), isFalse);
    });
  });
}
