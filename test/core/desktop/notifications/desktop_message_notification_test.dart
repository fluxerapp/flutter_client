import 'dart:ui' as ui;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/desktop/notifications/desktop_message_notification_binding.dart';
import 'package:fluxer_app/core/desktop/notifications/desktop_message_notification_content.dart';
import 'package:fluxer_app/core/desktop/notifications/desktop_notification_tracker.dart';
import 'package:fluxer_app/core/push/notification/path_resolver.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

const String _messageId = '1234567890123456789';

UserPartialResponse _user(String id) => UserPartialResponse(
  id: id,
  username: 'user-$id',
  discriminator: '0001',
  globalName: null,
  avatar: null,
  avatarColor: null,
  flags: 0,
);

MessageResponseSchema _message({
  String channelId = 'c1',
  String authorId = 'other',
  MessageType type = MessageType.valueDefault,
  int flags = 0,
  String content = 'hello',
  List<MessageAttachmentResponse> attachments = const [],
}) => MessageResponseSchema(
  id: _messageId,
  channelId: channelId,
  author: _user(authorId),
  type: type,
  flags: flags,
  content: content,
  timestamp: dateTimeFromUserSnowflakeOrNull(_messageId)!,
  pinned: false,
  mentionEveryone: false,
  tts: false,
  mentions: const [],
  mentionRoles: const [],
  attachments: attachments,
);

const MessagePersistSnapshot _all = MessagePersistSnapshot(
  mentionsCurrentUser: false,
  isDm: false,
  acknowledgedByGateway: false,
  notificationLevel: UserNotificationSettings.allMessages,
);

bool _should({
  MessageResponseSchema? message,
  MessagePersistSnapshot snapshot = _all,
  Set<String> blocked = const {},
  bool dnd = false,
  bool popupsEnabled = true,
  bool focused = false,
  String? activeChannelId,
}) {
  return shouldShowDesktopMessageNotification(
    message: message ?? _message(),
    snapshot: snapshot,
    currentUserId: 'me',
    blockedUserIds: blocked,
    selfIsDnd: dnd,
    popupsEnabled: popupsEnabled,
    windowFocused: focused,
    activeChannelId: activeChannelId,
  );
}

