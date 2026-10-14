import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as local;
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isThreadChannelType, isThreadOnlyChannelType;
import 'package:fluxer_app/features/channels/providers/guild_channel_unread_snapshot_provider.dart';
import 'package:fluxer_app/features/channels/providers/read_state_write_batcher_provider.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart'
    show forumNewPostsUnreadEnabled;
import 'package:fluxer_app/features/guilds/providers/user_guild_settings_data_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unread_provider.g.dart';

@immutable
class UnreadState {
  final bool hasUnread;
  final bool hasUnreadMessages;
  final int mentionCount;
  final bool hasUnreadPins;
  final UserNotificationSettings? unreadBadgesLevel;

  const UnreadState({
    this.hasUnread = false,
    this.hasUnreadMessages = false,
    this.mentionCount = 0,
    this.hasUnreadPins = false,
    this.unreadBadgesLevel,
  });

  @override
  bool operator ==(Object other) =>
      other is UnreadState &&
      other.hasUnread == hasUnread &&
      other.hasUnreadMessages == hasUnreadMessages &&
      other.mentionCount == mentionCount &&
      other.hasUnreadPins == hasUnreadPins &&
      other.unreadBadgesLevel == unreadBadgesLevel;

  @override
  int get hashCode => Object.hash(
    hasUnread,
    hasUnreadMessages,
    mentionCount,
    hasUnreadPins,
    unreadBadgesLevel,
  );
}

@Riverpod(keepAlive: true)
Map<String, UnreadState> channelUnreadLastKnown(Ref ref) {
  ref.watch(currentUserIdProvider);
  return <String, UnreadState>{};
}

@riverpod
UnreadState? channelUnreadOrLastKnown(Ref ref, String channelId) {
  ref.watch(readStateOverlayVersionProvider);
  final ReadStateWriteBatcher batcher = ref.read(readStateWriteBatcherProvider);
  if (batcher.hasOverlay(channelId)) {
    final UnreadState? fromStream = ref
        .watch(channelUnreadProvider(channelId))
        .value;
    if (fromStream != null) {
      return fromStream;
    }
  }
  final UnreadState? fromFold = ref.watch(
    guildChannelUnreadFoldProvider,
  )[channelId];
  if (fromFold != null) {
    return fromFold;
  }
  return ref.watch(channelUnreadProvider(channelId)).value ??
      ref.watch(channelUnreadLastKnownProvider)[channelId];
}

const int kRetainedGuildUnreadSets = 3;

@Riverpod(keepAlive: true)
class RecentGuildUnreadRetention extends _$RecentGuildUnreadRetention {
  final List<({String guildId, List<ProviderSubscription<Object?>> subs})>
  _retained = <({String guildId, List<ProviderSubscription<Object?>> subs})>[];

  @override
  void build() {
    ref.onDispose(_releaseAll);
  }

  void retain(String guildId, Iterable<String> channelIds) {
    final int existing = _retained.indexWhere(
      (entry) => entry.guildId == guildId,
    );
    if (existing >= 0) {
      _release(_retained.removeAt(existing).subs);
    }
    _retained.insert(0, (
      guildId: guildId,
      subs: <ProviderSubscription<Object?>>[
        for (final String channelId in channelIds)
          ref.container.listen<Object?>(
            channelUnreadProvider(channelId),
            (_, _) {},
          ),
      ],
    ));
    while (_retained.length > kRetainedGuildUnreadSets) {
      _release(_retained.removeLast().subs);
    }
  }

  void _release(List<ProviderSubscription<Object?>> subs) {
    for (final ProviderSubscription<Object?> sub in subs) {
      sub.close();
    }
  }

  void _releaseAll() {
    for (final entry in _retained) {
      _release(entry.subs);
    }
    _retained.clear();
  }
}

@riverpod
bool? channelUnreadCanView(Ref ref, String channelId) {
  final int? bits = ref.watch(
    channelPermissionCacheProvider.select(
      (ChannelPermissionCaches caches) => caches[channelId],
    ),
  );
  if (bits == null) {
    unawaited(
      ref
          .read(channelPermissionCacheProvider.notifier)
          .rebuildChannel(channelId),
    );
    return null;
  }
  return hasPermission(bits, Permission.viewChannel);
}

