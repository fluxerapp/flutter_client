import 'dart:async';

import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_candidate_builder.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_channel_resolver.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_default_input.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_result_converters.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_result_generators.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_build_input.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_candidate.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_types.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_unread_channel.dart';
import 'package:fluxer_app/features/quick_switcher/providers/quick_switcher_providers.dart';
import 'package:fluxer_app/features/quick_switcher/providers/recent_channel_visits_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quick_switcher_provider.g.dart';

enum QuickSwitcherSheetTab { search, friends }

class QuickSwitcherState {
  const QuickSwitcherState({
    this.isOpen = false,
    this.query = '',
    this.queryMode,
    this.results = const <QuickSwitcherResult>[],
    this.selectedIndex = -1,
    this.isLoadingMembers = false,
    this.candidateSets,
    this.activeTab = QuickSwitcherSheetTab.search,
    this.friendsSearchQuery = '',
    this.l10n,
    this.unreadByChannelId = const <String, QuickSwitcherUnreadChannel>{},
  });

  final bool isOpen;
  final String query;
  final QuickSwitcherQueryMode? queryMode;
  final List<QuickSwitcherResult> results;
  final int selectedIndex;
  final bool isLoadingMembers;
  final QuickSwitcherCandidateSets? candidateSets;
  final QuickSwitcherSheetTab activeTab;
  final String friendsSearchQuery;
  final FluxerLocalizations? l10n;
  final Map<String, QuickSwitcherUnreadChannel> unreadByChannelId;

  int get executableResultCount =>
      results.where(isQuickSwitcherExecutable).length;

  QuickSwitcherState copyWith({
    bool? isOpen,
    String? query,
    QuickSwitcherQueryMode? queryMode,
    bool clearQueryMode = false,
    List<QuickSwitcherResult>? results,
    int? selectedIndex,
    bool? isLoadingMembers,
    QuickSwitcherCandidateSets? candidateSets,
    bool clearCandidateSets = false,
    QuickSwitcherSheetTab? activeTab,
    String? friendsSearchQuery,
    FluxerLocalizations? l10n,
    Map<String, QuickSwitcherUnreadChannel>? unreadByChannelId,
  }) {
    return QuickSwitcherState(
      isOpen: isOpen ?? this.isOpen,
      query: query ?? this.query,
      queryMode: clearQueryMode ? null : (queryMode ?? this.queryMode),
      results: results ?? this.results,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoadingMembers: isLoadingMembers ?? this.isLoadingMembers,
      candidateSets: clearCandidateSets
          ? null
          : (candidateSets ?? this.candidateSets),
      activeTab: activeTab ?? this.activeTab,
      friendsSearchQuery: friendsSearchQuery ?? this.friendsSearchQuery,
      l10n: l10n ?? this.l10n,
      unreadByChannelId: unreadByChannelId ?? this.unreadByChannelId,
    );
  }
}

@Riverpod(keepAlive: true)
class QuickSwitcher extends _$QuickSwitcher {
  Timer? _memberSearchDebounce;
  List<Member> _memberSearchResults = const <Member>[];
  List<QuickSwitcherUnreadChannel> _unreadChannels =
      const <QuickSwitcherUnreadChannel>[];
  List<Channel> _guildChannels = const <Channel>[];
  List<DmConversation> _conversations = const <DmConversation>[];
  String? _excludedParentChannelId;

  @override
  QuickSwitcherState build() {
    ref.onDispose(() {
      _memberSearchDebounce?.cancel();
    });
    return const QuickSwitcherState();
  }

  void open(FluxerLocalizations l10n) {
    _memberSearchResults = const <Member>[];
    _unreadChannels = const <QuickSwitcherUnreadChannel>[];
    _guildChannels = const <Channel>[];
    _conversations = const <DmConversation>[];
    _excludedParentChannelId = null;
    state = QuickSwitcherState(isOpen: true, l10n: l10n);
    unawaited(_warmCandidatesAndRecompute());
  }

  void close() {
    _memberSearchDebounce?.cancel();
    _memberSearchResults = const <Member>[];
    _unreadChannels = const <QuickSwitcherUnreadChannel>[];
    _guildChannels = const <Channel>[];
    _conversations = const <DmConversation>[];
    _excludedParentChannelId = null;
    state = const QuickSwitcherState();
  }

