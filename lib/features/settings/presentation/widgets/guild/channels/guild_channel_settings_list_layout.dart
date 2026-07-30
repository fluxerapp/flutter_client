import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_entries.dart';

class GuildChannelSettingsListItem {
  const GuildChannelSettingsListItem._({
    required this.isLeading,
    required this.isTrailing,
    required this.isCategoryTail,
    required this.entryIndex,
    required this.categoryTailAfterChannelId,
    required this.categoryTailParentId,
    required this.categoryTailParentIdSpecified,
  });

  final bool isLeading;
  final bool isTrailing;
  final bool isCategoryTail;
  final int? entryIndex;
  final String? categoryTailAfterChannelId;
  final String? categoryTailParentId;
  final bool categoryTailParentIdSpecified;

  const GuildChannelSettingsListItem.leading()
    : isLeading = true,
      isTrailing = false,
      isCategoryTail = false,
      entryIndex = null,
      categoryTailAfterChannelId = null,
      categoryTailParentId = null,
      categoryTailParentIdSpecified = false;

  const GuildChannelSettingsListItem.trailing()
    : isLeading = false,
      isTrailing = true,
      isCategoryTail = false,
      entryIndex = null,
      categoryTailAfterChannelId = null,
      categoryTailParentId = null,
      categoryTailParentIdSpecified = false;

  const GuildChannelSettingsListItem.entry(int index)
    : isLeading = false,
      isTrailing = false,
      isCategoryTail = false,
      entryIndex = index,
      categoryTailAfterChannelId = null,
      categoryTailParentId = null,
      categoryTailParentIdSpecified = false;

  const GuildChannelSettingsListItem.categoryTail({
    required String afterChannelId,
    required String? parentId,
    required bool parentIdSpecified,
  }) : isLeading = false,
       isTrailing = false,
       isCategoryTail = true,
       entryIndex = null,
       categoryTailAfterChannelId = afterChannelId,
       categoryTailParentId = parentId,
       categoryTailParentIdSpecified = parentIdSpecified;
}

String guildChannelSettingsCategoryTailHoverId(String afterChannelId) {
  return 'category-tail:$afterChannelId';
}

List<GuildChannelSettingsListItem> buildGuildChannelSettingsListItems({
  required List<GuildChannelSettingsEntry> entries,
}) {
  final List<GuildChannelSettingsListItem> items =
      <GuildChannelSettingsListItem>[
        const GuildChannelSettingsListItem.leading(),
      ];
  for (int index = 0; index < entries.length; index++) {
    items.add(GuildChannelSettingsListItem.entry(index));
    if (isLastChannelInGuildChannelSettingsBlock(entries, index)) {
      final GuildChannelSettingsEntry entry = entries[index];
      items.add(
        GuildChannelSettingsListItem.categoryTail(
          afterChannelId: entry.id,
          parentId: entry.parentId,
          parentIdSpecified: true,
        ),
      );
    }
  }
  items.add(const GuildChannelSettingsListItem.trailing());
  return items;
}

bool isLastChannelInGuildChannelSettingsBlock(
  List<GuildChannelSettingsEntry> entries,
  int index,
) {
  final GuildChannelSettingsEntry entry = entries[index];
  if (entry.kind != GuildChannelSettingsEntryKind.channel) {
    return false;
  }
  final String? blockParentId = entry.parentId;
  for (int next = index + 1; next < entries.length; next++) {
    final GuildChannelSettingsEntry nextEntry = entries[next];
    if (nextEntry.kind == GuildChannelSettingsEntryKind.category) {
      return true;
    }
    if (nextEntry.kind == GuildChannelSettingsEntryKind.channel) {
      if (nextEntry.parentId == blockParentId) {
        return false;
      }
      return true;
    }
  }
  return true;
}
