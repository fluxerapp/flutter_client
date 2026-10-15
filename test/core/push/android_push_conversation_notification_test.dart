import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/android_push_conversation_history.dart';
import 'package:fluxer_app/core/push/android_push_conversation_notification.dart';

void main() {
  group('resolvePushSenderName', () {
    test('strips guild suffix from title', () {
      expect(resolvePushSenderName('Alice (#general, My Server)'), 'Alice');
    });

    test('strips group dm suffix', () {
      expect(resolvePushSenderName('Alice (Group DM)'), 'Alice');
    });

    test('keeps plain dm title', () {
      expect(resolvePushSenderName('Alice'), 'Alice');
    });
  });

  group('buildPushMessagingStyle', () {
    test('uses conversation title for guild channels', () {
      final MessagingStyleInformation style = buildPushMessagingStyle(
        payload: const <String, String>{'guild_id': '1'},
        lines: <PushConversationLine>[
          const PushConversationLine(
            messageId: '1',
            senderName: 'Alice',
            senderKey: 'a',
            body: 'hey',
            timestampMs: 1000,
          ),
        ],
        title: 'Alice (#general, My Server)',
      );
      expect(style.conversationTitle, 'general');
      expect(style.groupConversation, isTrue);
      expect(style.messages, hasLength(1));
      expect(style.messages!.single.person?.name, 'Alice');
    });

    test('omits conversation title for 1:1 dms', () {
      final MessagingStyleInformation style = buildPushMessagingStyle(
        payload: const <String, String>{'guild_id': 'null'},
        lines: <PushConversationLine>[
          const PushConversationLine(
            messageId: '1',
            senderName: 'Alice',
            senderKey: 'a',
            body: 'hey',
            timestampMs: 1000,
          ),
        ],
        title: 'Alice',
      );
      expect(style.conversationTitle, isNull);
      expect(style.groupConversation, isFalse);
    });

    test('adds inline image metadata when present', () {
      final List<Message> messages =
          pushConversationMessages(<PushConversationLine>[
            const PushConversationLine(
              messageId: '1',
              senderName: 'Alice',
              senderKey: 'a',
              body: 'photo',
              timestampMs: 1000,
              imagePath: '/tmp/push.jpg',
            ),
          ]);
      expect(messages.single.dataMimeType, 'image/jpeg');
      expect(messages.single.dataUri, contains('push.jpg'));
    });
  });

  test('a reaped avatar file does not strip the avatars of newer lines', () {
    final List<PushConversationLine> lines =
        pushConversationLinesWithExistingMedia(<PushConversationLine>[
          const PushConversationLine(
            messageId: '1',
            senderName: 'Alice',
            senderKey: 'a',
            body: 'old',
            timestampMs: 1000,
            avatarPath: '/cache/reaped/avatar.jpg',
            imagePath: '/cache/reaped/image.jpg',
          ),
          const PushConversationLine(
            messageId: '2',
            senderName: 'Bob',
            senderKey: 'b',
            body: 'new',
            timestampMs: 2000,
            avatarPath: '/cache/live/avatar.jpg',
          ),
        ], fileExists: (String path) => path.startsWith('/cache/live/'));
    final AndroidNotificationDetails details =
        buildAndroidConversationNotificationDetails(
          androidChannelId: 'fluxer_messages',
          androidChannelName: 'Messages',
          payload: const <String, String>{'guild_id': '1'},
          lines: lines,
          conversationTag: 'channel:1',
          alert: true,
        );
    final MessagingStyleInformation style =
        details.styleInformation! as MessagingStyleInformation;
    expect(style.messages![0].person?.icon, isNull);
    expect(style.messages![0].dataUri, isNull);
    expect(
      (style.messages![1].person?.icon as BitmapFilePathAndroidIcon?)?.data,
      '/cache/live/avatar.jpg',
    );
    expect(
      (details.largeIcon as FilePathAndroidBitmap?)?.data,
      '/cache/live/avatar.jpg',
    );
  });
}