  void setActiveTab(QuickSwitcherSheetTab tab) {
    state = state.copyWith(activeTab: tab);
  }

  void setFriendsSearchQuery(String value) {
    state = state.copyWith(friendsSearchQuery: value);
  }

  void setQuery(String query) {
    final QuickSwitcherQueryMode? queryMode = parseQuickSwitcherQueryMode(query);
    state = state.copyWith(
      query: query,
      queryMode: queryMode,
      clearQueryMode: queryMode == null,
    );
    _triggerMemberSearchIfNeeded(query, queryMode);
    _recomputeResults();
  }

  void selectIndex(int index) {
    if (index < 0) {
      state = state.copyWith(selectedIndex: -1);
      return;
    }
    if (index >= state.results.length) {
      return;
    }
    if (!isQuickSwitcherExecutable(state.results[index])) {
      state = state.copyWith(selectedIndex: -1);
      return;
    }
    state = state.copyWith(selectedIndex: index);
  }

  void selectNext({required bool down}) {
    final int nextIndex = findNextSelectableQuickSwitcherIndex(
      results: state.results,
      startIndex: state.selectedIndex,
      down: down,
    );
    selectIndex(nextIndex);
  }

  Future<void> _warmCandidatesAndRecompute() async {
    final QuickSwitcherCandidateSets sets = await _loadCandidateSets();
    if (!state.isOpen) {
      return;
    }
    final dmState = ref.read(dmViewModelProvider);
    final List<QuickSwitcherUnreadChannel> unreadChannels = await ref
        .read(quickSwitcherRepositoryProvider)
        .getUnreadChannels(
          currentUserId: ref.read(currentUserIdProvider),
          conversations: dmState.conversations,
        );
    if (!state.isOpen) {
      return;
    }
    _unreadChannels = unreadChannels;
    _conversations = dmState.conversations;
    _guildChannels = await ref.read(quickSwitcherRepositoryProvider).getGuildChannels();
    final Map<String, QuickSwitcherUnreadChannel> unreadByChannelId =
        <String, QuickSwitcherUnreadChannel>{
          for (final QuickSwitcherUnreadChannel entry in unreadChannels)
            entry.channelId: entry,
        };
    final String? currentChannelId = ref.read(activeChannelIdProvider);
    if (currentChannelId != null && currentChannelId.isNotEmpty) {
      _excludedParentChannelId = await ref
          .read(quickSwitcherRepositoryProvider)
          .getChannelParentId(currentChannelId);
    } else {
      _excludedParentChannelId = null;
    }
    state = state.copyWith(
      candidateSets: sets,
      unreadByChannelId: unreadByChannelId,
    );
    _recomputeResults();
  }

  Future<QuickSwitcherCandidateSets> _loadCandidateSets() async {
    final dmState = ref.read(dmViewModelProvider);
    final guilds = ref.read(guildListViewModelProvider).guilds;
    final List<Channel> channels = await ref
        .read(quickSwitcherRepositoryProvider)
        .getGuildChannels();
    final favorites = ref.read(favoriteChannelsProvider).value ?? const [];
    final String? selectedGuildId = ref.read(activeGuildIdProvider);
    List<Member> guildMembers = const <Member>[];
    if (selectedGuildId != null && selectedGuildId.isNotEmpty) {
      guildMembers = await ref
          .read(memberRepositoryProvider)
          .getMembers(selectedGuildId, limit: 200);
    }
    final FluxerLocalizations? l10n = state.l10n;
    if (l10n == null) {
      throw StateError('QuickSwitcher.open must be called with l10n first');
    }
    return buildQuickSwitcherCandidateSets(
      QuickSwitcherBuildInput(
        l10n: l10n,
        currentUserId: ref.read(currentUserIdProvider),
        conversations: dmState.conversations,
        friends: dmState.friendsList,
        guildChannels: channels,
        guilds: guilds,
        guildMembers: guildMembers,
        hasFavorites: favorites.isNotEmpty,
      ),
    );
  }

