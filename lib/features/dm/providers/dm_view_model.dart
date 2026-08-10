import 'dart:async';

import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
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

    ref.onDispose(() {
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

  void selectTab(FriendsTab tab) {
    state = state.copyWith(activeTab: tab);
  }

  void updateSearch(String query) {
    state = state.copyWith(searchQuery: query);
  }

  Future<void> markAsRead(String channelId) =>
      ref.read(dmRepositoryProvider).markAsRead(channelId);

  Future<bool> closeDmChannel(String channelId) async {
    try {
      await ref.read(dmRepositoryProvider).closeDmChannel(channelId);
      return true;
    } on Exception catch (e) {
      talker.error('[DmViewModel] Failed to close DM: $e');
      return false;
    }
  }
}
