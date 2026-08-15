import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/message_grouping_utils.dart';
import 'package:fluxer_dart/export.dart';

Message _message({
  required String id,
  required String authorId,
  required String authorName,
  String? authorAvatar,
  bool authorIsBot = false,
  String? webhookId,
  DateTime? timestamp,
  int flags = 0,
  int type = messageTypeDefault,
  String? replyToId,
  bool mentionEveryone = false,
  List<String> mentionRoles = const <String>[],
  List<String> mentionedUserIds = const <String>[],
  List<MessageSnapshot> messageSnapshots = const <MessageSnapshot>[],
  MessageReference? messageReference,
}) {
  return Message(
    id: id,
    channelId: 'channel',
    authorId: authorId,
    authorName: authorName,
    authorAvatar: authorAvatar,
    authorIsBot: authorIsBot,
    webhookId: webhookId,
    content: 'hello',
    timestamp: timestamp ?? DateTime.utc(2026, 1, 1, 12),
    flags: flags,
    type: type,
    replyToId: replyToId,
    mentionEveryone: mentionEveryone,
    mentionRoles: mentionRoles,
    mentionedUserIds: mentionedUserIds,
    messageSnapshots: messageSnapshots,
    messageReference: messageReference,
  );
}

void main() {
  group('shouldGroupMessages', () {
    test('groups consecutive messages from same human author', () {
      final Message first = _message(
        id: '1',
        authorId: 'user',
        authorName: 'Alice',
        authorAvatar: 'avatar_a',
      );
      final Message second = _message(
        id: '2',
        authorId: 'user',
        authorName: 'Alice',
        authorAvatar: 'avatar_a',
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
      );
      expect(shouldGroupMessages(second, first), isTrue);
    });

    test('does not group messages from different authors', () {
      final Message first = _message(
        id: '1',
        authorId: 'user-a',
        authorName: 'Alice',
      );
      final Message second = _message(
        id: '2',
        authorId: 'user-b',
        authorName: 'Bob',
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
      );
      expect(shouldGroupMessages(second, first), isFalse);
    });

    test('does not group a silent message under a non-silent one', () {
      final Message first = _message(
        id: '1',
        authorId: 'user',
        authorName: 'Jiralite',
        authorAvatar: 'avatar_a',
      );
      final Message second = _message(
        id: '2',
        authorId: 'user',
        authorName: 'Jiralite',
        authorAvatar: 'avatar_a',
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
        flags: messageFlagSuppressNotifications,
      );
      expect(shouldGroupMessages(second, first), isFalse);
    });

    test('groups consecutive silent messages from same author', () {
      final Message first = _message(
        id: '1',
        authorId: 'user',
        authorName: 'Jiralite',
        authorAvatar: 'avatar_a',
        flags: messageFlagSuppressNotifications,
      );
      final Message second = _message(
        id: '2',
        authorId: 'user',
        authorName: 'Jiralite',
        authorAvatar: 'avatar_a',
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
        flags: messageFlagSuppressNotifications,
      );
      expect(shouldGroupMessages(second, first), isTrue);
    });

    test('does not group silent to non-silent when current has mentions', () {
      final Message first = _message(
        id: '1',
        authorId: 'user',
        authorName: 'Jiralite',
        flags: messageFlagSuppressNotifications,
      );
      final Message second = _message(
        id: '2',
        authorId: 'user',
        authorName: 'Jiralite',
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
        mentionEveryone: true,
      );
      expect(shouldGroupMessages(second, first), isFalse);
    });

    test('groups silent to non-silent when current has no mentions', () {
      final Message first = _message(
        id: '1',
        authorId: 'user',
        authorName: 'Jiralite',
        flags: messageFlagSuppressNotifications,
      );
      final Message second = _message(
        id: '2',
        authorId: 'user',
        authorName: 'Jiralite',
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
      );
      expect(shouldGroupMessages(second, first), isTrue);
    });

    test('does not group bot proxies with different names', () {
      final Message first = _message(
        id: '1',
        authorId: 'bot',
        authorName: 'Proxy A',
        authorAvatar: 'avatar_a',
        authorIsBot: true,
      );
      final Message second = _message(
        id: '2',
        authorId: 'bot',
        authorName: 'Proxy B',
        authorAvatar: 'avatar_b',
        authorIsBot: true,
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
      );
      expect(shouldGroupMessages(second, first), isFalse);
    });

    test('does not group webhooks with different names', () {
      final Message first = _message(
        id: '1',
        authorId: 'webhook',
        authorName: 'Hook A',
        authorAvatar: 'avatar_a',
        webhookId: '10',
      );
      final Message second = _message(
        id: '2',
        authorId: 'webhook',
        authorName: 'Hook B',
        authorAvatar: 'avatar_a',
        webhookId: '10',
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
      );
      expect(shouldGroupMessages(second, first), isFalse);
    });

    test('groups webhooks with different avatars when names match', () {
      final Message first = _message(
        id: '1',
        authorId: 'webhook',
        authorName: 'Hook A',
        authorAvatar: 'avatar_a',
        webhookId: '10',
      );
      final Message second = _message(
        id: '2',
        authorId: 'webhook',
        authorName: 'Hook A',
        authorAvatar: 'avatar_b',
        webhookId: '10',
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
      );
      expect(shouldGroupMessages(second, first), isTrue);
    });

    test('does not group bot proxies with different avatars', () {
      final Message first = _message(
        id: '1',
        authorId: 'bot',
        authorName: 'Fluxcord',
        authorAvatar: 'avatar_a',
        authorIsBot: true,
      );
      final Message second = _message(
        id: '2',
        authorId: 'bot',
        authorName: 'Fluxcord',
        authorAvatar: 'avatar_b',
        authorIsBot: true,
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
      );
      expect(shouldGroupMessages(second, first), isFalse);
    });

    test('does not group current reply messages', () {
      final Message first = _message(
        id: '1',
        authorId: 'user',
        authorName: 'Alice',
      );
      final Message second = _message(
        id: '2',
        authorId: 'user',
        authorName: 'Alice',
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
        type: messageTypeReply,
        replyToId: '99',
      );
      expect(shouldGroupMessages(second, first), isFalse);
    });

    test('groups a message after a reply from the same author', () {
      final Message reply = _message(
        id: '1',
        authorId: 'user',
        authorName: 'Alice',
        type: messageTypeReply,
        replyToId: '99',
      );
      final Message followUp = _message(
        id: '2',
        authorId: 'user',
        authorName: 'Alice',
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
      );
      expect(shouldGroupMessages(followUp, reply), isTrue);
    });

    test('groups forwarded messages with prior same-author message', () {
      final Message first = _message(
        id: '1',
        authorId: 'user',
        authorName: 'Alice',
      );
      final Message forwarded = _message(
        id: '2',
        authorId: 'user',
        authorName: 'Alice',
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
        messageReference: const MessageReference(
          messageId: 'other',
          channelId: 'channel',
          type: MessageReferenceType.forward,
        ),
        messageSnapshots: <MessageSnapshot>[
          MessageSnapshot(
            timestamp: DateTime.utc(2026, 1, 1, 11),
            content: 'snap',
          ),
        ],
      );
      expect(shouldGroupMessages(forwarded, first), isTrue);
    });
  });

  group('computeMessageRowGrouped', () {
    test('groups consecutive messages from the same author', () {
      final Message first = _message(
        id: '1',
        authorId: 'user',
        authorName: 'Alice',
      );
      final Message second = _message(
        id: '2',
        authorId: 'user',
        authorName: 'Alice',
        timestamp: DateTime.utc(2026, 1, 1, 12, 1),
      );
      expect(
        computeMessageRowGrouped(
          message: second,
          previousMessage: first,
          isNewDay: false,
        ),
        isTrue,
      );
    });

    test('returns false on a new day', () {
      final Message first = _message(
        id: '1',
        authorId: 'user',
        authorName: 'Alice',
      );
      final Message second = _message(
        id: '2',
        authorId: 'user',
        authorName: 'Alice',
        timestamp: DateTime.utc(2026, 1, 2, 12, 1),
      );
      expect(
        computeMessageRowGrouped(
          message: second,
          previousMessage: first,
          isNewDay: true,
        ),
        isFalse,
      );
    });
  });

  group('isNewMessageGroup', () {
    test('starts a new group when previous is null', () {
      final Message current = _message(
        id: '1',
        authorId: 'user',
        authorName: 'Alice',
      );
      expect(isNewMessageGroup(current, null), isTrue);
    });
  });

  group('leadingGroupSpacing', () {
    test('returns full spacing for a group start after a non-system row', () {
      expect(
        leadingGroupSpacing(
          isGroupStart: true,
          isNewDay: false,
          isUnreadBoundary: false,
          hasPrevious: true,
          bothSystem: false,
          spacing: 16,
        ),
        16,
      );
    });

    test('returns half spacing between two adjacent system messages', () {
      expect(
        leadingGroupSpacing(
          isGroupStart: true,
          isNewDay: false,
          isUnreadBoundary: false,
          hasPrevious: true,
          bothSystem: true,
          spacing: 16,
        ),
        8,
      );
    });

    test('returns zero within a group', () {
      expect(
        leadingGroupSpacing(
          isGroupStart: false,
          isNewDay: false,
          isUnreadBoundary: false,
          hasPrevious: true,
          bothSystem: false,
          spacing: 16,
        ),
        0,
      );
    });

    test('returns zero on a new day so the divider stands alone', () {
      expect(
        leadingGroupSpacing(
          isGroupStart: true,
          isNewDay: true,
          isUnreadBoundary: false,
          hasPrevious: true,
          bothSystem: false,
          spacing: 16,
        ),
        0,
      );
    });

    test('returns zero at an unread boundary', () {
      expect(
        leadingGroupSpacing(
          isGroupStart: true,
          isNewDay: false,
          isUnreadBoundary: true,
          hasPrevious: true,
          bothSystem: false,
          spacing: 16,
        ),
        0,
      );
    });

    test('returns zero before the first row', () {
      expect(
        leadingGroupSpacing(
          isGroupStart: true,
          isNewDay: false,
          isUnreadBoundary: false,
          hasPrevious: false,
          bothSystem: false,
          spacing: 16,
        ),
        0,
      );
    });

    test('returns zero when spacing is disabled', () {
      expect(
        leadingGroupSpacing(
          isGroupStart: true,
          isNewDay: false,
          isUnreadBoundary: false,
          hasPrevious: true,
          bothSystem: false,
          spacing: 0,
        ),
        0,
      );
    });
  });
}
