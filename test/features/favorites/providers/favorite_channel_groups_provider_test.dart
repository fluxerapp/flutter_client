import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/channels/domain/channel.dart';
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
}