@riverpod
Stream<UnreadState> channelUnread(Ref ref, String channelId) {
  final db = ref.watch(fluxerDatabaseProvider);
  final Map<String, UnreadState> lastKnown = ref.watch(
    channelUnreadLastKnownProvider,
  );
  ref.watch(gatewayReadyProvider);
  final bool? canView = ref.watch(channelUnreadCanViewProvider(channelId));
  final ProviderContainer container = ref.container;
  final readStateWriteBatcher = ref.read(readStateWriteBatcherProvider);

  final controller = StreamController<UnreadState>();
  var disposed = false;
  var recomputeRunning = false;
  var recomputeAgain = false;
  String? watchedSettingsGuildId;
  ProviderSubscription<AsyncValue<String?>>? settingsSub;
  StreamSubscription<Object?>? threadMemberSub;
  UnreadState? lastEmitted;
  local.ReadState? lastReadState;
  ({String? lastMessageId, int mentionCount})? lastEffective;

  void emit(UnreadState next) {
    if (disposed || next == lastEmitted) {
      return;
    }
    lastEmitted = next;
    lastKnown[channelId] = next;
    controller.add(next);
  }

  late void Function() scheduleRecompute;

  bool isActive() => !disposed && ref.mounted;

  Future<void> recompute() async {
    if (!isActive()) {
      return;
    }

    final channel = await db.channelDao.getChannelById(channelId);
    if (!isActive()) {
      return;
    }
    if (canView == false) {
      emit(const UnreadState());
      return;
    }
    final readState = await db.readStateDao.getReadState(channelId);
    if (!isActive()) {
      return;
    }
    final effective = readStateWriteBatcher.effectiveFields(
      channelId,
      readState,
    );
    lastReadState = readState;
    lastEffective = (
      lastMessageId: effective.lastMessageId,
      mentionCount: effective.mentionCount,
    );
    final mentionCount = effective.mentionCount;
    final ackLastMessageId = effective.lastMessageId;
    final latestMessageId = await resolveLatestMessageIdForUnreadDisplay(
      db,
      channelId,
      channelLastMessageId: channel?.lastMessageId,
      ackLastMessageId: ackLastMessageId,
      mentionCount: mentionCount,
    );
    if (!isActive()) {
      return;
    }
    if (channel != null &&
        channel.guildId.isNotEmpty &&
        watchedSettingsGuildId != channel.guildId) {
      settingsSub?.close();
      watchedSettingsGuildId = channel.guildId;
      settingsSub = container.listen<AsyncValue<String?>>(
        userGuildSettingsDataProvider.select(
          (AsyncValue<Map<String, String>> all) => all.whenData(
            (Map<String, String> byGuild) => byGuild[channel.guildId],
          ),
        ),
        (_, _) => scheduleRecompute(),
      );
    }

    final String? guildSettingsData = channel == null
        ? null
        : settingsSub?.read().value;
    final decodedGuildSettings = guildSettingsData == null
        ? null
        : decodeUserGuildSettings(guildSettingsData);
    final unreadBadgesLevel = channel == null
        ? null
        : resolveUnreadBadgesLevel(
            channel: channel,
            guildSettings: decodedGuildSettings,
          );
    final fallbackAckMs = channel == null ? snowflakeTimestampMs(channelId) : 0;
    final bool isThread = channel != null && isThreadChannelType(channel.type);
    if (isThread && threadMemberSub == null) {
      threadMemberSub = db.threadDao
          .watchMember(channelId)
          .skip(1)
          .listen((_) => scheduleRecompute());
    }
    if (!isActive()) {
      return;
    }
    final bool unreadTracked =
        (!isThread || await db.threadDao.getMember(channelId) != null) &&
        !(channel != null &&
            isThreadOnlyChannelType(channel.type) &&
            !forumNewPostsUnreadEnabled(
              decodedGuildSettings?.channelOverrides?[channelId]?.flags,
            ));
    final hasUnreadMessage =
        unreadTracked &&
        hasUnreadByReadState(
          channelLastMessageId: latestMessageId,
          ackLastMessageId: ackLastMessageId,
          fallbackAckMs: fallbackAckMs,
          mentionCount: 0,
          isGuildChannel: channel != null,
        );
    final hasUnread = mentionCount > 0 || hasUnreadMessage;

    final hasPinUnread = hasUnreadPins(
      channelLastPinTimestamp: channel?.lastPinTimestamp,
      ackLastPinTimestamp: readState?.lastPinTimestamp,
    );

    emit(
      UnreadState(
        hasUnread: hasUnread,
        hasUnreadMessages: hasUnreadMessage,
        mentionCount: mentionCount,
        hasUnreadPins: hasPinUnread,
        unreadBadgesLevel: unreadBadgesLevel,
      ),
    );
  }

  Future<void> runRecompute() async {
    recomputeRunning = true;
    try {
      do {
        recomputeAgain = false;
        await recompute();
      } while (recomputeAgain && isActive());
    } on Object catch (error, stackTrace) {
      talker.error(
        '[Unread] recompute failed for $channelId',
        error,
        stackTrace,
      );
    } finally {
      recomputeRunning = false;
    }
  }

  scheduleRecompute = () {
    if (disposed) {
      return;
    }
    if (recomputeRunning) {
      recomputeAgain = true;
      return;
    }
    unawaited(runRecompute());
  };

  final channelSub = db.channelDao
      .watchChannelById(channelId)
      .distinct()
      .listen((_) => scheduleRecompute());
  final readStateSub = db.readStateDao
      .watchReadState(channelId)
      .distinct()
      .listen((_) => scheduleRecompute());
  final messageSub = db.messageDao
      .watchLastMessage(channelId)
      .map((message) => message?.id)
      .distinct()
      .listen((_) => scheduleRecompute());
  final indexSub = ref
      .watch(channelLastMessageIndexProvider)
      .flushStream
      .where((Map<String, String> updates) => updates.containsKey(channelId))
      .listen((_) => scheduleRecompute());
  ref.listen<int>(readStateOverlayVersionProvider, (_, _) {
    if (canView == false) {
      return;
    }
    final ({String? lastMessageId, int mentionCount})? used = lastEffective;
    if (used == null) {
      scheduleRecompute();
      return;
    }
    final next = readStateWriteBatcher.effectiveFields(
      channelId,
      lastReadState,
    );
    if (next.lastMessageId != used.lastMessageId ||
        next.mentionCount != used.mentionCount) {
      scheduleRecompute();
    }
  });

  scheduleRecompute();

  ref.onDispose(() {
    disposed = true;
    unawaited(channelSub.cancel());
    unawaited(readStateSub.cancel());
    unawaited(messageSub.cancel());
    unawaited(indexSub.cancel());
    settingsSub?.close();
    unawaited(threadMemberSub?.cancel());
    unawaited(controller.close());
  });

  return controller.stream;
}

