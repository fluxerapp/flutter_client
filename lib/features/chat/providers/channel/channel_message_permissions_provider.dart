import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_message_permissions_provider.g.dart';

/// Effective flags for the message composer from guild base bits, roles, and
/// channel/category permission overwrites stored on local channel rows.
class ChannelMessagePermissions {
  final bool isResolved;
  final bool canSendMessages;
  final bool canAttachFiles;
  final bool canEmbedLinks;
  final bool canUseExternalEmojis;
  final bool canUseExternalStickers;

  const ChannelMessagePermissions({
    required this.isResolved,
    required this.canSendMessages,
    required this.canAttachFiles,
    required this.canEmbedLinks,
    required this.canUseExternalEmojis,
    required this.canUseExternalStickers,
  });

  /// Guild channel permissions are not loaded yet; composer stays disabled.
  static const ChannelMessagePermissions unresolved = ChannelMessagePermissions(
    isResolved: false,
    canSendMessages: false,
    canAttachFiles: false,
    canEmbedLinks: false,
    canUseExternalEmojis: false,
    canUseExternalStickers: false,
  );

  static const ChannelMessagePermissions none = ChannelMessagePermissions(
    isResolved: true,
    canSendMessages: false,
    canAttachFiles: false,
    canEmbedLinks: false,
    canUseExternalEmojis: false,
    canUseExternalStickers: false,
  );

  static const ChannelMessagePermissions all = ChannelMessagePermissions(
    isResolved: true,
    canSendMessages: true,
    canAttachFiles: true,
    canEmbedLinks: true,
    canUseExternalEmojis: true,
    canUseExternalStickers: true,
  );

  bool get isComposerEnabled => isResolved && canSendMessages;

  bool get showsNoSendPermissionHint => isResolved && !canSendMessages;

  /// Attach controls follow the same send gate as the text field
  bool get canShowAttachControls => isComposerEnabled && canAttachFiles;

  bool get isAttachEnabled => canShowAttachControls;

  bool get canShowEmbedControls => isComposerEnabled && canEmbedLinks;

  bool get isVoiceEnabled => isComposerEnabled && canAttachFiles;
}

ChannelMessagePermissions channelMessagePermissionsFromBits({
  required int bits,
  required ChannelType channelType,
}) {
  return ChannelMessagePermissions(
    isResolved: true,
    canSendMessages: hasPermission(bits, Permission.sendMessages),
    canAttachFiles: hasPermission(bits, Permission.attachFiles),
    canEmbedLinks: hasPermission(bits, Permission.embedLinks),
    canUseExternalEmojis: hasPermission(bits, Permission.useExternalEmojis),
    canUseExternalStickers: hasPermission(bits, Permission.useExternalStickers),
  );
}

@riverpod
Future<ChannelMessagePermissions> channelMessagePermissions(
  Ref ref,
  String channelId,
) async {
  if (channelId.isEmpty) {
    return ChannelMessagePermissions.none;
  }
  final bool isDmChannel = ref.watch(
    dmViewModelProvider.select(
      (state) => findDmById(state.conversations, channelId) != null,
    ),
  );
  if (isDmChannel) {
    final dm = findDmById(
      ref.watch(dmViewModelProvider.select((state) => state.conversations)),
      channelId,
    );
    if (dm != null && isSystemDmConversation(dm)) {
      return ChannelMessagePermissions.none;
    }
    return ChannelMessagePermissions.all;
  }
  final String? currentUserId = ref.watch(currentUserIdProvider);
  if (isPersonalNotesChannelRoute(
    channelId: channelId,
    currentUserId: currentUserId,
  )) {
    return ChannelMessagePermissions.all;
  }
  final dmRow = await ref
      .read(fluxerDatabaseProvider)
      .dmChannelDao
      .getDmChannelById(channelId);
  if (dmRow != null && isDmPersonalNotesType(dmRow.type)) {
    return ChannelMessagePermissions.all;
  }
  await ref.watch(channelPermissionIdentityProvider(channelId).future);
  final channelRow = await ref
      .read(fluxerDatabaseProvider)
      .channelDao
      .getChannelById(channelId);
  if (channelRow == null) {
    return ChannelMessagePermissions.none;
  }
  final Channel channel = Channel.fromRow(channelRow);
  if (channel.guildId.isEmpty) {
    return ChannelMessagePermissions.none;
  }
  final String guildId = channel.guildId;
  ref
    ..watch(guildListViewModelProvider)
    ..watch(currentUserMemberIdentityProvider(guildId))
    ..watch(guildRolePermissionsIdentityProvider(guildId))
    ..watch(channelPermissionCacheProvider);
  final int? cachedBits = ref
      .read(channelPermissionCacheProvider.notifier)
      .getChannelBits(channelId);
  if (cachedBits == null) {
    await ref
        .read(channelPermissionCacheProvider.notifier)
        .rebuildChannel(channelId);
    final int? bitsAfterRebuild = ref
        .read(channelPermissionCacheProvider.notifier)
        .getChannelBits(channelId);
    if (bitsAfterRebuild == null) {
      return ChannelMessagePermissions.unresolved;
    }
    return channelMessagePermissionsFromBits(
      bits: bitsAfterRebuild,
      channelType: channel.type,
    );
  }
  return channelMessagePermissionsFromBits(
    bits: cachedBits,
    channelType: channel.type,
  );
}

