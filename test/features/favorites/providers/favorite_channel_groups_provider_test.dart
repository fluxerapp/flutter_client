import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channel_groups_provider.dart';

void main() {
  test('resolveFavoriteEntries hides inaccessible favourites', () {
    final entries = resolveFavoriteEntries(
      favorites: const [
        db.FavoriteChannel(channelId: 'alive', guildId: 'g1', position: 0),
        db.FavoriteChannel(channelId: 'deleted', guildId: 'g1', position: 1),
      ],
      channelById: const {
        'alive': Channel(id: 'alive', guildId: 'g1', name: 'general'),
      },
      dmById: const {},
      guildById: const {},
    );

    expect(entries.map((e) => e.channelId).toList(), ['alive']);
  });

  test('resolveFavoriteEntries treats @me favorites as direct messages', () {
    final entries = resolveFavoriteEntries(
      favorites: const [
        db.FavoriteChannel(channelId: 'dm-1', guildId: '@me', position: 0),
      ],
      channelById: const {},
      dmById: {
        'dm-1': DmConversation(
          id: 'dm-1',
          type: ChannelType.dm.wireValue,
          recipientId: 'user-1',
          recipientName: 'Alex',
          lastMessage: '',
          lastMessageTime: DateTime(2020),
        ),
      },
      guildById: const {},
    );

    expect(entries, hasLength(1));
    expect(entries.single.guildId, isNull);
    expect(entries.single.dm?.id, 'dm-1');
  });
}
