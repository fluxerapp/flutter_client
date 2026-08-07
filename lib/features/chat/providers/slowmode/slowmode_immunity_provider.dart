import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slowmode_immunity_provider.g.dart';

@riverpod
Future<bool> isSlowmodeImmune(Ref ref, String channelId) async {
  if (channelId.isEmpty) {
    return false;
  }
  final int? cachedBits = ref.read(channelPermissionCacheProvider)[channelId];
  if (cachedBits != null && bypassesSlowmode(cachedBits)) {
    return true;
  }
  final ChannelPermissionBitsOutcome outcome =
      await computeEffectiveGuildChannelPermissionBitsOutcome(
        ref: ref,
        channelId: channelId,
      );
  return bypassesChannelSlowmode(outcome);
}
