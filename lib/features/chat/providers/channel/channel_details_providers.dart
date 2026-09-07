import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/data/channel_pins_repository.dart';
import 'package:fluxer_app/features/chat/data/channel_search_query_parser.dart';
import 'package:fluxer_app/features/chat/data/message_search_mature_content.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_chip_filters.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/mature_content/utils/content_warning_utils.dart';
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
    MessageSearchQuery? query,
    String? rawQuery,
    String? text,
    ChannelSearchParseHints? hints,
    ChannelSearchParseContext? context,
    MessageSearchScopeFilter? scope,
    MessageSearchSortFilter? sort,
    String? authorId,
    Set<MessageSearchContentFilter>? contentTypes,
    ChannelSearchChipFilters chipFilters = const ChannelSearchChipFilters(),
  }) async {
    final MessageSearchQuery nextQuery =
        query ??
        MessageSearchQuery.build(
          channelId: channelId,
          guildId: guildId,
          rawQuery: rawQuery ?? text ?? state.query.rawQuery,
          uiScope: scope ?? state.query.uiScope,
          uiSort: sort ?? state.query.uiSort,
          hints: hints ?? const ChannelSearchParseHints(),
          context: context ?? ChannelSearchParseContext(guildId: guildId),
          chipAuthorId: authorId,
          chipContentTypes: contentTypes,
          chipFilters: chipFilters,
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
      final ({MessageSearchQuery query, MessageSearchPage page})? result =
          await _executeSearch(nextQuery);
      if (!ref.mounted || result == null) {
        return;
      }
      _setSearchPage(result.query, result.page);
    } on Exception {
      if (!ref.mounted) {
        return;
      }
      state = state.copyWith(isSearching: false, errorMessage: 'Search failed');
    }
  }

  Future<void> goToPage(int page) async {
    final MessageSearchQuery currentQuery = state.query;
    if (!currentQuery.hasSearchTerms || page < 1 || page == currentQuery.page) {
      return;
    }
    final MessageSearchQuery nextQuery = currentQuery.copyWith(page: page);
    state = state.copyWith(
      query: nextQuery,
      isSearching: true,
      isLoadingMore: false,
      errorMessage: null,
    );
    try {
      final ({MessageSearchQuery query, MessageSearchPage page})? result =
          await _executeSearch(nextQuery);
      if (!ref.mounted || result == null) {
        return;
      }
      _setSearchPage(result.query, result.page);
    } on Exception {
      if (!ref.mounted) {
        return;
      }
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
    final MessageSearchQuery currentQuery = state.query;
    final MessageSearchQuery nextQuery = currentQuery.copyWith(
      page: currentQuery.page + 1,
    );
    state = state.copyWith(isLoadingMore: true);
    try {
      final ({MessageSearchQuery query, MessageSearchPage page})? result =
          await _executeSearch(nextQuery);
      if (!ref.mounted || result == null) {
        return;
      }
      _setSearchPage(
        result.query,
        result.page,
        results: [...state.results, ...result.page.results],
      );
    } on Exception {
      if (!ref.mounted) {
        return;
      }
      state = state.copyWith(
        isLoadingMore: false,
        errorMessage: 'Failed to load more results',
      );
    }
  }

  void _setSearchPage(
    MessageSearchQuery query,
    MessageSearchPage page, {
    List<MessageSearchResultEntry>? results,
  }) {
    state = state.copyWith(
      query: query,
      results: results ?? page.results,
      total: page.total,
      hasMore: page.hasMore,
      isSearching: false,
      isLoadingMore: false,
      indexing: page.indexing,
      errorMessage: null,
    );
  }

  Future<({MessageSearchQuery query, MessageSearchPage page})?> _executeSearch(
    MessageSearchQuery query,
  ) async {
    final bool shouldShowGate = await ref.read(
      shouldShowMatureContentGateProvider(channelId).future,
    );
    if (!ref.mounted) {
      return null;
    }
    if (shouldShowGate) {
      return (
        query: query,
        page: MessageSearchPage(
          results: const <MessageSearchResultEntry>[],
          total: 0,
          page: query.page,
          hitsPerPage: kMessageSearchPageSize,
          indexing: false,
        ),
      );
    }

    final bool includeNsfw = await _shouldIncludeNsfw(query);
    if (!ref.mounted) {
      return null;
    }
    final MessageSearchQuery prepared = applyMatureContentToSearchQuery(
      query,
      includeNsfw: includeNsfw,
    );
    final MessageSearchPage page = await ref
        .read(messageSearchRepositoryProvider)
        .searchMessages(prepared);
    if (!ref.mounted) {
      return null;
    }
    return (query: prepared, page: page);
  }

  Future<bool> _shouldIncludeNsfw(MessageSearchQuery query) async {
    final Set<String> channelIds = <String>{
      channelId,
      ...query.parsed.channelIds,
    };
    for (final String targetChannelId in channelIds) {
      if (await _isConsentedGatedChannel(targetChannelId)) {
        return true;
      }
      if (!ref.mounted) {
        return false;
      }
    }
    return false;
  }

  Future<bool> _isConsentedGatedChannel(String targetChannelId) async {
    final ResolvedMatureGateContext? context = await ref.read(
      matureGateContextProvider(targetChannelId).future,
    );
    if (!ref.mounted || context == null || !isGatedMatureContent(context)) {
      return false;
    }
    final bool showingGate = await ref.read(
      shouldShowMatureContentGateProvider(targetChannelId).future,
    );
    if (!ref.mounted) {
      return false;
    }
    return !showingGate;
  }
}

const Object _unset = Object();
