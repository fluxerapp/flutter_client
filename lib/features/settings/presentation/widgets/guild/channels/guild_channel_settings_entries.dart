import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';

enum GuildChannelSettingsEntryKind { category, channel }

class GuildChannelSettingsEntry {
  const GuildChannelSettingsEntry.category({
    required this.category,
    required this.guildId,
  }) : kind = GuildChannelSettingsEntryKind.category,
       channel = null;

  const GuildChannelSettingsEntry.channel({
    required this.channel,
    required this.guildId,
  }) : kind = GuildChannelSettingsEntryKind.channel,
       category = null;

  final GuildChannelSettingsEntryKind kind;
  final ChannelCategory? category;
  final Channel? channel;
  final String guildId;

  String get id => switch (kind) {
    GuildChannelSettingsEntryKind.category => category!.id,
    GuildChannelSettingsEntryKind.channel => channel!.id,
  };

  int get channelType => switch (kind) {
    GuildChannelSettingsEntryKind.category =>
      ChannelType.guildCategory.wireValue,
    GuildChannelSettingsEntryKind.channel => channel!.type.wireValue,
  };

  String? get parentId => switch (kind) {
    GuildChannelSettingsEntryKind.category => null,
    GuildChannelSettingsEntryKind.channel => channel!.parentId,
  };

  String get label => switch (kind) {
    GuildChannelSettingsEntryKind.category => category!.name,
    GuildChannelSettingsEntryKind.channel => channel!.name,
  };
}

List<GuildChannelSettingsEntry> flattenGuildChannelSettingsEntries({
  required List<ChannelCategory> categories,
  required String guildId,
}) {
  final List<GuildChannelSettingsEntry> entries = <GuildChannelSettingsEntry>[];
  for (final ChannelCategory category in categories) {
    if (!category.isUncategorized) {
      entries.add(
        GuildChannelSettingsEntry.category(
          category: category,
          guildId: guildId,
        ),
      );
    }
    for (final Channel channel in category.channels) {
      entries.add(
        GuildChannelSettingsEntry.channel(channel: channel, guildId: guildId),
      );
    }
  }
  return entries;
}

class GuildChannelSettingsDropHover {
  const GuildChannelSettingsDropHover({
    required this.displayEntryId,
    required this.displayIntent,
    required this.dropResult,
  });

  final String displayEntryId;
  final ChannelReorderIntent displayIntent;
  final ChannelReorderDropResult dropResult;
}

GuildChannelSettingsDropHover? resolveGuildChannelSettingsDropHover({
  required List<GuildChannelSettingsEntry> entries,
  required GuildChannelSettingsEntry hovered,
  required ChannelReorderIntent intent,
  required ChannelReorderDragItem activeDragItem,
}) {
  if (activeDragItem.kind != ChannelReorderDragKind.category ||
      hovered.kind != GuildChannelSettingsEntryKind.category) {
    return GuildChannelSettingsDropHover(
      displayEntryId: hovered.id,
      displayIntent: intent,
      dropResult: intent.result,
    );
  }
  final int categoryIndex = entries.indexWhere(
    (GuildChannelSettingsEntry entry) => entry.id == hovered.id,
  );
  if (categoryIndex == -1) {
    return null;
  }
  if (intent.indicator.position == ChannelReorderIndicatorPosition.top) {
    return GuildChannelSettingsDropHover(
      displayEntryId: hovered.id,
      displayIntent: intent,
      dropResult: intent.result,
    );
  }
  final ChannelReorderDropResult dropResult = ChannelReorderDropResult(
    targetId: hovered.id,
    position: ChannelReorderDropPosition.after,
  );
  int blockEndIndex = categoryIndex;
  for (int index = categoryIndex + 1; index < entries.length; index++) {
    final GuildChannelSettingsEntry entry = entries[index];
    if (entry.kind == GuildChannelSettingsEntryKind.category) {
      return GuildChannelSettingsDropHover(
        displayEntryId: entry.id,
        displayIntent: ChannelReorderIntent(
          indicator: const ChannelReorderIndicator(
            position: ChannelReorderIndicatorPosition.top,
            isValid: true,
          ),
          result: ChannelReorderDropResult(
            targetId: entry.id,
            position: ChannelReorderDropPosition.before,
          ),
        ),
        dropResult: dropResult,
      );
    }
    blockEndIndex = index;
  }
  final GuildChannelSettingsEntry displayEntry = entries[blockEndIndex];
  return GuildChannelSettingsDropHover(
    displayEntryId: displayEntry.id,
    displayIntent: ChannelReorderIntent(
      indicator: const ChannelReorderIndicator(
        position: ChannelReorderIndicatorPosition.bottom,
        isValid: true,
      ),
      result: dropResult,
    ),
    dropResult: dropResult,
  );
}