void main() {
  final FluxerLocalizations l10n = lookupFluxerLocalizations(
    const ui.Locale('en'),
  );

  group('shouldShowDesktopMessageNotification', () {
    test('notifies for an allowed message in a background channel', () {
      expect(_should(), isTrue);
    });

    test('skips own and blocked authors', () {
      expect(_should(message: _message(authorId: 'me')), isFalse);
      expect(_should(blocked: {'other'}), isFalse);
    });

    test('skips when popups are disabled or in DND', () {
      expect(_should(popupsEnabled: false), isFalse);
      expect(_should(dnd: true), isFalse);
    });

    test('skips when focused on the same channel', () {
      expect(_should(focused: true, activeChannelId: 'c1'), isFalse);
    });

    test('notifies when unfocused on the same channel', () {
      expect(_should(activeChannelId: 'c1'), isTrue);
    });

    test('notifies when focused on another channel', () {
      expect(_should(focused: true, activeChannelId: 'c2'), isTrue);
    });

    test('skips suppressed, muted and system messages', () {
      expect(
        _should(message: _message(flags: messageFlagSuppressNotifications)),
        isFalse,
      );
      expect(
        _should(
          snapshot: const MessagePersistSnapshot(
            mentionsCurrentUser: true,
            isDm: false,
            acknowledgedByGateway: false,
            notificationLevel: UserNotificationSettings.allMessages,
            isChannelMuted: true,
          ),
        ),
        isFalse,
      );
      expect(_should(message: _message(type: MessageType.userJoin)), isFalse);
    });

    test('only mentions requires a mention unless it is a DM', () {
      const MessagePersistSnapshot onlyMentions = MessagePersistSnapshot(
        mentionsCurrentUser: false,
        isDm: false,
        acknowledgedByGateway: false,
        notificationLevel: UserNotificationSettings.onlyMentions,
      );
      expect(_should(snapshot: onlyMentions), isFalse);
      expect(
        _should(
          snapshot: const MessagePersistSnapshot(
            mentionsCurrentUser: true,
            isDm: false,
            acknowledgedByGateway: false,
            notificationLevel: UserNotificationSettings.onlyMentions,
          ),
        ),
        isTrue,
      );
      expect(
        _should(
          snapshot: const MessagePersistSnapshot(
            mentionsCurrentUser: false,
            isDm: true,
            acknowledgedByGateway: false,
            notificationLevel: UserNotificationSettings.onlyMentions,
          ),
        ),
        isTrue,
      );
    });
  });

  group('buildDesktopNotificationTitle', () {
    test('DM uses the author name', () {
      expect(
        buildDesktopNotificationTitle(
          authorName: 'Ann',
          channel: const DesktopNotificationChannelContext(),
          useSubtitle: false,
        ).title,
        'Ann',
      );
    });

    test('group DM appends the group name', () {
      const DesktopNotificationChannelContext group =
          DesktopNotificationChannelContext(
            isGroupDm: true,
            groupDmName: 'Friends',
          );
      expect(
        buildDesktopNotificationTitle(
          authorName: 'Ann',
          channel: group,
          useSubtitle: false,
        ).title,
        'Ann (Friends)',
      );
      final DesktopNotificationTitle mac = buildDesktopNotificationTitle(
        authorName: 'Ann',
        channel: group,
        useSubtitle: true,
      );
      expect(mac.title, 'Ann');
      expect(mac.subtitle, 'Friends');
    });

    test('guild channel uses channel suffix or guild subtitle', () {
      const DesktopNotificationChannelContext channel =
          DesktopNotificationChannelContext(
            guildId: 'g1',
            guildName: 'Guild',
            channelName: 'general',
          );
      expect(
        buildDesktopNotificationTitle(
          authorName: 'Ann',
          channel: channel,
          useSubtitle: false,
        ).title,
        'Ann (#general)',
      );
      final DesktopNotificationTitle mac = buildDesktopNotificationTitle(
        authorName: 'Ann',
        channel: channel,
        useSubtitle: true,
      );
      expect(mac.title, 'Ann');
      expect(mac.subtitle, 'Guild #general');
    });

    test('voice channel has no hash and thread includes parent and guild', () {
      expect(
        buildDesktopNotificationTitle(
          authorName: 'Ann',
          channel: const DesktopNotificationChannelContext(
            guildId: 'g1',
            channelName: 'Lounge',
            isVoice: true,
          ),
          useSubtitle: false,
        ).title,
        'Ann (Lounge)',
      );
      expect(
        buildDesktopNotificationTitle(
          authorName: 'Ann',
          channel: const DesktopNotificationChannelContext(
            guildId: 'g1',
            guildName: 'Guild',
            channelName: 'bugs',
            parentName: 'support',
            isThread: true,
          ),
          useSubtitle: false,
        ).title,
        'Ann (#bugs, #support, Guild)',
      );
    });
    test('unnamed group DM falls back to the generic group name', () {
      expect(
        buildDesktopNotificationTitle(
          authorName: 'Ann',
          channel: const DesktopNotificationChannelContext(isGroupDm: true),
          useSubtitle: false,
          groupDmFallbackName: 'Group DM',
        ).title,
        'Ann (Group DM)',
      );
    });
  });

  group('buildDesktopNotificationBody', () {
    test('renders mentions and custom emoji', () {
      expect(
        renderDesktopNotificationText(
          'hi <@1> <@&2> <#3> <:wave:44> <@9> <#8>',
          userNames: const {'1': 'Ann'},
          roleNames: const {'2': 'mods'},
          channelNames: const {'3': 'general'},
        ),
        'hi @Ann @mods #general :wave: @9 #unknown-channel',
      );
    });

    test('falls back to attachment and generic text', () {
      final Message withAttachment = Message.fromSdk(
        _message(
          content: '',
          attachments: [
            const MessageAttachmentResponse(
              id: 'a',
              filename: 'cat.png',
              size: 1,
              flags: 0,
              url: 'https://x/cat.png',
            ),
          ],
        ),
      );
      expect(
        buildDesktopNotificationBody(message: withAttachment, l10n: l10n),
        'Attachment: cat.png',
      );
      expect(
        buildDesktopNotificationBody(
          message: Message.fromSdk(_message(content: '')),
          l10n: l10n,
        ),
        l10n.notificationNewMessageFallback,
      );
    });

    test('truncates long content', () {
      final String body = buildDesktopNotificationBody(
        message: Message.fromSdk(_message(content: 'a' * 500)),
        l10n: l10n,
      );
      expect(body.length, kDesktopNotificationBodyMaxLength);
    });

    test('truncation keeps emoji intact', () {
      final String body = buildDesktopNotificationBody(
        message: Message.fromSdk(_message(content: '😀' * 400)),
        l10n: l10n,
      );
      expect(body, '${'😀' * (kDesktopNotificationBodyMaxLength - 1)}…');
    });
  });

  group('buildDesktopNotificationPayload', () {
    test('resolves guild and DM paths', () {
      expect(
        resolvePushNotificationPath(
          buildDesktopNotificationPayload(
            channelId: 'c1',
            messageId: 'm1',
            guildId: 'g1',
            currentUserId: 'me',
          ),
        ),
        contains('g1'),
      );
      expect(
        resolvePushNotificationPath(
          buildDesktopNotificationPayload(
            channelId: 'c1',
            messageId: 'm1',
            guildId: null,
            currentUserId: 'me',
          ),
        ),
        isNotNull,
      );
    });
  });

  group('DesktopNotificationTracker', () {
    test('evicts beyond the per-channel cap', () {
      final DesktopNotificationTracker tracker = DesktopNotificationTracker(
        perChannel: 2,
      );
      expect(tracker.track(channelId: 'c', messageId: 'm1', id: 1), isEmpty);
      expect(tracker.track(channelId: 'c', messageId: 'm2', id: 2), isEmpty);
      expect(tracker.track(channelId: 'c', messageId: 'm3', id: 3), [1]);
      expect(tracker.takeMessages('c', ['m2']), [2]);
      expect(tracker.takeChannel('c'), [3]);
      expect(tracker.takeChannel('c'), isEmpty);
    });
  });
}