const Duration kGuildUnreadPrimeLimit = Duration(milliseconds: 150);

Future<void> primeGuildChannelUnreads(
  ProviderContainer container,
  String guildId,
) async {
  final List<local.Channel> channels = await container
      .read(fluxerDatabaseProvider)
      .channelDao
      .getChannels(guildId);
  final Map<String, UnreadState> lastKnown = container.read(
    channelUnreadLastKnownProvider,
  );
  final List<String> missing = <String>[
    for (final local.Channel channel in channels)
      if (!lastKnown.containsKey(channel.id)) channel.id,
  ];
  if (missing.isEmpty) {
    return;
  }
  final List<ProviderSubscription<AsyncValue<UnreadState>>> subs =
      <ProviderSubscription<AsyncValue<UnreadState>>>[
        for (final String channelId in missing)
          container.listen<AsyncValue<UnreadState>>(
            channelUnreadProvider(channelId),
            (_, _) {},
          ),
      ];
  try {
    await Future.wait<UnreadState>(<Future<UnreadState>>[
      for (final String channelId in missing)
        container.read(channelUnreadProvider(channelId).future),
    ]).timeout(kGuildUnreadPrimeLimit);
  } on TimeoutException {
    return;
  } finally {
    for (final ProviderSubscription<Object?> sub in subs) {
      sub.close();
    }
  }
}
