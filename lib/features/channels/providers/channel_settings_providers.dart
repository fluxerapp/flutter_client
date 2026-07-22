import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_overview_update.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_overwrite_update.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_dart/export.dart' hide Error;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_settings_providers.g.dart';

@riverpod
class ChannelSettingsActions extends _$ChannelSettingsActions {
  @override
  // Action notifier base type for Riverpod mutations.
  // ignore: avoid_futureor_void
  FutureOr<void> build(String channelId) {}

  Future<Channel> updateOverview({
    required Channel channel,
    required ChannelOverviewFormState current,
    required ChannelOverviewFormState original,
    required bool canManageChannel,
    required bool canUpdateRtcRegion,
  }) async {
    if (!ref.mounted) {
      throw StateError('Provider disposed');
    }
    // Async notifier loading state for void action providers.
    // ignore: void_checks
    state = const AsyncLoading<void>();
    final AsyncValue<Channel> result = await _runWithKeepAlive(
      () => AsyncValue.guard(() {
        return ref
            .read(channelRepositoryProvider)
            .updateChannelOverview(
              channel: channel,
              current: current,
              original: original,
              canManageChannel: canManageChannel,
              canUpdateRtcRegion: canUpdateRtcRegion,
            );
      }),
    );
    if (ref.mounted) {
      state = result.when(
        data: (_) => const AsyncData<void>(null),
        error: AsyncError.new,
        loading: () => const AsyncLoading<void>(),
      );
    }
    return result.when(
      data: (Channel updated) => updated,
      error: Error.throwWithStackTrace,
      loading: () => throw StateError('Unexpected loading state'),
    );
  }

  Future<Channel> updatePermissionOverwrites({
    required Channel channel,
    required List<ChannelPermissionOverwriteEntry> overwrites,
  }) async {
    if (!ref.mounted) {
      throw StateError('Provider disposed');
    }
    // Async notifier loading state for void action providers.
    // ignore: void_checks
    state = const AsyncLoading<void>();
    final AsyncValue<Channel> result = await _runWithKeepAlive(
      () => AsyncValue.guard(() {
        return ref
            .read(channelRepositoryProvider)
            .updateChannelPermissionOverwrites(
              channel: channel,
              overwrites: overwrites,
            );
      }),
    );
    if (ref.mounted) {
      state = result.when(
        data: (_) => const AsyncData<void>(null),
        error: AsyncError.new,
        loading: () => const AsyncLoading<void>(),
      );
    }
    return result.when(
      data: (Channel updated) => updated,
      error: Error.throwWithStackTrace,
      loading: () => throw StateError('Unexpected loading state'),
    );
  }

  Future<T> _runWithKeepAlive<T>(Future<T> Function() operation) async {
    final keepAlive = ref.keepAlive();
    try {
      return await operation();
    } finally {
      keepAlive.close();
    }
  }
}

@riverpod
Future<List<RtcRegionResponse>> channelRtcRegions(Ref ref, String channelId) {
  return ref.read(channelRepositoryProvider).listRtcRegions(channelId);
}

@riverpod
Future<int?> channelSettingsPermissionBits(Ref ref, String channelId) async {
  if (channelId.isEmpty) {
    return 0;
  }
  final channelRow = await ref
      .read(fluxerDatabaseProvider)
      .channelDao
      .getChannelById(channelId);
  if (channelRow == null) {
    return 0;
  }
  if (channelRow.guildId.isEmpty) {
    return 0;
  }
  final String guildId = channelRow.guildId;
  ref
    ..watch(guildListViewModelProvider)
    ..watch(currentUserMemberIdentityProvider(guildId))
    ..watch(guildRolePermissionsIdentityProvider(guildId))
    ..watch(channelPermissionCacheProvider);
  final int? cachedBits = ref
      .read(channelPermissionCacheProvider.notifier)
      .getChannelBits(channelId);
  if (cachedBits != null) {
    return cachedBits;
  }
  await ref
      .read(channelPermissionCacheProvider.notifier)
      .rebuildChannel(channelId);
  return ref
      .read(channelPermissionCacheProvider.notifier)
      .getChannelBits(channelId);
}
