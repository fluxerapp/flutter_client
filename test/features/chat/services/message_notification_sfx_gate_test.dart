import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/services/message_notification_sfx_gate.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

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
  required String id,
  required String channelId,
  required String authorId,
  int flags = 0,
  bool mentionEveryone = false,
  List<String> mentionRoles = const [],
  List<String> mentionedUserIds = const [],
}) => MessageResponseSchema(
  id: id,
  channelId: channelId,
  author: _user(authorId),
  type: MessageType.valueDefault,
  flags: flags,
  content: 'hello',
  timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
  pinned: false,
  mentionEveryone: mentionEveryone,
  tts: false,
  mentions: mentionedUserIds.map(_user).toList(),
  mentionRoles: mentionRoles,
);

const MessagePersistSnapshot _guildAllMessages = MessagePersistSnapshot(
  mentionsCurrentUser: false,
  isDm: false,
  acknowledgedByGateway: false,
  notificationLevel: UserNotificationSettings.allMessages,
);

const MessagePersistSnapshot _guildOnlyMentions = MessagePersistSnapshot(
  mentionsCurrentUser: false,
  isDm: false,
  acknowledgedByGateway: false,
  notificationLevel: UserNotificationSettings.onlyMentions,
);

Future<MessageNotificationSfxPlayRequest?> _evaluate({
  required MessageResponseSchema message,
  MessagePersistSnapshot snapshot = _guildAllMessages,
  MessageNotificationSfxDeduper? deduper,
  bool selfIsDnd = false,
  bool foreground = false,
  bool viewingChannel = false,
  bool hasObscuringOverlay = false,
}) {
  return FluxerMessageNotificationSfxEvaluator.evaluateFromSnapshot(
    message: message,
    snapshot: snapshot,
    currentUserId: 'me',
    blockedUserIds: const {},
    selfIsDnd: selfIsDnd,
    deduper: deduper ?? MessageNotificationSfxDeduper(capacity: 50),
    foreground: foreground,
    viewingChannel: viewingChannel,
    hasObscuringOverlay: hasObscuringOverlay,
  );
}

