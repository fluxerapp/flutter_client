import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

void main() {
  DmConversation convo({
    required int type,
    bool isBot = false,
    bool isSystem = false,
  }) {
    return DmConversation(
      id: '1',
      type: type,
      recipientId: '2',
      recipientName: 'User',
      lastMessage: '',
      lastMessageTime: DateTime(2020),
      isBot: isBot,
      isSystem: isSystem,
    );
  }

  group('canStartDmCall', () {
    test('allows group DMs', () {
      expect(
        canStartDmCall(convo(type: ChannelType.groupDm.wireValue)),
        isTrue,
      );
    });

    test('allows regular 1:1 DMs', () {
      expect(canStartDmCall(convo(type: ChannelType.dm.wireValue)), isTrue);
    });

    test('blocks personal notes', () {
      expect(
        canStartDmCall(convo(type: ChannelType.dmPersonalNotes.wireValue)),
        isFalse,
      );
    });

    test('blocks 1:1 bot DMs', () {
      expect(
        canStartDmCall(convo(type: ChannelType.dm.wireValue, isBot: true)),
        isFalse,
      );
    });

    test('blocks 1:1 system DMs', () {
      expect(
        canStartDmCall(convo(type: ChannelType.dm.wireValue, isSystem: true)),
        isFalse,
      );
    });
  });

  group('isComposerDirectChat', () {
    test('returns true for a listed DM conversation', () {
      final DmConversation dm = convo(type: ChannelType.dm.wireValue);
      expect(
        isComposerDirectChat(
          channelId: dm.id,
          dmConversations: <DmConversation>[dm],
          currentUserId: 'self',
        ),
        isTrue,
      );
    });

    test('returns true for personal notes route before DM row exists', () {
      expect(
        isComposerDirectChat(
          channelId: 'self',
          dmConversations: const <DmConversation>[],
          currentUserId: 'self',
        ),
        isTrue,
      );
    });

    test('returns false for guild channels', () {
      expect(
        isComposerDirectChat(
          channelId: 'guild-channel',
          dmConversations: const <DmConversation>[],
          currentUserId: 'self',
        ),
        isFalse,
      );
    });
  });

  group('dmChannelCompanionFromChannelResponse', () {
    test('keeps a group DM the current user is alone in', () {
      final companion = dmChannelCompanionFromChannelResponse(
        ChannelResponse.fromJson(<String, Object?>{
          'id': '300',
          'type': ChannelType.groupDm.wireValue,
          'name': null,
          'icon': null,
          'owner_id': 'self',
          'last_message_id': null,
        }),
      );

      expect(companion, isNotNull);
      expect(companion!.id.value, '300');
      expect(companion.type.value, ChannelType.groupDm.wireValue);
      expect(companion.recipientId.value, 'self');
      expect(companion.recipientIds.value, '[]');
      expect(companion.recipientCount.value, 1);
    });

    test('skips a 1:1 DM without recipients', () {
      expect(
        dmChannelCompanionFromChannelResponse(
          ChannelResponse.fromJson(<String, Object?>{
            'id': '301',
            'type': ChannelType.dm.wireValue,
            'last_message_id': null,
          }),
        ),
        isNull,
      );
    });
  });
}
