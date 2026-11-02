import 'dart:async';

import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/providers/read_state_write_batcher_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dm_view_model.g.dart';

enum FriendsTab { online, all, pending, blocked }

class DmViewState {
  final List<DmConversation> conversations;
  final List<Friend> friendsList;
  final FriendsTab activeTab;
  final String searchQuery;
  final bool hasReceivedInitialConversations;

  const DmViewState({
    required this.conversations,
    required this.friendsList,
    required this.activeTab,
    required this.searchQuery,
    this.hasReceivedInitialConversations = false,
  });

  List<Friend> get filteredFriends {
    final query = searchQuery.toLowerCase();

    List<Friend> filtered;
    switch (activeTab) {
      case FriendsTab.online:
        filtered = friendsList
            .where(
              (f) =>
                  f.friendStatus == FriendStatus.accepted &&
                  f.status != 'offline',
            )
            .toList();
        if (filtered.isEmpty) {
          filtered = friendsList
              .where((f) => f.friendStatus == FriendStatus.accepted)
              .toList();
        }
      case FriendsTab.all:
        filtered = friendsList
            .where((f) => f.friendStatus == FriendStatus.accepted)
            .toList();
      case FriendsTab.pending:
        filtered = friendsList
            .where(
              (f) =>
                  f.friendStatus == FriendStatus.pendingIncoming ||
                  f.friendStatus == FriendStatus.pendingOutgoing,
            )
            .toList();
      case FriendsTab.blocked:
        filtered = friendsList
            .where((f) => f.friendStatus == FriendStatus.blocked)
            .toList();
    }

    if (query.isNotEmpty) {
      filtered = filtered
          .where((f) => f.username.toLowerCase().contains(query))
          .toList();
    }

    return filtered;
  }

  DmViewState copyWith({
    List<DmConversation>? conversations,
    List<Friend>? friendsList,
    FriendsTab? activeTab,
    String? searchQuery,
    bool? hasReceivedInitialConversations,
  }) {
    return DmViewState(
      conversations: conversations ?? this.conversations,
      friendsList: friendsList ?? this.friendsList,
      activeTab: activeTab ?? this.activeTab,
      searchQuery: searchQuery ?? this.searchQuery,
      hasReceivedInitialConversations:
          hasReceivedInitialConversations ??
          this.hasReceivedInitialConversations,
    );
  }
}

@Riverpod(keepAlive: true)
class DmViewModel extends _$DmViewModel {
  StreamSubscription<List<DmConversation>>? _dmSub;
  StreamSubscription<List<Friend>>? _friendSub;

  @override
  DmViewState build() {
    final dmRepo = ref.watch(dmRepositoryProvider);
    final friendRepo = ref.watch(friendRepositoryProvider);

    unawaited(_dmSub?.cancel());
    _dmSub = dmRepo.watchDmChannels().listen(
      (convos) {
        state = state.copyWith(
          conversations: convos,
          hasReceivedInitialConversations: true,
        );
      },
      onError: (Object error) {
        talker.error('[DmViewModel] DM watch error: $error');
      },
    );

    unawaited(_friendSub?.cancel());
    _friendSub = friendRepo.watchRelationships().listen(
      (friends) {
        state = state.copyWith(friendsList: friends);
      },
      onError: (Object error) {
        talker.error('[DmViewModel] Friends watch error: $error');
      },
    );

    ref
      ..listen<int>(readStateOverlayVersionProvider, (_, _) {
        _applyAckOverlay();
      })
      ..onDispose(() {
        unawaited(_dmSub?.cancel());
        unawaited(_friendSub?.cancel());
      });

    return const DmViewState(
      conversations: [],
      friendsList: [],
      activeTab: FriendsTab.online,
      searchQuery: '',
    );
  }

  void _applyAckOverlay() {
    if (!state.hasReceivedInitialConversations || state.conversations.isEmpty) {
      return;
    }
    final batcher = ref.read(readStateWriteBatcherProvider);
    var changed = false;
    final List<DmConversation> next = <DmConversation>[];
    for (final DmConversation convo in state.conversations) {
      if (!batcher.hasOverlay(convo.id)) {
        next.add(convo);
        continue;
      }
      final effective = batcher.effectiveFields(
        convo.id,
        batcher.persistedReadState(convo.id),
      );
      final int count = dmUnreadCountFromReadState(
        latestMessageId: convo.lastMessageId,
        ackLastMessageId: effective.lastMessageId,
        fallbackAckMs: snowflakeTimestampMs(convo.id),
        mentionCount: effective.mentionCount,
        cachedUnreadCount: effective.lastMessageId == null
            ? convo.unreadCount
            : 0,
      );
      if (count == convo.unreadCount) {
        next.add(convo);
        continue;
      }
      changed = true;
      next.add(convo.withUnreadCount(count));
    }
    if (!changed) {
      return;
    }
    state = state.copyWith(conversations: next);
  }

  void selectTab(FriendsTab tab) {
    state = state.copyWith(activeTab: tab);
  }

  void updateSearch(String query) {
    state = state.copyWith(searchQuery: query);
  }

  Future<void> markAsRead(String channelId) =>
      ref.read(dmRepositoryProvider).markAsRead(channelId);

  Future<void> closeDmChannel(String channelId, {required bool isGroup}) async {
    try {
      await ref.read(dmRepositoryProvider).closeDmChannel(channelId);
    } on Object catch (e) {
      talker.error('[DmViewModel] Failed to close DM: $e');
      await showApiErrorFromRoot(
        isGroup ? ApiErrorAction.leaveGroupDm : ApiErrorAction.closeDm,
        e,
      );
    }
  }
}