void main() {
  group('FluxerMessageNotificationSfxEvaluator', () {
    test('only mentions + plain guild message is silent', () async {
      final MessageNotificationSfxPlayRequest? request = await _evaluate(
        snapshot: _guildOnlyMentions,
        message: _message(
          id: '1000000000000000001',
          channelId: 'channel-1',
          authorId: 'other',
        ),
      );
      expect(request, isNull);
    });

    test('all messages + plain guild message plays', () async {
      final MessageNotificationSfxPlayRequest? request = await _evaluate(
        message: _message(
          id: '1000000000000000003',
          channelId: 'channel-1',
          authorId: 'other',
        ),
      );
      expect(request?.clipKind, MessageNotificationSfxClipKind.message);
    });

    test('no messages guild level is silent', () async {
      final MessageNotificationSfxPlayRequest? request = await _evaluate(
        snapshot: const MessagePersistSnapshot(
          mentionsCurrentUser: true,
          isDm: false,
          acknowledgedByGateway: false,
          notificationLevel: UserNotificationSettings.noMessages,
        ),
        message: _message(
          id: '1000000000000000004',
          channelId: 'channel-1',
          authorId: 'other',
          mentionedUserIds: const ['me'],
        ),
      );
      expect(request, isNull);
    });

    test(
      'only mentions + unmuted DM without mention plays direct clip',
      () async {
        final MessageNotificationSfxPlayRequest? request = await _evaluate(
          snapshot: const MessagePersistSnapshot(
            mentionsCurrentUser: false,
            isDm: true,
            acknowledgedByGateway: false,
            notificationLevel: UserNotificationSettings.onlyMentions,
          ),
          message: _message(
            id: '1000000000000000005',
            channelId: 'dm-1',
            authorId: 'other',
          ),
        );
        expect(request?.clipKind, MessageNotificationSfxClipKind.directMessage);
      },
    );

    test('suppress notifications flag is silent', () async {
      final MessageNotificationSfxPlayRequest? request = await _evaluate(
        message: _message(
          id: '1000000000000000007',
          channelId: 'channel-1',
          authorId: 'other',
          flags: messageFlagSuppressNotifications,
        ),
      );
      expect(request, isNull);
    });

    test('own message is silent', () async {
      final MessageNotificationSfxPlayRequest? request = await _evaluate(
        message: _message(
          id: '1000000000000000008',
          channelId: 'channel-1',
          authorId: 'me',
        ),
      );
      expect(request, isNull);
    });

    test('dnd is silent for background notifications', () async {
      final MessageNotificationSfxPlayRequest? request = await _evaluate(
        selfIsDnd: true,
        message: _message(
          id: '1000000000000000009',
          channelId: 'channel-1',
          authorId: 'other',
        ),
      );
      expect(request, isNull);
    });

    test('dnd still allows same-channel clip while viewing channel', () async {
      final MessageNotificationSfxPlayRequest? request = await _evaluate(
        snapshot: _guildOnlyMentions,
        selfIsDnd: true,
        foreground: true,
        viewingChannel: true,
        message: _message(
          id: '1000000000000000013',
          channelId: 'channel-1',
          authorId: 'other',
        ),
      );
      expect(
        request?.clipKind,
        MessageNotificationSfxClipKind.sameChannelMessage,
      );
    });

    test(
      'foreground viewing channel without overlay uses same-channel clip',
      () async {
        final MessageNotificationSfxPlayRequest? request = await _evaluate(
          snapshot: _guildOnlyMentions,
          foreground: true,
          viewingChannel: true,
          message: _message(
            id: '1000000000000000010',
            channelId: 'channel-1',
            authorId: 'other',
          ),
        );
        expect(
          request?.clipKind,
          MessageNotificationSfxClipKind.sameChannelMessage,
        );
      },
    );

    test(
      'foreground viewing channel with overlay still validates settings',
      () async {
        final MessageNotificationSfxPlayRequest? request = await _evaluate(
          snapshot: _guildOnlyMentions,
          foreground: true,
          viewingChannel: true,
          hasObscuringOverlay: true,
          message: _message(
            id: '1000000000000000011',
            channelId: 'channel-1',
            authorId: 'other',
          ),
        );
        expect(request, isNull);
      },
    );

    test('deduper prevents duplicate playback', () async {
      final MessageNotificationSfxDeduper deduper =
          MessageNotificationSfxDeduper(capacity: 50);
      final MessageResponseSchema message = _message(
        id: '1000000000000000012',
        channelId: 'channel-1',
        authorId: 'other',
      );
      expect(await _evaluate(message: message, deduper: deduper), isNotNull);
      expect(await _evaluate(message: message, deduper: deduper), isNull);
    });
  });

  group('evaluateFromSnapshot', () {
    test('muted DM snapshot is silent', () async {
      final MessageResponseSchema message = _message(
        id: '900000000000000002',
        channelId: 'dm-1',
        authorId: 'other',
      );
      const MessagePersistSnapshot snapshot = MessagePersistSnapshot(
        mentionsCurrentUser: false,
        isDm: true,
        acknowledgedByGateway: false,
        notificationLevel: UserNotificationSettings.allMessages,
        isChannelMuted: true,
      );
      final MessageNotificationSfxDeduper deduper =
          MessageNotificationSfxDeduper(capacity: 32);
      final MessageNotificationSfxPlayRequest? request =
          await FluxerMessageNotificationSfxEvaluator.evaluateFromSnapshot(
            message: message,
            snapshot: snapshot,
            currentUserId: 'me',
            blockedUserIds: const <String>{},
            selfIsDnd: false,
            deduper: deduper,
            foreground: false,
            viewingChannel: false,
            hasObscuringOverlay: false,
          );
      expect(request, isNull);
    });

    test('uses snapshot mention flag without database reads', () async {
      final MessageResponseSchema message = _message(
        id: '900000000000000001',
        channelId: 'channel-1',
        authorId: 'other',
        mentionedUserIds: const <String>['me'],
      );
      const MessagePersistSnapshot snapshot = MessagePersistSnapshot(
        mentionsCurrentUser: true,
        isDm: false,
        acknowledgedByGateway: false,
        notificationLevel: UserNotificationSettings.onlyMentions,
      );
      final MessageNotificationSfxDeduper deduper =
          MessageNotificationSfxDeduper(capacity: 32);
      final MessageNotificationSfxPlayRequest? request =
          await FluxerMessageNotificationSfxEvaluator.evaluateFromSnapshot(
            message: message,
            snapshot: snapshot,
            currentUserId: 'me',
            blockedUserIds: const <String>{},
            selfIsDnd: false,
            deduper: deduper,
            foreground: true,
            viewingChannel: false,
            hasObscuringOverlay: false,
          );
      expect(request, isNotNull);
      expect(request!.clipKind, MessageNotificationSfxClipKind.message);
    });
  });

  group('SoundPreferencesState', () {
    test('same-channel message disabled by default', () {
      const SoundPreferencesState prefs = SoundPreferencesState();
      expect(prefs.isSoundTypeEnabled(kSoundTypeMessage), isTrue);
      expect(prefs.isSoundTypeEnabled(kSoundTypeDirectMessage), isTrue);
      expect(prefs.isSoundTypeEnabled(kSoundTypeSameChannelMessage), isFalse);
    });

    test('explicit disabled sound type is respected', () {
      const SoundPreferencesState prefs = SoundPreferencesState(
        disabledSounds: <String, bool>{kSoundTypeMessage: true},
      );
      expect(prefs.isSoundTypeEnabled(kSoundTypeMessage), isFalse);
    });
  });
}
