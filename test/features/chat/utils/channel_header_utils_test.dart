import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/utils/channel_header_utils.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';

void main() {
  test('personal notes show search and pins like any DM', () {
    final DmConversation notes = DmConversation(
      id: '1000000000000000001',
      type: ChannelType.dmPersonalNotes.wireValue,
      recipientId: '1000000000000000001',
      recipientName: 'Me',
      lastMessage: '',
      lastMessageTime: DateTime.utc(2024),
    );

    expect(notes.isPersonalNotes, isTrue);
    expect(shouldShowSearchForContext(channel: null, dm: notes), isTrue);
    expect(shouldShowPinsForContext(channel: null, dm: notes), isTrue);
  });
}
