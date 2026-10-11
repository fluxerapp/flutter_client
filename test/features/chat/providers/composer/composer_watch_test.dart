import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/providers/composer/composer_watch_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';

void main() {
  test('preview updates do not change the composer watch', () {
    final ComposerWatch? first = composerWatchFor(
      _conversation(lastMessage: 'one', unreadCount: 0),
    );
    final ComposerWatch? second = composerWatchFor(
      _conversation(lastMessage: 'two', unreadCount: 4),
    );

    expect(second, first);
  });

  test('recipient rename changes the composer watch', () {
    final ComposerWatch? first = composerWatchFor(
      _conversation(lastMessage: 'one', unreadCount: 0),
    );
    final ComposerWatch? renamed = composerWatchFor(
      _conversation(lastMessage: 'one', unreadCount: 0, recipientName: 'Grace'),
    );

    expect(renamed, isNot(first));
  });

  test('a friend nickname names the DM recipient in the composer', () {
    final ComposerWatch? watch = composerWatchFor(
      _conversation(lastMessage: 'one', unreadCount: 0),
      friendNickname: 'Countess',
    );

    expect(watch?.recipientDisplayName, 'Countess');
    expect(watch?.recipientName, 'Ada');
  });

  test('without a friend nickname the recipient name is used', () {
    final ComposerWatch? watch = composerWatchFor(
      _conversation(lastMessage: 'one', unreadCount: 0),
    );

    expect(watch?.recipientDisplayName, 'Ada');
  });
}

DmConversation _conversation({
  required String lastMessage,
  required int unreadCount,
  String recipientName = 'Ada',
}) {
  return DmConversation(
    id: 'channel-1',
    type: ChannelType.dm.wireValue,
    recipientId: 'user-1',
    recipientName: recipientName,
    lastMessage: lastMessage,
    lastMessageTime: DateTime.utc(2026),
    unreadCount: unreadCount,
  );
}
