import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'thread_ui_providers.g.dart';

List<Channel> _sortedThreads(Iterable<db.Channel> rows) =>
    rows.map(Channel.fromRow).toList()
      ..sort((Channel a, Channel b) => compareSnowflakeIds(a.id, b.id));

@riverpod
Stream<Set<String>> joinedThreadIds(Ref ref) =>
    ref.watch(fluxerDatabaseProvider).threadDao.watchJoinedThreadIds();

@riverpod
Stream<ThreadMembership?> threadMembership(Ref ref, String threadId) => ref
    .watch(fluxerDatabaseProvider)
    .threadDao
    .watchMember(threadId)
    .map(
      (db.ThreadMember? row) => row == null
          ? null
          : ThreadMembership(flags: row.flags, muted: row.muted),
    )
    .distinct();

@riverpod
Stream<List<Channel>> activeGuildThreads(Ref ref, String guildId) {
  if (!ref.watch(threadChannelsActiveProvider(guildId))) {
    return Stream<List<Channel>>.value(const <Channel>[]);
  }
  return ref
      .watch(fluxerDatabaseProvider)
      .threadDao
      .watchActiveThreadsForGuild(guildId)
      .map(_sortedThreads);
}

@riverpod
Stream<List<Channel>> parentThreads(Ref ref, String guildId, String parentId) {
  if (!ref.watch(threadChannelsActiveProvider(guildId))) {
    return Stream<List<Channel>>.value(const <Channel>[]);
  }
  return ref
      .watch(fluxerDatabaseProvider)
      .threadDao
      .watchThreadsForParent(parentId)
      .map(_sortedThreads);
}

Map<String, List<Channel>> groupSidebarThreads({
  required List<Channel> activeThreads,
  required Set<String> joinedIds,
  required Channel? selected,
}) {
  final Map<String, List<Channel>> byParent = <String, List<Channel>>{};
  bool selectedListed = false;
  for (final Channel thread in activeThreads) {
    final String? parentId = thread.parentId;
    if (parentId == null) {
      continue;
    }
    final bool isSelected = thread.id == selected?.id;
    if (!isSelected && !joinedIds.contains(thread.id)) {
      continue;
    }
    selectedListed = selectedListed || isSelected;
    (byParent[parentId] ??= <Channel>[]).add(thread);
  }
  final String? selectedParentId = selected?.parentId;
  if (selected != null &&
      !selectedListed &&
      selected.isThread &&
      selectedParentId != null) {
    (byParent[selectedParentId] ??= <Channel>[])
      ..add(selected)
      ..sort((Channel a, Channel b) => compareSnowflakeIds(a.id, b.id));
  }
  return byParent;
}

@riverpod
Map<String, List<Channel>> sidebarThreadsByParent(Ref ref, String guildId) {
  if (!ref.watch(threadChannelsActiveProvider(guildId))) {
    return const <String, List<Channel>>{};
  }
  final List<Channel> threads =
      ref.watch(activeGuildThreadsProvider(guildId)).value ?? const <Channel>[];
  final Set<String> joined =
      ref.watch(joinedThreadIdsProvider).value ?? const <String>{};
  final String? selectedId = ref.watch(activeChannelIdProvider);
  final Channel? selected = selectedId == null
      ? null
      : ref.watch(channelByIdProvider(selectedId)).value;
  return groupSidebarThreads(
    activeThreads: threads,
    joinedIds: joined,
    selected: selected != null && selected.guildId == guildId ? selected : null,
  );
}

@riverpod
Stream<bool> currentMemberTimedOut(Ref ref, String guildId) {
  final String? userId = ref.watch(currentUserIdProvider);
  if (userId == null || guildId.isEmpty) {
    return Stream<bool>.value(false);
  }
  return ref
      .watch(fluxerDatabaseProvider)
      .memberDao
      .watchMemberByUserId(userId, guildId)
      .map((db.Member? member) {
        final DateTime? until = member?.communicationDisabledUntil;
        return until != null && until.isAfter(DateTime.now());
      })
      .distinct();
}

@riverpod
ThreadActor? parentThreadActor(Ref ref, String guildId, String parentId) {
  final int? perms = ref.watch(
    channelPermissionCacheProvider.select(
      (ChannelPermissionCaches caches) => caches[parentId],
    ),
  );
  if (perms == null) {
    return null;
  }
  final String? userId = ref.watch(currentUserIdProvider);
  final String? ownerId = ref.watch(
    guildListViewModelProvider.select((GuildListViewState state) {
      for (final Guild guild in state.guilds) {
        if (guild.id == guildId) {
          return guild.ownerId;
        }
      }
      return null;
    }),
  );
  return ThreadActor(
    permissions: withImplicitThreadBits(perms),
    isOwner: userId != null && ownerId == userId,
    timedOut: ref.watch(currentMemberTimedOutProvider(guildId)).value ?? false,
  );
}

@riverpod
ThreadActorContext? threadActorContext(Ref ref, String threadId) {
  final Channel? thread = ref.watch(channelByIdProvider(threadId)).value;
  final String? parentId = thread?.parentId;
  if (thread == null || !thread.isThread || parentId == null) {
    return null;
  }
  final ThreadActor? actor = ref.watch(
    parentThreadActorProvider(thread.guildId, parentId),
  );
  if (actor == null) {
    return null;
  }
  final String? userId = ref.watch(currentUserIdProvider);
  return ThreadActorContext(
    permissions: actor.permissions,
    isOwner: actor.isOwner,
    timedOut: actor.timedOut,
    thread: threadFactsOf(thread),
    isThreadOwner: userId != null && thread.ownerId == userId,
    isMember: ref.watch(threadMembershipProvider(threadId)).value != null,
  );
}

@Riverpod(keepAlive: true)
class ThreadCreateCooldowns extends _$ThreadCreateCooldowns {
  @override
  Map<String, DateTime> build() => const <String, DateTime>{};

  void start(String parentId, int seconds) {
    if (seconds <= 0) {
      return;
    }
    final DateTime now = DateTime.now();
    state = <String, DateTime>{
      for (final MapEntry<String, DateTime> entry in state.entries)
        if (entry.value.isAfter(now)) entry.key: entry.value,
      parentId: now.add(Duration(seconds: seconds)),
    };
  }

  int remainingSeconds(String parentId) {
    final DateTime? until = state[parentId];
    if (until == null) {
      return 0;
    }
    final int ms = until.difference(DateTime.now()).inMilliseconds;
    return ms <= 0 ? 0 : (ms / 1000).ceil();
  }
}
