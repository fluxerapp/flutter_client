import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';

int? resolveChannelSidebarIconConnectBits({
  int? cachedBits,
  ChannelPermissionBitsOutcome? computedOutcome,
}) {
  if (cachedBits != null) {
    return cachedBits;
  }
  if (computedOutcome == null || !computedOutcome.shouldCache) {
    return null;
  }
  return computedOutcome.value;
}
