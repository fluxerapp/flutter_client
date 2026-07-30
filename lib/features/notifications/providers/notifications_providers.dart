import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/gateway/channel_last_message_index.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/notifications/data/merge_void_streams.dart';
import 'package:fluxer_app/features/notifications/data/notifications_repository.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_calculator.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_providers.g.dart';

enum NotificationsInboxTab { unreads, mentions }

@Riverpod(keepAlive: true)
class NotificationsInboxSegment extends _$NotificationsInboxSegment {
  @override
  NotificationsInboxTab build() => NotificationsInboxTab.mentions;

  void set(NotificationsInboxTab segment) {
    state = segment;
  }
}

@Riverpod(keepAlive: true)
NotificationsRepository notificationsRepository(Ref ref) {
  return NotificationsRepository(
    database: ref.watch(fluxerDatabaseProvider),
    messageRepository: ref.watch(messageRepositoryProvider),
    client: ref.watch(fluxerClientProvider),
    currentUserId: ref.watch(currentUserIdProvider),
  );
}

@Riverpod()
Stream<List<UnreadInboxEntry>> unreadInboxChannelList(Ref ref) {
  final FluxerDatabase db = ref.watch(fluxerDatabaseProvider);
  final String? currentUserId = ref.watch(currentUserIdProvider);
  final ChannelLastMessageIndex lastMessageIndex = ref.watch(
    channelLastMessageIndexProvider,
  );
  final Stream<void> tick = mergeVoidStreams(<Stream<dynamic>>[
    db.readStateDao.watchReadStates(),
    lastMessageIndex.flushStream,
    db.dmChannelDao.watchDmChannels(),
    db.guildDao.watchServers(),
    db.userGuildSettingsDao.watchAll(),
    db.notificationDao.watchUnreadCollapsedRows(),
  ]);
  return tick.asyncMap((_) async {
    final rows = await db.notificationDao.getUnreadCollapsedRows();
    final collapsedMap = <String, bool>{
      for (final NotificationUnreadCollapsedData r in rows)
        r.channelId: r.isCollapsed,
    };
    return UnreadInboxCalculator.compute(
      db,
      collapsedByChannelId: collapsedMap,
      currentUserId: currentUserId,
    );
  });
}

class MentionFeedUiState {
  MentionFeedUiState({
    this.fetched = false,
    this.busy = false,
    this.hasMore = false,
    this.lastError,
  });

  final bool fetched;
  final bool busy;
  final bool hasMore;
  final Object? lastError;

  MentionFeedUiState copyWith({
    bool? fetched,
    bool? busy,
    bool? hasMore,
    Object? lastError,
    bool resetError = false,
  }) {
    return MentionFeedUiState(
      fetched: fetched ?? this.fetched,
      busy: busy ?? this.busy,
      hasMore: hasMore ?? this.hasMore,
      lastError: resetError ? null : (lastError ?? this.lastError),
    );
  }
}

@Riverpod(keepAlive: true)
class MentionFeedCoordinator extends _$MentionFeedCoordinator {
  @override
  MentionFeedUiState build() => MentionFeedUiState();

  Future<void> refreshWithFilters({
    required bool includeEveryone,
    required bool includeRoles,
    required bool includeGuilds,
  }) async {
    state = state.copyWith(busy: true, resetError: true);
    try {
      final repo = ref.read(notificationsRepositoryProvider);
      final bool hasMore = await repo.replaceMentionsFromApi(
        includeEveryone: includeEveryone,
        includeRoles: includeRoles,
        includeGuilds: includeGuilds,
      );
      state = MentionFeedUiState(fetched: true, hasMore: hasMore);
    } on Object catch (e) {
      state = MentionFeedUiState(fetched: true, lastError: e);
    }
  }

  Future<void> loadMorePage({
    required bool includeEveryone,
    required bool includeRoles,
    required bool includeGuilds,
    required String beforeMessageId,
  }) async {
    if (state.busy || !state.hasMore) {
      return;
    }
    state = state.copyWith(busy: true);
    try {
      final NotificationsRepository repo = ref.read(
        notificationsRepositoryProvider,
      );
      final bool hasMore = await repo.loadMoreMentions(
        includeEveryone: includeEveryone,
        includeRoles: includeRoles,
        includeGuilds: includeGuilds,
        beforeMessageId: beforeMessageId,
      );
      state = state.copyWith(busy: false, hasMore: hasMore);
    } on Object catch (e) {
      state = state.copyWith(busy: false, lastError: e);
    }
  }
}
