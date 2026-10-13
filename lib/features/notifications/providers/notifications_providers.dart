import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/gateway/channel_last_message_index.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/notifications/data/inbox_visit.dart';
import 'package:fluxer_app/features/notifications/data/merge_void_streams.dart';
import 'package:fluxer_app/features/notifications/data/notifications_repository.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_calculator.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_card_cache.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_view.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/notifications/providers/mention_filters_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notifications_providers.g.dart';

enum NotificationsInboxTab { unreads, mentions }

const String _kMentionSeenBoundaryKeyPrefix = 'notifications_mentions_seen_';

class MentionSeenBoundaryState {
  const MentionSeenBoundaryState({required this.loaded, this.messageId});

  final bool loaded;
  final String? messageId;
}

@Riverpod(keepAlive: true)
class MentionSeenBoundary extends _$MentionSeenBoundary {
  String _key = _kMentionSeenBoundaryKeyPrefix;

  @override
  MentionSeenBoundaryState build() {
    final String key =
        '$_kMentionSeenBoundaryKeyPrefix${ref.watch(currentUserIdProvider) ?? ''}';
    _key = key;
    unawaited(_load(key));
    return const MentionSeenBoundaryState(loaded: false);
  }

  Future<void> _load(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    if (key != _key || state.loaded) {
      return;
    }
    state = MentionSeenBoundaryState(
      loaded: true,
      messageId: preferences.getString(key),
    );
  }

  void markSeen(String messageId) {
    if (!state.loaded || compareSnowflakeIds(messageId, state.messageId) <= 0) {
      return;
    }
    state = MentionSeenBoundaryState(loaded: true, messageId: messageId);
    final String key = _key;
    unawaited(
      SharedPreferences.getInstance().then(
        (SharedPreferences preferences) =>
            preferences.setString(key, messageId),
      ),
    );
  }
}

class MentionInboxVisitState {
  final InboxVisit visit = InboxVisit();
  final Set<String> readThisVisit = <String>{};
  String? boundaryId;
  bool boundaryResolved = false;
  String? ceilingId;

  void start() {
    readThisVisit.clear();
    boundaryId = null;
    boundaryResolved = false;
    ceilingId = null;
  }
}

@Riverpod(keepAlive: true)
MentionInboxVisitState mentionInboxVisit(Ref ref) {
  ref.watch(currentUserIdProvider);
  return MentionInboxVisitState();
}

@Riverpod(keepAlive: true)
class NotificationsInboxSegment extends _$NotificationsInboxSegment {
  @override
  NotificationsInboxTab build() => NotificationsInboxTab.mentions;

  void select(NotificationsInboxTab segment) {
    if (state == segment) {
      return;
    }
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

@Riverpod(keepAlive: true)
UnreadInboxCardCache unreadInboxCardCache(Ref ref) {
  return UnreadInboxCardCache(
    database: ref.watch(fluxerDatabaseProvider),
    repository: ref.watch(notificationsRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
UnreadInboxView unreadInboxView(Ref ref) {
  final UnreadInboxCardCache cache = ref.watch(unreadInboxCardCacheProvider);
  final UnreadInboxView view = UnreadInboxView(loadCard: cache.load);
  ref.onDispose(view.dispose);
  return view;
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
    db.threadDao.watchJoinedMembers(),
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
  MentionFeedUiState build() {
    ref
      ..listen<MentionFilters>(mentionFiltersPreferencesProvider, (_, _) {
        if (state.fetched) {
          unawaited(refresh());
        }
      })
      ..listen<int>(gatewayFullRecoveryProvider, (_, _) {
        if (state.fetched) {
          unawaited(refresh());
        }
      });
    return MentionFeedUiState();
  }

  Future<void> refresh() async {
    final MentionFilters filters = ref.read(mentionFiltersPreferencesProvider);
    state = state.copyWith(busy: true, resetError: true);
    try {
      final repo = ref.read(notificationsRepositoryProvider);
      final bool hasMore = await repo.replaceMentionsFromApi(
        includeEveryone: filters.includeEveryone,
        includeRoles: filters.includeRoles,
        includeGuilds: filters.includeGuilds,
      );
      state = MentionFeedUiState(fetched: true, hasMore: hasMore);
    } on Object catch (e) {
      state = MentionFeedUiState(fetched: true, lastError: e);
    }
  }

  Future<void> loadMorePage({required String beforeMessageId}) async {
    if (state.busy || !state.hasMore) {
      return;
    }
    final MentionFilters filters = ref.read(mentionFiltersPreferencesProvider);
    state = state.copyWith(busy: true);
    try {
      final NotificationsRepository repo = ref.read(
        notificationsRepositoryProvider,
      );
      final bool hasMore = await repo.loadMoreMentions(
        includeEveryone: filters.includeEveryone,
        includeRoles: filters.includeRoles,
        includeGuilds: filters.includeGuilds,
        beforeMessageId: beforeMessageId,
      );
      state = state.copyWith(busy: false, hasMore: hasMore);
    } on Object catch (e) {
      state = state.copyWith(busy: false, lastError: e);
    }
  }
}