ChannelMessagePermissions channelMessagePermissionsForComposer(
  AsyncValue<ChannelMessagePermissions> async,
) {
  return async.when(
    skipLoadingOnReload: true,
    data: (ChannelMessagePermissions value) => value,
    error: (Object _, StackTrace _) => ChannelMessagePermissions.unresolved,
    loading: () => ChannelMessagePermissions.unresolved,
  );
}

/// Resolves composer permissions synchronously when possible
ChannelMessagePermissions? syncChannelMessagePermissions(
  WidgetRef ref,
  String channelId, {
  required bool watch,
}) {
  if (channelId.isEmpty) {
    return ChannelMessagePermissions.none;
  }
  final DmViewState dmState = watch
      ? ref.watch(dmViewModelProvider)
      : ref.read(dmViewModelProvider);
  final DmConversation? dm = findDmById(dmState.conversations, channelId);
  if (dm != null) {
    if (isSystemDmConversation(dm)) {
      return ChannelMessagePermissions.none;
    }
    return ChannelMessagePermissions.all;
  }
  final String? currentUserId = watch
      ? ref.watch(currentUserIdProvider)
      : ref.read(currentUserIdProvider);
  if (isPersonalNotesChannelRoute(
    channelId: channelId,
    currentUserId: currentUserId,
  )) {
    return ChannelMessagePermissions.all;
  }
  final int? cachedBits = watch
      ? ref.watch(
          channelPermissionCacheProvider.select(
            (ChannelPermissionCaches caches) => caches.effective[channelId],
          ),
        )
      : ref.read(
          channelPermissionCacheProvider.select(
            (ChannelPermissionCaches caches) => caches.effective[channelId],
          ),
        );
  if (cachedBits != null) {
    return channelMessagePermissionsFromBits(
      bits: cachedBits,
      channelType: ChannelType.guildText,
    );
  }
  return null;
}

ChannelMessagePermissions watchChannelMessagePermissionsForComposer(
  WidgetRef ref,
  String channelId,
) {
  final ChannelMessagePermissions? sync = syncChannelMessagePermissions(
    ref,
    channelId,
    watch: true,
  );
  if (sync != null) {
    ref.watch(channelMessagePermissionsProvider(channelId));
    return sync;
  }
  return channelMessagePermissionsForComposer(
    ref.watch(channelMessagePermissionsProvider(channelId)),
  );
}

ChannelMessagePermissions readChannelMessagePermissionsForComposer(
  WidgetRef ref,
  String channelId,
) {
  final ChannelMessagePermissions? sync = syncChannelMessagePermissions(
    ref,
    channelId,
    watch: false,
  );
  if (sync != null) {
    return sync;
  }
  return channelMessagePermissionsForComposer(
    ref.read(channelMessagePermissionsProvider(channelId)),
  );
}
