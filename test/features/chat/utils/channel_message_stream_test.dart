import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/constants/user_flags.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/channel_message_stream.dart';

Message _message({
  required String id,
  required String authorId,
  int authorPublicFlags = 0,
  DateTime? timestamp,
}) {
  return Message(
    id: id,
    channelId: 'channel-1',
    authorId: authorId,
    authorName: authorId,
    content: 'hello',
    timestamp: timestamp ?? DateTime.utc(2026, 1, 1, 12),
    authorPublicFlags: authorPublicFlags,
  );
}

const ChannelCollapseContext _context = ChannelCollapseContext(
  treatSpam: true,
  currentUserId: 'me',
  blockedUserIds: {'blocked'},
  isUserMarkedAsSpammer: _neverSpammer,
);

ChannelCollapseContext _spammerContext({
  required IsUserMarkedAsSpammer isUserMarkedAsSpammer,
}) {
  return ChannelCollapseContext(
    treatSpam: true,
    currentUserId: 'me',
    blockedUserIds: const {},
    isUserMarkedAsSpammer: isUserMarkedAsSpammer,
  );
}

bool _neverSpammer(String userId, int userFlags) => false;

bool _alwaysSpammer(String userId, int userFlags) =>
    isServerSpammer(userFlags) || userId == 'spam-user';

void main() {
  group('createChannelStream', () {
    test('groups consecutive blocked messages', () {
      final List<Message> messages = <Message>[
        _message(id: '1', authorId: 'blocked'),
        _message(id: '2', authorId: 'blocked'),
        _message(id: '3', authorId: 'visible'),
      ];
      final List<ChannelStreamItem> stream = createChannelStream(
        messages: messages,
        oldestUnreadMessageId: null,
        context: _context,
      );
      expect(stream.where((item) => item.type.isCollapsedGroup).length, 1);
      final ChannelStreamItem group = stream.firstWhere(
        (item) => item.type == ChannelStreamType.messageGroupBlocked,
      );
      expect(group.groupKey, '1');
      expect(group.messages.length, 2);
    });

    test('groups consecutive spammer messages when not self', () {
      final List<Message> messages = <Message>[
        _message(
          id: '1',
          authorId: 'spam-user',
          authorPublicFlags: kUserFlagSpammer,
        ),
        _message(
          id: '2',
          authorId: 'spam-user',
          authorPublicFlags: kUserFlagSpammer,
        ),
      ];
      final List<ChannelStreamItem> stream = createChannelStream(
        messages: messages,
        oldestUnreadMessageId: null,
        context: _spammerContext(isUserMarkedAsSpammer: _alwaysSpammer),
      );
      final ChannelStreamItem group = stream.firstWhere(
        (ChannelStreamItem item) =>
            item.type == ChannelStreamType.messageGroupSpammer,
      );
      expect(group.messages.length, 2);
    });

    test('does not collapse own spammer messages', () {
      final List<Message> messages = <Message>[
        _message(id: '1', authorId: 'me', authorPublicFlags: kUserFlagSpammer),
      ];
      final List<ChannelStreamItem> stream = createChannelStream(
        messages: messages,
        oldestUnreadMessageId: null,
        context: _spammerContext(isUserMarkedAsSpammer: _alwaysSpammer),
      );
      expect(stream.last.type, ChannelStreamType.message);
    });

    test('blocked grouping takes priority over spam grouping', () {
      final List<Message> messages = <Message>[
        _message(
          id: '1',
          authorId: 'blocked',
          authorPublicFlags: kUserFlagSpammer,
        ),
      ];
      final List<ChannelStreamItem> stream = createChannelStream(
        messages: messages,
        oldestUnreadMessageId: null,
        context: const ChannelCollapseContext(
          treatSpam: true,
          currentUserId: 'me',
          blockedUserIds: {'blocked'},
          isUserMarkedAsSpammer: _alwaysSpammer,
        ),
      );
      expect(stream.last.type, ChannelStreamType.messageGroupBlocked);
    });

    test('splits groups when type changes', () {
      final List<Message> messages = <Message>[
        _message(id: '1', authorId: 'blocked'),
        _message(
          id: '2',
          authorId: 'spam-user',
          authorPublicFlags: kUserFlagSpammer,
        ),
      ];
      final List<ChannelStreamItem> stream = createChannelStream(
        messages: messages,
        oldestUnreadMessageId: null,
        context: const ChannelCollapseContext(
          treatSpam: true,
          currentUserId: 'me',
          blockedUserIds: {'blocked'},
          isUserMarkedAsSpammer: _alwaysSpammer,
        ),
      );
      expect(stream.where((item) => item.type.isCollapsedGroup).length, 2);
    });
  });

  group('buildMessageCollapseAssignments', () {
    test('matches stream group keys', () {
      final List<Message> messages = <Message>[
        _message(id: '10', authorId: 'blocked'),
        _message(id: '11', authorId: 'blocked'),
      ];
      final List<MessageCollapseAssignment> assignments =
          buildMessageCollapseAssignments(
            messages: messages,
            context: _context,
          );
      expect(assignments[0].groupKey, '10');
      expect(assignments[1].groupKey, '10');
      final String? key = getCollapsedMessageGroupKey(
        messages: messages,
        messageId: '11',
        context: _context,
      );
      expect(key, assignments[1].groupKey);
    });
  });

  group('getCollapsedMessageGroupKey', () {
    test('returns first message id for grouped message', () {
      final List<Message> messages = <Message>[
        _message(id: '10', authorId: 'blocked'),
        _message(id: '11', authorId: 'blocked'),
      ];
      final String? key = getCollapsedMessageGroupKey(
        messages: messages,
        messageId: '11',
        context: _context,
      );
      expect(key, '10');
    });

    test('returns null for visible message', () {
      final List<Message> messages = <Message>[
        _message(id: '10', authorId: 'visible'),
      ];
      final String? key = getCollapsedMessageGroupKey(
        messages: messages,
        messageId: '10',
        context: const ChannelCollapseContext(
          treatSpam: true,
          currentUserId: 'me',
          blockedUserIds: {},
          isUserMarkedAsSpammer: _neverSpammer,
        ),
      );
      expect(key, isNull);
    });
  });

  group('stream index helpers', () {
    test('findChannelStreamRenderIndex maps to reverse list index', () {
      final List<Message> messages = <Message>[
        _message(id: '1', authorId: 'a'),
        _message(id: '2', authorId: 'b'),
      ];
      final List<ChannelStreamItem> stream = createChannelStream(
        messages: messages,
        oldestUnreadMessageId: null,
        context: const ChannelCollapseContext(
          treatSpam: true,
          currentUserId: 'me',
          blockedUserIds: {},
          isUserMarkedAsSpammer: _neverSpammer,
        ),
      );
      expect(findChannelStreamRenderIndex(stream, '2'), 0);
      expect(findChannelStreamDataIndex(stream, '1'), 1);
    });
  });
}
