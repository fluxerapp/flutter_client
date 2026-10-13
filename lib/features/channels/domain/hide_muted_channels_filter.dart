bool shouldShowChannelWhenHidingMuted({
  required String channelId,
  required Set<String> mutedChannelIds,
  String? selectedChannelId,
  String? connectedChannelId,
  bool hasMentions = false,
}) {
  if (selectedChannelId != null && channelId == selectedChannelId) {
    return true;
  }
  if (connectedChannelId != null && channelId == connectedChannelId) {
    return true;
  }
  if (!mutedChannelIds.contains(channelId)) {
    return true;
  }
  return hasMentions;
}

bool shouldShowChannelInCollapsedCategory({
  required bool isCategoryMuted,
  required bool isSelected,
  required bool isConnected,
  required bool hasVisibleUnread,
}) => isSelected || isConnected || (!isCategoryMuted && hasVisibleUnread);
