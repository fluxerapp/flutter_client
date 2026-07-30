import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_entries.dart';

void main() {
  test('keeps category drag indicator on hovered category row', () {
    const GuildChannelSettingsEntry hovered =
        GuildChannelSettingsEntry.category(
          category: ChannelCategory(
            id: 'cat-a',
            name: 'A',
            channels: <Channel>[],
          ),
          guildId: 'guild-1',
        );
    const ChannelReorderIntent intent = ChannelReorderIntent(
      indicator: ChannelReorderIndicator(
        position: ChannelReorderIndicatorPosition.bottom,
        isValid: true,
      ),
      result: ChannelReorderDropResult(
        targetId: 'cat-a',
        position: ChannelReorderDropPosition.after,
      ),
    );
    final GuildChannelSettingsDropHover hover =
        resolveGuildChannelSettingsDropHover(hovered: hovered, intent: intent);
    expect(hover.displayEntryId, 'cat-a');
    expect(hover.sourceEntryId, 'cat-a');
    expect(
      hover.displayIntent.indicator.position,
      ChannelReorderIndicatorPosition.bottom,
    );
    expect(hover.dropResult.position, ChannelReorderDropPosition.after);
  });
}
