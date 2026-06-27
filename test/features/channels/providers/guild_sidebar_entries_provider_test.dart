import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/guild_sidebar_entries_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';

void main() {
  group('flattenGuildSidebarEntries', () {
    test(
      'keeps unread channel in collapsed category and hides read channel',
      () {
        final List<GuildSidebarEntry> entries = flattenGuildSidebarEntries(
          categories: <ChannelCategory>[
            const ChannelCategory(
              id: 'cat1',
              name: 'My Category',
              channels: <Channel>[
                Channel(
                  id: 'c1',
                  guildId: 'g1',
                  name: 'general',
                  parentId: 'cat1',
                ),
                Channel(
                  id: 'c2',
                  guildId: 'g1',
                  name: 'random',
                  parentId: 'cat1',
                ),
              ],
            ),
          ],
          collapsed: const <String>{'cat1'},
          mutedSet: const <String>{},
          hideMuted: false,
          selectedId: null,
          connectedChannelId: null,
          showFadedUnread: false,
          guildId: 'g1',
          unreadForChannel: (String channelId) => switch (channelId) {
            'c1' => const UnreadState(hasUnread: true, hasUnreadMessages: true),
            _ => const UnreadState(),
          },
        );

        expect(
          entries.where((e) => e.kind == GuildSidebarEntryKind.channel).length,
          1,
        );
        expect(
          entries
              .where((e) => e.kind == GuildSidebarEntryKind.channel)
              .first
              .channel
              ?.id,
          'c1',
        );
      },
    );

    test('clears entries when categories are empty', () {
      final List<GuildSidebarEntry> entries = flattenGuildSidebarEntries(
        categories: const <ChannelCategory>[],
        collapsed: const <String>{},
        mutedSet: const <String>{},
        hideMuted: false,
        selectedId: null,
        connectedChannelId: null,
        showFadedUnread: false,
        guildId: 'g1',
        unreadForChannel: (_) => const UnreadState(),
      );

      expect(entries, isEmpty);
    });
  });
}
