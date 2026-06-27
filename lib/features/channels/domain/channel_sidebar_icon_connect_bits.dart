import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';

/// Resolves connect permission bits for guild sidebar channel icons.
///
/// Returns [cachedBits] when the permission cache has a resolved value.
/// Otherwise uses [computedOutcome] only when its `shouldCache` flag
/// is true. Interim `0` values while guild membership is still loading must not
/// be used, or voice channels incorrectly show restricted icons.
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
