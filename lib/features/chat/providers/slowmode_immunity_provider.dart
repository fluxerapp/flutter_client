import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slowmode_immunity_provider.g.dart';

@riverpod
Future<bool> isSlowmodeImmune(Ref ref, String channelId) async {
  if (channelId.isEmpty) {
    return false;
  }
  final channel = await ref.watch(channelByIdProvider(channelId).future);
  final guildId = channel?.guildId ?? '';
  if (guildId.isEmpty) {
    return false;
  }
  final bits = await ref
      .read(guildPermissionsProvider.notifier)
      .getPermissions(guildId);
  return hasPermission(bits, Permission.bypassSlowmode) ||
      hasPermission(bits, Permission.manageChannels) ||
      hasPermission(bits, Permission.manageMessages);
}
