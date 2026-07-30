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
    required this.sourceEntryId,
    required this.displayEntryId,
    required this.displayIntent,
    required this.dropResult,
  });

  final String sourceEntryId;
  final String displayEntryId;
  final ChannelReorderIntent displayIntent;
  final ChannelReorderDropResult dropResult;
}

GuildChannelSettingsDropHover resolveGuildChannelSettingsDropHover({
  required GuildChannelSettingsEntry hovered,
  required ChannelReorderIntent intent,
}) {
  return GuildChannelSettingsDropHover(
    sourceEntryId: hovered.id,
    displayEntryId: hovered.id,
    displayIntent: intent,
    dropResult: intent.result,
  );
}
