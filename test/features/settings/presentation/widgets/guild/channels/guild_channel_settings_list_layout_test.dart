import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_entries.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_list_layout.dart';

void expectListItem(
  GuildChannelSettingsListItem actual,
  GuildChannelSettingsListItem expected,
) {
  expect(actual.isLeading, expected.isLeading);
  expect(actual.isTrailing, expected.isTrailing);
  expect(actual.isCategoryTail, expected.isCategoryTail);
  expect(actual.entryIndex, expected.entryIndex);
  expect(
    actual.categoryTailAfterChannelId,
    expected.categoryTailAfterChannelId,
  );
  expect(actual.categoryTailParentId, expected.categoryTailParentId);
  expect(
    actual.categoryTailParentIdSpecified,
    expected.categoryTailParentIdSpecified,
  );
}

void main() {
  group('buildGuildChannelSettingsListItems', () {
    test(
      'inserts category tail slots after the last channel in each block',
      () {
        final List<GuildChannelSettingsEntry> entries =
            flattenGuildChannelSettingsEntries(
              categories: <ChannelCategory>[
                const ChannelCategory(
                  id: 'cat-1',
                  name: 'A',
                  channels: <Channel>[
                    Channel(
                      id: 'text-1',
                      guildId: 'guild-1',
                      name: 'text-1',
                      parentId: 'cat-1',
                    ),
                    Channel(
                      id: 'text-2',
                      guildId: 'guild-1',
                      name: 'text-2',
                      parentId: 'cat-1',
                      position: 1,
                    ),
                  ],
                ),
                const ChannelCategory(
                  id: 'cat-2',
                  name: 'B',
                  channels: <Channel>[
                    Channel(
                      id: 'text-3',
                      guildId: 'guild-1',
                      name: 'text-3',
                      parentId: 'cat-2',
                    ),
                  ],
                ),
              ],
              guildId: 'guild-1',
            );
        final List<GuildChannelSettingsListItem> items =
            buildGuildChannelSettingsListItems(entries: entries);
        expect(items.length, 9);
        expectListItem(items[0], const GuildChannelSettingsListItem.leading());
        expectListItem(items[1], const GuildChannelSettingsListItem.entry(0));
        expectListItem(items[2], const GuildChannelSettingsListItem.entry(1));
        expectListItem(items[3], const GuildChannelSettingsListItem.entry(2));
        expectListItem(
          items[4],
          const GuildChannelSettingsListItem.categoryTail(
            afterChannelId: 'text-2',
            parentId: 'cat-1',
            parentIdSpecified: true,
          ),
        );
        expectListItem(items[5], const GuildChannelSettingsListItem.entry(3));
        expectListItem(items[6], const GuildChannelSettingsListItem.entry(4));
        expectListItem(
          items[7],
          const GuildChannelSettingsListItem.categoryTail(
            afterChannelId: 'text-3',
            parentId: 'cat-2',
            parentIdSpecified: true,
          ),
        );
        expectListItem(items[8], const GuildChannelSettingsListItem.trailing());
      },
    );
  });

  group('isLastChannelInGuildChannelSettingsBlock', () {
    test('returns true only for the last channel before the next block', () {
      final List<GuildChannelSettingsEntry> entries =
          flattenGuildChannelSettingsEntries(
            categories: <ChannelCategory>[
              const ChannelCategory(
                id: 'cat-1',
                name: 'A',
                channels: <Channel>[
                  Channel(
                    id: 'text-1',
                    guildId: 'guild-1',
                    name: 'text-1',
                    parentId: 'cat-1',
                  ),
                  Channel(
                    id: 'text-2',
                    guildId: 'guild-1',
                    name: 'text-2',
                    parentId: 'cat-1',
                    position: 1,
                  ),
                ],
              ),
            ],
            guildId: 'guild-1',
          );
      expect(isLastChannelInGuildChannelSettingsBlock(entries, 1), isFalse);
      expect(isLastChannelInGuildChannelSettingsBlock(entries, 2), isTrue);
    });
  });
}