  void _recomputeResults() {
    final QuickSwitcherCandidateSets? sets = state.candidateSets;
    if (sets == null) {
      return;
    }
    final FluxerLocalizations? l10n = state.l10n;
    if (l10n == null) {
      return;
    }
    final String? currentChannelId = ref.read(activeChannelIdProvider);
    final Set<String> excludedChannelIds = _excludedChannelIds(currentChannelId);
    final List<QuickSwitcherResult> results;
    final String trimmed = state.query.trim();
    if (trimmed.isEmpty) {
      final List<Guild> guilds = ref.read(guildListViewModelProvider).guilds;
      results = generateQuickSwitcherDefaultResults(
        QuickSwitcherDefaultInput(
          resolver: QuickSwitcherChannelResolver(
            l10n: l10n,
            guildChannelsById: <String, Channel>{
              for (final Channel channel in _guildChannels) channel.id: channel,
            },
            conversationsById: <String, DmConversation>{
              for (final DmConversation convo in _conversations) convo.id: convo,
            },
            guildsById: <String, Guild>{
              for (final Guild guild in guilds) guild.id: guild,
            },
          ),
          recentVisits: ref.read(recentChannelVisitsProvider),
          unreadChannels: _loadUnreadChannels(),
          excludedChannelIds: excludedChannelIds,
        ),
      );
    } else if (state.queryMode != null) {
      final String rawSearch = state.query.substring(1).trim();
      results = generateQuickSwitcherQueryModeResults(
        queryMode: state.queryMode!,
        search: rawSearch,
        sets: sets,
        l10n: l10n,
        memberSearchResults: _memberSearchResults,
        currentUserId: ref.read(currentUserIdProvider),
        excludedChannelIds: excludedChannelIds,
      );
    } else {
      results = generateQuickSwitcherGeneralResults(
        search: trimmed,
        sets: sets,
        l10n: l10n,
      );
    }
    state = state.copyWith(
      results: results,
      // Empty query: no preselected row (web sheet has no selection chrome).
      selectedIndex: trimmed.isEmpty
          ? -1
          : getFirstSelectableQuickSwitcherIndex(results),
    );
  }

  List<QuickSwitcherUnreadChannel> _loadUnreadChannels() => _unreadChannels;

  Set<String> _excludedChannelIds(String? currentChannelId) {
    final Set<String> excluded = <String>{};
    if (currentChannelId == null || currentChannelId.isEmpty) {
      return excluded;
    }
    excluded.add(currentChannelId);
    final String? parentId = _excludedParentChannelId;
    if (parentId != null && parentId.isNotEmpty) {
      excluded.add(parentId);
    }
    return excluded;
  }

  void _triggerMemberSearchIfNeeded(
    String query,
    QuickSwitcherQueryMode? queryMode,
  ) {
    _memberSearchDebounce?.cancel();
    if (queryMode != QuickSwitcherQueryMode.user) {
      _memberSearchResults = const <Member>[];
      state = state.copyWith(isLoadingMembers: false);
      return;
    }
    final String rawSearch = query.length > 1 ? query.substring(1).trim() : '';
    if (rawSearch.isEmpty) {
      _memberSearchResults = const <Member>[];
      state = state.copyWith(isLoadingMembers: false);
      _recomputeResults();
      return;
    }
    state = state.copyWith(isLoadingMembers: true);
    _memberSearchDebounce = Timer(const Duration(milliseconds: 300), () {
      unawaited(_fetchMemberSearch(rawSearch));
    });
  }

  Future<void> _fetchMemberSearch(String rawSearch) async {
    final String? guildId = ref.read(activeGuildIdProvider);
    if (guildId == null || guildId.isEmpty) {
      _memberSearchResults = const <Member>[];
      if (state.isOpen) {
        state = state.copyWith(isLoadingMembers: false);
        _recomputeResults();
      }
      return;
    }
    final List<Member> results = await ref
        .read(memberRepositoryProvider)
        .searchMembersForAutocomplete(guildId: guildId, query: rawSearch);
    _memberSearchResults = results.take(kQuickSwitcherMemberSearchLimit).toList();
    if (state.isOpen) {
      state = state.copyWith(isLoadingMembers: false);
      _recomputeResults();
    }
  }
}
