import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_channel_mentions.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';

const ChannelListState _sourceList = ChannelListState(
  guild: Guild(id: 'source', name: 'Source', ownerId: 'u1'),
  categories: <ChannelCategory>[
    ChannelCategory(
      id: 'cat',
      name: 'Text',
      channels: <Channel>[
        Channel(id: 'src-general', guildId: 'source', name: 'src-general'),
        Channel(
          id: 'src-cat',
          guildId: 'source',
          name: 'src-cat',
          type: ChannelType.guildCategory,
        ),
      ],
    ),
  ],
  selectedChannelId: 'src-general',
);

const List<Channel> _allChannels = <Channel>[
  Channel(id: 'src-general', guildId: 'source', name: 'src-general'),
  Channel(id: 'dst-announcements', guildId: 'dest', name: 'dst-announcements'),
  Channel(
    id: 'dst-cat',
    guildId: 'dest',
    name: 'dst-cat',
    type: ChannelType.guildCategory,
  ),
];

void main() {
  test('uses the loaded sidebar when it is the same guild', () {
    final List<Channel> result = mentionableChannelsForGuild(
      guildId: 'source',
      currentList: _sourceList,
      fallbackChannels: _allChannels,
    );
    expect(result.map((Channel c) => c.id), <String>['src-general']);
  });

  test(
    'uses fallback channels when the loaded sidebar is a different guild',
    () {
      final List<Channel> result = mentionableChannelsForGuild(
        guildId: 'dest',
        currentList: _sourceList,
        fallbackChannels: _allChannels,
      );
      expect(result.map((Channel c) => c.id), <String>['dst-announcements']);
    },
  );

  test('drops category channels from fallback rows', () {
    final List<Channel> result = mentionableChannelsForGuild(
      guildId: 'dest',
      currentList: const ChannelListState(
        guild: null,
        categories: <ChannelCategory>[],
        selectedChannelId: null,
      ),
      fallbackChannels: _allChannels,
    );
    expect(result.any((Channel c) => c.isCategory), isFalse);
  });
}
