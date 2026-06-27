import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel_sidebar_icon_connect_bits.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_sidebar_icon_connect_bits_provider.g.dart';

@riverpod
Future<int?> channelSidebarIconConnectBits(Ref ref, String channelId) async {
  final int? cachedBits = ref.watch(
    channelPermissionCacheProvider.select(
      (Map<String, int> map) => map[channelId],
    ),
  );
  if (cachedBits != null) {
    return cachedBits;
  }
  final ChannelPermissionBitsOutcome outcome =
      await computeEffectiveGuildChannelPermissionBitsOutcome(
        ref: ref,
        channelId: channelId,
      );
  return resolveChannelSidebarIconConnectBits(
    cachedBits: null,
    computedOutcome: outcome,
  );
}
