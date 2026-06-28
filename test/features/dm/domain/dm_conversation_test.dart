import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';

void main() {
  DmConversation convo({required int type}) {
    return DmConversation(
      id: '1',
      type: type,
      recipientId: '2',
      recipientName: 'Global Name',
      name: type == 3 ? 'Group' : null,
      lastMessage: '',
      lastMessageTime: DateTime(2020),
    );
  }

  group('DmConversation.displayNameWith', () {
    test('uses the friend nickname for a direct message channel', () {
      expect(convo(type: 0).displayNameWith('Nick'), 'Nick');
    });

    test('falls back to the recipient name when the nickname is blank', () {
      expect(convo(type: 0).displayNameWith('   '), 'Global Name');
      expect(convo(type: 0).displayNameWith(null), 'Global Name');
    });

    test(
      'does not expose the friend nickname for a group direct message channel',
      () {
        expect(convo(type: 3).displayNameWith('Nick'), 'Group');
      },
    );

    test('does not expose the friend nickname for personal notes', () {
      expect(convo(type: 999).displayNameWith('Nick'), 'Personal Notes');
    });
  });
}
