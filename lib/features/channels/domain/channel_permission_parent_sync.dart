import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';

bool? resolveChannelParentSyncStatus({
  required Channel channel,
  required Channel? parentChannel,
}) {
  if (channel.parentId == null ||
      parentChannel == null ||
      !parentChannel.isCategory ||
      channel.isCategory) {
    return null;
  }
  final Map<String, ChannelOverwriteEntry> channelOverwrites = _overwriteMap(
    channel.permissionOverwritesJson,
  );
  final Map<String, ChannelOverwriteEntry> parentOverwrites = _overwriteMap(
    parentChannel.permissionOverwritesJson,
  );
  final List<String> channelKeys = channelOverwrites.keys.toList()..sort();
  final List<String> parentKeys = parentOverwrites.keys.toList()..sort();
  if (channelKeys.length != parentKeys.length) {
    return false;
  }
  for (int i = 0; i < channelKeys.length; i++) {
    if (channelKeys[i] != parentKeys[i]) {
      return false;
    }
  }
  for (final String key in channelKeys) {
    final ChannelOverwriteEntry? channelEntry = channelOverwrites[key];
    final ChannelOverwriteEntry? parentEntry = parentOverwrites[key];
    if (channelEntry == null || parentEntry == null) {
      return false;
    }
    if (channelEntry.isRoleType != parentEntry.isRoleType ||
        channelEntry.allow != parentEntry.allow ||
        channelEntry.deny != parentEntry.deny) {
      return false;
    }
  }
  return true;
}

Map<String, ChannelOverwriteEntry> _overwriteMap(String? json) {
  final List<ChannelOverwriteEntry> entries =
      parseChannelPermissionOverwritesJson(json);
  return <String, ChannelOverwriteEntry>{
    for (final ChannelOverwriteEntry entry in entries) entry.id: entry,
  };
}
