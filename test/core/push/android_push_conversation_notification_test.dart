import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/android/channels.dart';
import 'package:fluxer_app/core/push/android/conversation/history.dart';
import 'package:fluxer_app/core/push/android/conversation/messaging_style.dart';
import 'package:fluxer_app/core/push/notification/payload.dart';

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
      expect(style.conversationTitle, 'My Server #general');
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

    test('adds inline image metadata from a content uri', () {
      final List<Message> messages = pushConversationMessages(
        <PushConversationLine>[
          const PushConversationLine(
            messageId: '1',
            senderName: 'Alice',
            senderKey: 'a',
            body: 'photo',
            timestampMs: 1000,
            imagePath: '/tmp/push.jpg',
          ),
        ],
        imageUris: const <String, String>{
          '/tmp/push.jpg': 'content://com.fluxer.fluxer_push_media/push.jpg',
        },
      );
      expect(messages.single.dataMimeType, 'image/jpeg');
      expect(messages.single.dataUri, startsWith('content://'));
    });

    test('omits an image with no content uri', () {
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
      expect(messages.single.dataMimeType, isNull);
      expect(messages.single.dataUri, isNull);
    });

    test('shows the guild and thread name for threads', () {
      expect(
        resolvePushMessagingConversationTitle(const <String, String>{
          'guild_id': '1',
          'parent_id': '5',
          'channel_name': 'plan',
        }, title: 'Alice (#plan, #general, My Server)'),
        'My Server #plan',
      );
    });

    test('labels group dms without a hash when the name is unknown', () {
      expect(
        resolvePushMessagingConversationTitle(
          const <String, String>{},
          title: 'Alice (Group DM)',
        ),
        'Group DM',
      );
    });

    test('uses the resolved group dm name', () {
      expect(
        resolvePushMessagingConversationTitle(const <String, String>{
          kPushConversationNameKey: 'Weekend plans',
        }, title: 'Alice (Group DM)'),
        'Weekend plans',
      );
    });

    test('rebuilds the title from the stored raw title', () {
      expect(
        resolvePushNotificationDisplayTitle(const <String, String>{
          'guild_id': '1',
          'title': 'Alice (#general, My Server)',
        }, title: null),
        'My Server #general',
      );
    });
  });

  group('large icon', () {
    const List<PushConversationLine> lines = <PushConversationLine>[
      PushConversationLine(
        messageId: '1',
        senderName: 'Alice',
        senderKey: 'a',
        body: 'hey',
        timestampMs: 1000,
        avatarPath: '/cache/alice.png',
      ),
    ];

    String? largeIconPath(Map<String, String> payload, String title) {
      final AndroidNotificationDetails details =
          buildAndroidConversationNotificationDetails(
            payload: payload,
            lines: lines,
            conversationTag: 'channel:1',
            alert: true,
            title: title,
            conversationIconPath: '/cache/conversation.png',
          );
      return (details.largeIcon as FilePathAndroidBitmap?)?.data;
    }

    test('uses the guild icon while sender avatars stay on messages', () {
      final AndroidNotificationDetails details =
          buildAndroidConversationNotificationDetails(
            payload: const <String, String>{'guild_id': '1'},
            lines: lines,
            conversationTag: 'channel:1',
            alert: true,
            title: 'Alice (#general, My Server)',
            conversationIconPath: '/cache/conversation.png',
          );
      final MessagingStyleInformation style =
          details.styleInformation! as MessagingStyleInformation;
      expect(
        (details.largeIcon as FilePathAndroidBitmap?)?.data,
        '/cache/conversation.png',
      );
      expect(
        (style.messages!.single.person?.icon as BitmapFilePathAndroidIcon?)
            ?.data,
        '/cache/alice.png',
      );
    });

    test('uses the group icon for group dms', () {
      expect(
        largeIconPath(const <String, String>{}, 'Alice (Group DM)'),
        '/cache/conversation.png',
      );
    });

    test('uses the sender avatar for one to one dms', () {
      expect(
        largeIconPath(const <String, String>{}, 'Alice'),
        '/cache/alice.png',
      );
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
          payload: const <String, String>{},
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

  test('sets accent and shortcut on conversation details', () {
    final AndroidNotificationDetails details =
        buildAndroidConversationNotificationDetails(
          payload: const <String, String>{'guild_id': '1'},
          lines: const <PushConversationLine>[
            PushConversationLine(
              messageId: '1',
              senderName: 'Alice',
              senderKey: 'a',
              body: 'hey',
              timestampMs: 1000,
            ),
          ],
          conversationTag: 'channel:1',
          alert: false,
          title: 'Alice (#general, My, Server)',
          shortcutId: 'channel:1',
        );
    expect(details.color, kAndroidPushAccentColor);
    expect(details.subText, isNull);
    expect(details.shortcutId, 'channel:1');
    expect(details.silent, isFalse);
    expect(details.onlyAlertOnce, isTrue);
  });
}
