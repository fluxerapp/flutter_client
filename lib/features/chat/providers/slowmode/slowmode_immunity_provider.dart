import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slowmode_immunity_provider.g.dart';

@riverpod
Future<bool> isSlowmodeImmune(Ref ref, String channelId) async {
  if (channelId.isEmpty) {
    return false;
  }
  final ChannelPermissionBitsOutcome outcome =
      await computeEffectiveGuildChannelPermissionBitsOutcome(
        ref: ref,
        channelId: channelId,
      );
  return hasPermission(outcome.value, Permission.bypassSlowmode);
}
