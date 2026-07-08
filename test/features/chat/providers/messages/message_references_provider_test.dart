import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_references_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../helpers/open_test_database.dart';

Message _domainMessage({
  required String id,
  required String channelId,
  String content = 'hello',
}) {
  return Message(
    id: id,
    channelId: channelId,
    authorId: 'author-1',
    authorName: 'Author',
    content: content,
    timestamp: DateTime.utc(2026),
  );
}

MessageReference _replyReference({
  required String channelId,
  required String messageId,
}) {
  return MessageReference(
    channelId: channelId,
    messageId: messageId,
    type: MessageReferenceType.valueDefault,
  );
}

void main() {
  group('Message.fromSdk replyToId', () {
    test('uses message_reference when referenced_message is absent', () {
      final schema = MessageResponseSchema.fromJson(<String, Object?>{
        'id': '200',
        'channel_id': 'channel-1',
        'author': <String, Object?>{
          'id': 'author-1',
          'username': 'user',
          'discriminator': '0001',
          'global_name': null,
          'avatar': null,
          'avatar_color': null,
          'flags': 0,
        },
        'type': 0,
        'flags': 0,
        'content': 'reply',
        'timestamp': DateTime.utc(2026, 1, 2).toIso8601String(),
        'pinned': false,
        'mention_everyone': false,
        'tts': false,
        'mentions': <Object?>[],
        'mention_roles': <Object?>[],
        'message_reference': <String, Object?>{
          'channel_id': 'channel-1',
          'message_id': '100',
          'type': 0,
        },
      });

      final message = Message.fromSdk(schema);
      expect(message.replyToId, '100');
      expect(message.isReply, isTrue);
    });

    test('forward reference keeps replyToId but isReply is false', () {
      final schema = MessageResponseSchema.fromJson(<String, Object?>{
        'id': '300',
        'channel_id': 'channel-2',
        'author': <String, Object?>{
          'id': 'author-1',
          'username': 'user',
          'discriminator': '0001',
          'global_name': null,
          'avatar': null,
          'avatar_color': null,
          'flags': 0,
        },
        'type': 0,
        'flags': 0,
        'content': '',
        'timestamp': DateTime.utc(2026, 1, 3).toIso8601String(),
        'pinned': false,
        'mention_everyone': false,
        'tts': false,
        'mentions': <Object?>[],
        'mention_roles': <Object?>[],
        'message_reference': <String, Object?>{
          'channel_id': 'channel-1',
          'message_id': '100',
          'type': 1,
        },
        'message_snapshots': <Object?>[
          <String, Object?>{
            'type': 0,
            'flags': 0,
            'content': 'forwarded text',
            'timestamp': DateTime.utc(2026).toIso8601String(),
          },
        ],
      });

      final message = Message.fromSdk(schema);
      expect(message.replyToId, '100');
      expect(message.isReply, isFalse);
      expect(message.isForwarded, isTrue);
    });
  });

  group('MessageReferencesNotifier', () {
    late FluxerDatabase database;
    late ProviderContainer container;

    setUp(() {
      database = openTestDatabase();
      container = ProviderContainer(
        overrides: [fluxerDatabaseProvider.overrideWithValue(database)],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('resolveSync returns loaded when parent is in channel messages', () {
      final notifier = container.read(messageReferencesProvider.notifier);
      final parent = _domainMessage(id: '100', channelId: 'channel-1');
      final resolution = notifier.resolveSync(
        channelId: 'channel-1',
        messageId: '100',
        channelMessages: [parent],
      );
      expect(resolution.state, MessageReferenceState.loaded);
      expect(resolution.message?.id, '100');
    });

    test('marks deleted after gateway delete event', () {
      final notifier = container.read(messageReferencesProvider.notifier)
        ..onMessageDeleted(channelId: 'channel-1', messageId: '100');
      final resolution = notifier.resolveSync(
        channelId: 'channel-1',
        messageId: '100',
        channelMessages: const [],
      );
      expect(resolution.state, MessageReferenceState.deleted);
    });

    test('caches parent from embedded referenced_message payload', () {
      final notifier = container.read(messageReferencesProvider.notifier);
      final reply = _domainMessage(id: '200', channelId: 'channel-1').copyWith(
        messageReference: _replyReference(
          channelId: 'channel-1',
          messageId: '100',
        ),
        replyToId: '100',
      );
      final parent = _domainMessage(
        id: '100',
        channelId: 'channel-1',
        content: 'parent text',
      );
      notifier.onMessagesLoaded(
        channelId: 'channel-1',
        messages: [reply],
        embeddedReplyParents: [parent],
      );
      final resolution = notifier.resolveSync(
        channelId: 'channel-1',
        messageId: '100',
        channelMessages: const [],
      );
      expect(resolution.state, MessageReferenceState.loaded);
      expect(resolution.message?.content, 'parent text');
    });

    test('returns notLoaded when parent is unresolved', () {
      final notifier = container.read(messageReferencesProvider.notifier);
      final reply = _domainMessage(id: '200', channelId: 'channel-1').copyWith(
        messageReference: _replyReference(
          channelId: 'channel-1',
          messageId: '100',
        ),
        replyToId: '100',
      );
      notifier.onMessagesLoaded(channelId: 'channel-1', messages: [reply]);
      final resolution = notifier.resolveSync(
        channelId: 'channel-1',
        messageId: '100',
        channelMessages: const [],
      );
      expect(resolution.state, MessageReferenceState.notLoaded);
      expect(resolution.message, isNull);
    });
  });
}
