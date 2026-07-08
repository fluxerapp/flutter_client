import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_entries.dart';

void main() {
  test('category drag remaps bottom hover to next category top', () {
    final List<GuildChannelSettingsEntry> entries = <GuildChannelSettingsEntry>[
      const GuildChannelSettingsEntry.category(
        category: ChannelCategory(
          id: 'cat-a',
          name: 'A',
          channels: <Channel>[],
        ),
        guildId: 'guild-1',
      ),
      const GuildChannelSettingsEntry.channel(
        channel: Channel(
          id: 'text-a',
          guildId: 'guild-1',
          name: 'text-a',
          parentId: 'cat-a',
        ),
        guildId: 'guild-1',
      ),
      const GuildChannelSettingsEntry.category(
        category: ChannelCategory(
          id: 'cat-b',
          name: 'B',
          channels: <Channel>[],
        ),
        guildId: 'guild-1',
      ),
    ];
    const ChannelReorderDragItem dragItem = ChannelReorderDragItem(
      id: 'cat-a',
      kind: ChannelReorderDragKind.category,
      channelType: 4,
      parentId: null,
      guildId: 'guild-1',
    );
    final GuildChannelSettingsDropHover? hover =
        resolveGuildChannelSettingsDropHover(
          entries: entries,
          hovered: entries.first,
          intent: const ChannelReorderIntent(
            indicator: ChannelReorderIndicator(
              position: ChannelReorderIndicatorPosition.bottom,
              isValid: true,
            ),
            result: ChannelReorderDropResult(
              targetId: 'cat-a',
              position: ChannelReorderDropPosition.after,
            ),
          ),
          activeDragItem: dragItem,
        );
    expect(hover, isNotNull);
    expect(hover!.displayEntryId, 'cat-b');
    expect(
      hover.displayIntent.indicator.position,
      ChannelReorderIndicatorPosition.top,
    );
    expect(hover.dropResult.targetId, 'cat-a');
    expect(hover.dropResult.position, ChannelReorderDropPosition.after);
  });
}
