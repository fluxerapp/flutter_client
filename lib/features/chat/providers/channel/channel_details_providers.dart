import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/data/channel_pins_repository.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_details_providers.g.dart';

@Riverpod(keepAlive: true)
ChannelPinsRepository channelPinsRepository(Ref ref) => ChannelPinsRepository(
  ref.watch(fluxerClientProvider),
  ref.watch(fluxerDatabaseProvider),
  ref.watch(currentUserIdProvider),
);

@Riverpod(keepAlive: true)
MessageSearchRepository messageSearchRepository(Ref ref) =>
    MessageSearchRepository(
      ref.watch(fluxerClientProvider),
      ref.watch(fluxerDatabaseProvider),
      ref.watch(currentUserIdProvider),
    );

class ChannelPinsState {
  const ChannelPinsState({
    required this.items,
    required this.hasMore,
    this.isLoadingMore = false,
    this.errorMessage,
  });

  final List<PinnedMessageEntry> items;
  final bool hasMore;
  final bool isLoadingMore;
  final String? errorMessage;

  ChannelPinsState copyWith({
    List<PinnedMessageEntry>? items,
    bool? hasMore,
    bool? isLoadingMore,
    Object? errorMessage = _unset,
  }) {
    return ChannelPinsState(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      errorMessage: errorMessage == _unset
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}

@riverpod
class ChannelPins extends _$ChannelPins {
  StreamSubscription<MessageRealtimeEvent>? _realtimeSub;

  @override
  Future<ChannelPinsState> build(String channelId) async {
    final bus = ref.watch(messageRealtimeBusProvider);
    unawaited(_realtimeSub?.cancel());
    _realtimeSub = bus.stream.listen(_onRealtimeEvent);
    ref.onDispose(() => unawaited(_realtimeSub?.cancel()));
    final page = await ref
        .read(channelPinsRepositoryProvider)
        .listPinnedMessages(channelId: channelId);
    return ChannelPinsState(items: page.items, hasMore: page.hasMore);
  }

  void _onRealtimeEvent(MessageRealtimeEvent event) {
    final current = state.asData?.value;
    if (current == null) {
      return;
    }
    switch (event) {
      case MessageUpdated(:final event):
        if (event.message.channelId != channelId) {
          return;
        }
        final String messageId = event.message.id;
        final int idx = current.items.indexWhere(
          (entry) => entry.message.id == messageId,
        );
        if (idx == -1) {
          return;
        }
        final Message merged = current.items[idx].message.applyGatewayUpdate(
          event.message,
          currentUserId: ref.read(currentUserIdProvider),
        );
        final List<PinnedMessageEntry> items = List<PinnedMessageEntry>.from(
          current.items,
        );
        items[idx] = PinnedMessageEntry(
          message: merged,
          pinnedAt: current.items[idx].pinnedAt,
        );
        state = AsyncData(current.copyWith(items: items));
      case MessageDeleted(:final event):
        if (event.channelId != channelId) {
          return;
        }
        _removePinnedMessages(current, {event.messageId});
      case MessagesDeletedBulk(:final event):
        if (event.channelId != channelId) {
          return;
        }
        _removePinnedMessages(current, event.ids.toSet());
      case MessageCreated():
      case MessageReactionsChanged():
        return;
    }
  }

  void _removePinnedMessages(ChannelPinsState current, Set<String> messageIds) {
    if (messageIds.isEmpty) {
      return;
    }
    final List<PinnedMessageEntry> items = current.items
        .where((entry) => !messageIds.contains(entry.message.id))
        .toList();
    if (items.length == current.items.length) {
      return;
    }
    state = AsyncData(current.copyWith(items: items));
  }

  Future<void> loadMore() async {
    final current = state.asData?.value;
    if (current == null ||
        current.isLoadingMore ||
        !current.hasMore ||
        current.items.isEmpty) {
      return;
    }

    state = AsyncData(current.copyWith(isLoadingMore: true));
    try {
      final page = await ref
          .read(channelPinsRepositoryProvider)
          .listPinnedMessages(
            channelId: channelId,
            before: current.items.last.pinnedAt,
          );
      state = AsyncData(
        current.copyWith(
          items: [...current.items, ...page.items],
          hasMore: page.hasMore,
          isLoadingMore: false,
          errorMessage: null,
        ),
      );
    } on Exception {
      state = AsyncData(
        current.copyWith(
          isLoadingMore: false,
          errorMessage: 'Failed to load pinned messages',
        ),
      );
    }
  }

  Future<void> unpin(PinnedMessageEntry entry) async {
    final current = state.asData?.value;
    if (current == null) {
      return;
    }

    await ref
        .read(channelPinsRepositoryProvider)
        .unpinMessage(channelId: channelId, messageId: entry.message.id);

    state = AsyncData(
      current.copyWith(
        items: [
          for (final item in current.items)
            if (item.message.id != entry.message.id) item,
        ],
      ),
    );
  }
}

class ChannelSearchState {
  const ChannelSearchState({
    required this.query,
    this.results = const <MessageSearchResultEntry>[],
    this.total = 0,
    this.hasMore = false,
    this.isSearching = false,
    this.isLoadingMore = false,
    this.indexing = false,
    this.hasSearched = false,
    this.errorMessage,
  });

  final MessageSearchQuery query;
  final List<MessageSearchResultEntry> results;
  final int total;
  final bool hasMore;
  final bool isSearching;
  final bool isLoadingMore;
  final bool indexing;
  final bool hasSearched;
  final String? errorMessage;

  ChannelSearchState copyWith({
    MessageSearchQuery? query,
    List<MessageSearchResultEntry>? results,
    int? total,
    bool? hasMore,
    bool? isSearching,
    bool? isLoadingMore,
    bool? indexing,
    bool? hasSearched,
    Object? errorMessage = _unset,
  }) {
    return ChannelSearchState(
      query: query ?? this.query,
      results: results ?? this.results,
      total: total ?? this.total,
      hasMore: hasMore ?? this.hasMore,
      isSearching: isSearching ?? this.isSearching,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      indexing: indexing ?? this.indexing,
      hasSearched: hasSearched ?? this.hasSearched,
      errorMessage: errorMessage == _unset
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}

@riverpod
class ChannelSearch extends _$ChannelSearch {
  @override
  ChannelSearchState build(String channelId, String? guildId) {
    return ChannelSearchState(
      query: MessageSearchQuery(channelId: channelId, guildId: guildId),
    );
  }

  Future<void> search({
    String? text,
    String? authorId,
    MessageSearchScopeFilter? scope,
    MessageSearchSortFilter? sort,
    Set<MessageSearchContentFilter>? contentTypes,
  }) async {
    final nextQuery = state.query.copyWith(
      text: text,
      authorId: authorId,
      scope: scope,
      sort: sort,
      contentTypes: contentTypes,
      page: 1,
    );
    if (!nextQuery.hasSearchTerms) {
      state = ChannelSearchState(query: nextQuery);
      return;
    }

    state = state.copyWith(
      query: nextQuery,
      isSearching: true,
      isLoadingMore: false,
      hasSearched: true,
      indexing: false,
      errorMessage: null,
    );
    try {
      final page = await ref
          .read(messageSearchRepositoryProvider)
          .searchMessages(nextQuery);
      state = state.copyWith(
        query: nextQuery,
        results: page.results,
        total: page.total,
        hasMore: page.hasMore,
        isSearching: false,
        indexing: page.indexing,
        errorMessage: null,
      );
    } on Exception {
      state = state.copyWith(isSearching: false, errorMessage: 'Search failed');
    }
  }

  Future<void> loadMore() async {
    if (state.isSearching ||
        state.isLoadingMore ||
        !state.hasMore ||
        state.results.isEmpty) {
      return;
    }
    final currentQuery = state.query;
    final nextQuery = currentQuery.copyWith(page: currentQuery.page + 1);
    state = state.copyWith(isLoadingMore: true);
    try {
      final page = await ref
          .read(messageSearchRepositoryProvider)
          .searchMessages(nextQuery);
      state = state.copyWith(
        query: nextQuery,
        results: [...state.results, ...page.results],
        total: page.total,
        hasMore: page.hasMore,
        isLoadingMore: false,
        indexing: page.indexing,
        errorMessage: null,
      );
    } on Exception {
      state = state.copyWith(
        isLoadingMore: false,
        errorMessage: 'Failed to load more results',
      );
    }
  }
}

const Object _unset = Object();
