/// Whether a channel should remain visible when "Hide Muted Channels" is on.
///
/// A channel is kept when it is selected, when the user is connected to it
/// (voice), when it is not directly muted, or when it has mentions.
/// Category and guild mutes do not affect sidebar visibility.
///
/// [connectedChannelId] and [hasMentions] default to values that preserve the
/// original `isSelected || !isMuted` behavior for callers that do not pass them.
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

/// Whether a channel inside a collapsed category should still be rendered.
///
/// Collapsed categories keep the selected channel, the connected (voice)
/// channel, and channels with visible unread activity (unless the whole
/// category is muted).
bool shouldShowChannelInCollapsedCategory({
  required bool isCategoryMuted,
  required bool isSelected,
  required bool isConnected,
  required bool hasVisibleUnread,
}) => isSelected || isConnected || (!isCategoryMuted && hasVisibleUnread);
