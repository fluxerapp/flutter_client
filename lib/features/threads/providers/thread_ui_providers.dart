import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
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
Stream<ThreadMembership?> threadMembership(Ref ref, String threadId) {
  Timer? expiry;
  ref.onDispose(() => expiry?.cancel());
  return ref.watch(fluxerDatabaseProvider).threadDao.watchMember(threadId).map((
    db.ThreadMember? row,
  ) {
    expiry?.cancel();
    if (row == null) {
      return null;
    }
    final DateTime now = DateTime.now();
    final bool muted = isThreadMemberMuted(row, now);
    final DateTime? end = DateTime.tryParse(threadMemberMuteEndTime(row) ?? '');
    if (muted && end != null) {
      expiry = Timer(end.difference(now), ref.invalidateSelf);
    }
    return ThreadMembership(flags: row.flags, muted: muted);
  }).distinct();
}

@riverpod
Stream<List<Channel>> activeGuildThreads(Ref ref, String guildId) {
  return ref
      .watch(fluxerDatabaseProvider)
      .threadDao
      .watchActiveThreadsForGuild(guildId)
      .map(_sortedThreads);
}

@riverpod
Stream<List<Channel>> parentThreads(Ref ref, String guildId, String parentId) {
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
  Timer? expiry;
  ref.onDispose(() => expiry?.cancel());
  return ref
      .watch(fluxerDatabaseProvider)
      .memberDao
      .watchMemberByUserId(userId, guildId)
      .map((db.Member? member) {
        expiry?.cancel();
        final DateTime? until = member?.communicationDisabledUntil;
        final DateTime now = DateTime.now();
        if (until == null || !until.isAfter(now)) {
          return false;
        }
        expiry = Timer(until.difference(now), ref.invalidateSelf);
        return true;
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
