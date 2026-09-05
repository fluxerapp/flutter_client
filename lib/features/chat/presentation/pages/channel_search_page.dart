part of '../sheets/channel_details_sheet.dart';

Route<T> _channelSearchPageRoute<T>(Widget page) {
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
    return CupertinoPageRoute<T>(builder: (_) => page);
  }
  return MaterialPageRoute<T>(builder: (_) => page);
}

Future<ChannelDetailsJumpRequest?> showChannelSearchPage(
  BuildContext context, {
  required String channelId,
  required String? guildId,
}) {
  final ProviderContainer container = ProviderScope.containerOf(context);
  container.read(obscuringOverlayTrackerProvider.notifier).push();
  return Navigator.of(context)
      .push<ChannelDetailsJumpRequest>(
        _channelSearchPageRoute(
          ChannelSearchPage(channelId: channelId, guildId: guildId),
        ),
      )
      .whenComplete(() {
        container.read(obscuringOverlayTrackerProvider.notifier).pop();
      });
}

/// Opens search as a full page and performs any jump it returns
Future<void> showChannelSearchPageAndJump(
  BuildContext context, {
  required ProviderContainer container,
  required String channelId,
  required String? guildId,
}) async {
  final ChannelDetailsJumpRequest? request = await showChannelSearchPage(
    context,
    channelId: channelId,
    guildId: guildId,
  );
  if (request == null) {
    return;
  }
  await _jumpFromChannelDetailsRequest(container: container, request: request);
}

class ChannelSearchPage extends ConsumerStatefulWidget {
  const ChannelSearchPage({
    required this.channelId,
    required this.guildId,
    super.key,
  });

  final String channelId;
  final String? guildId;

  @override
  ConsumerState<ChannelSearchPage> createState() => _ChannelSearchPageState();
}

class _ChannelSearchPageState extends ConsumerState<ChannelSearchPage> {
  late final TextEditingController _textController;
  late final FocusNode _focusNode;
  late final ScrollController _scrollController;
  ChannelSearchMobileChipState _chipState =
      const ChannelSearchMobileChipState();

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _focusNode = FocusNode();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _textController.addListener(_onTextChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _textController
      ..removeListener(_onTextChanged)
      ..dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    if (position.pixels >=
        position.maxScrollExtent - _kSheetLoadMoreThreshold) {
      unawaited(
        ref
            .read(
              channelSearchProvider(widget.channelId, widget.guildId).notifier,
            )
            .loadMore(),
      );
    }
  }

  String get _authorIdsValue => _chipState.authorIds.join(',');

  String? _authorChipValue(FluxerLocalizations l10n) {
    if (_chipState.authorIds.isEmpty) {
      return null;
    }
    return channelSearchMobileChipSummary(
      count: _chipState.authorIds.length,
      singleLabel:
          _chipState.authorNames[_chipState.authorIds.first] ??
          _chipState.authorIds.first,
      multipleLabel: l10n.channelDetailsSearchUsersCount(
        _chipState.authorIds.length,
      ),
    );
  }

  String? _mentionChipValue(FluxerLocalizations l10n) {
    if (_chipState.mentionIds.isEmpty) {
      return null;
    }
    return channelSearchMobileChipSummary(
      count: _chipState.mentionIds.length,
      singleLabel: _chipState.mentionNames.values.first,
      multipleLabel: l10n.channelDetailsSearchUsersCount(
        _chipState.mentionIds.length,
      ),
    );
  }

  String? _channelChipValue(FluxerLocalizations l10n) {
    if (_chipState.channelIds.isEmpty) {
      return null;
    }
    if (_chipState.channelIds.length == 1) {
      return _chipState.channelNames.values.first;
    }
    return l10n.channelDetailsSearchChannelsCount(_chipState.channelIds.length);
  }

  String? _moreChipValue(FluxerLocalizations l10n) {
    if (!_chipState.hasMoreFilters) {
      return null;
    }
    return l10n.channelDetailsSearchMoreFiltersActive;
  }

  void _setAuthorSelection(List<_PickerUser> selectedUsers) {
    setState(() {
      _chipState = _chipState.copyWith(
        authorIds: selectedUsers.map((_PickerUser u) => u.id).toSet(),
        authorNames: <String, String>{
          for (final _PickerUser user in selectedUsers)
            user.id: user.displayName,
        },
        usersByTag: <String, String>{
          for (final _PickerUser user in selectedUsers) user.username: user.id,
        },
      );
    });
    _runSearch();
  }

  void _clearAuthorSelection() {
    setState(() {
      _chipState = _chipState.copyWith(
        authorIds: const <String>{},
        authorNames: const <String, String>{},
        usersByTag: const <String, String>{},
      );
    });
    _runSearch();
  }

  void _setChannelSelection(List<Channel> channels) {
    setState(() {
      _chipState = _chipState.copyWith(
        channelIds: channels.map((Channel c) => c.id).toSet(),
        channelNames: <String, String>{
          for (final Channel channel in channels) channel.id: channel.name,
        },
      );
    });
    _runSearch();
  }

  void _clearChannelSelection() {
    setState(() {
      _chipState = _chipState.copyWith(
        channelIds: const <String>{},
        channelNames: const <String, String>{},
      );
    });
    _runSearch();
  }

  void _setMentionSelection(List<_PickerUser> selectedUsers) {
    setState(() {
      _chipState = _chipState.copyWith(
        mentionIds: selectedUsers.map((_PickerUser u) => u.id).toSet(),
        mentionNames: <String, String>{
          for (final _PickerUser user in selectedUsers)
            user.id: user.displayName,
        },
      );
    });
    _runSearch();
  }

  void _applyMoreFilters(ChannelSearchMoreFiltersResult result) {
    setState(() {
      _chipState = _chipState.copyWith(
        pinned: result.pinned,
        authorTypes: result.authorTypes,
        linkHostname: result.linkHostname,
        fileName: result.fileName,
        fileExtension: result.fileExtension,
        dateFilterKey: result.dateFilterKey,
        dateValue: result.dateValue,
      );
    });
    _runSearch();
  }

  void _clearMoreFilters() {
    setState(() {
      _chipState = _chipState.copyWith(
        pinned: null,
        authorTypes: const <String>{},
        linkHostname: null,
        fileName: null,
        fileExtension: null,
        dateFilterKey: null,
        dateValue: null,
      );
    });
    _runSearch();
  }

  String? _resolveChannelName(String channelName) {
    final String? guildId = widget.guildId;
    if (guildId == null) {
      return null;
    }
    return resolveChannelIdByName(
      ref.read(channelListViewModelProvider).categories,
      channelName,
    );
  }

  MessageSearchQuery _buildSearchQuery({
    MessageSearchScopeFilter? scope,
    MessageSearchSortFilter? sort,
    Set<MessageSearchContentFilter>? contentTypes,
  }) {
    final ChannelSearchState state = ref.read(
      channelSearchProvider(widget.channelId, widget.guildId),
    );
    return MessageSearchQuery.build(
      channelId: widget.channelId,
      guildId: widget.guildId,
      rawQuery: _textController.text,
      uiScope: scope ?? state.query.uiScope,
      uiSort: sort ?? state.query.uiSort,
      hints: ChannelSearchParseHints(
        usersByTag: _chipState.usersByTag,
        channelsByName: _chipState.channelNames,
      ),
      context: ChannelSearchParseContext(
        guildId: widget.guildId,
        currentUserId: ref.read(currentUserIdProvider),
        resolveChannelByName: _resolveChannelName,
      ),
      chipAuthorId: _authorIdsValue.isEmpty ? null : _authorIdsValue,
      chipContentTypes: contentTypes ?? state.query.contentTypes,
      chipFilters: _chipState.toChipFilters(),
    );
  }

  void _runSearch() {
    final MessageSearchQuery query = _buildSearchQuery();
    if (!query.hasSearchTerms) {
      return;
    }
    unawaited(
      ref
          .read(
            channelSearchProvider(widget.channelId, widget.guildId).notifier,
          )
          .search(query: query),
    );
    unawaited(_saveSearchHistory(query));
  }

  Future<void> _saveSearchHistory(MessageSearchQuery query) async {
    final AsyncValue<ChannelSearchHistoryRepository> repoAsync = ref.read(
      channelSearchHistoryRepositoryProvider,
    );
    final ChannelSearchHistoryRepository? repo = repoAsync.value;
    if (repo == null) {
      return;
    }
    await repo.addEntry(
      _chipState.toHistoryEntry(
        contextKey: channelSearchContextKey(
          channelId: widget.channelId,
          guildId: widget.guildId,
        ),
        displayText: _textController.text,
        scopeIndex: query.uiScope.index,
        sortIndex: query.uiSort.index,
        contentTypeIndices: query.contentTypes
            .map((MessageSearchContentFilter f) => f.index)
            .toList(),
      ),
    );
  }

  void _clearAll() {
    _textController.clear();
    setState(() {
      _chipState = const ChannelSearchMobileChipState();
    });
    _updateFilters(
      scope: MessageSearchScopeFilter.current,
      sort: MessageSearchSortFilter.newest,
      contentTypes: const <MessageSearchContentFilter>{},
    );
  }

  bool get _hasActiveFilters {
    final ChannelSearchState state = ref.read(
      channelSearchProvider(widget.channelId, widget.guildId),
    );
    return _chipState.hasChipFilters || state.query.contentTypes.isNotEmpty;
  }

  bool _canSearch(ChannelSearchState state) {
    return channelSearchMobileCanSearch(
      rawQuery: _textController.text,
      hasChipFilters: _chipState.hasChipFilters,
      contentTypes: state.query.contentTypes,
    );
  }

  void _clearMentionSelection() {
    setState(() {
      _chipState = _chipState.copyWith(
        mentionIds: const <String>{},
        mentionNames: const <String, String>{},
      );
    });
    _runSearch();
  }

  void _restoreHistoryEntry(ChannelSearchHistoryEntry entry) {
    setState(() {
      _textController.text = entry.displayText;
      _chipState = ChannelSearchMobileChipState.fromHistoryEntry(entry);
    });
    unawaited(
      ref
          .read(
            channelSearchProvider(widget.channelId, widget.guildId).notifier,
          )
          .search(
            query: MessageSearchQuery.build(
              channelId: widget.channelId,
              guildId: widget.guildId,
              rawQuery: entry.displayText,
              uiScope: MessageSearchScopeFilter.values[entry.scopeIndex],
              uiSort: MessageSearchSortFilter.values[entry.sortIndex],
              hints: ChannelSearchParseHints(
                usersByTag: entry.usersByTag,
                channelsByName: entry.channelsByName,
              ),
              context: ChannelSearchParseContext(guildId: widget.guildId),
              chipAuthorId: entry.authorId.isEmpty ? null : entry.authorId,
              chipContentTypes: entry.contentTypeIndices
                  .map((int index) => MessageSearchContentFilter.values[index])
                  .toSet(),
              chipFilters: ChannelSearchMobileChipState.fromHistoryEntry(
                entry,
              ).toChipFilters(),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final ChannelSearchState state = ref.watch(
      channelSearchProvider(widget.channelId, widget.guildId),
    );
    final bool scopeIsCustom =
        state.query.uiScope != MessageSearchScopeFilter.current;
    final bool showResultCount =
        state.hasSearched && !state.isSearching && state.total > 0;
    final bool showClear =
        _textController.text.isNotEmpty ||
        _hasActiveFilters ||
        scopeIsCustom ||
        state.query.uiSort != MessageSearchSortFilter.newest;
    final AsyncValue<ChannelSearchHistoryRepository> historyRepo = ref.watch(
      channelSearchHistoryRepositoryProvider,
    );
    final List<ChannelSearchHistoryEntry> recentHistory =
        historyRepo.value?.readForContext(
          channelSearchContextKey(
            channelId: widget.channelId,
            guildId: widget.guildId,
          ),
        ) ??
        const <ChannelSearchHistoryEntry>[];
    final List<Widget> filterChips = _filterChips(l10n, state);
    final Color background = context.colors.backgroundSecondary;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const PhosphorIcon(PhosphorIconsBold.arrowLeft),
          tooltip: l10n.back,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(l10n.channelDetailsSearchTitle),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(layout.s4, layout.s3, layout.s4, 0),
            child: FluxerInput(
              controller: _textController,
              focusNode: _focusNode,
              hint: l10n.channelDetailsSearchHint,
              prefixIcon: const PhosphorIcon(PhosphorIconsBold.magnifyingGlass),
              suffixIcon: showClear
                  ? const PhosphorIcon(PhosphorIconsBold.x)
                  : null,
              onSuffixTap: showClear ? _clearAll : null,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _runSearch(),
            ),
          ),
          SizedBox(height: layout.s3),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: layout.s4),
            child: Row(
              children: <Widget>[
                for (final (int index, Widget chip)
                    in filterChips.indexed) ...<Widget>[
                  if (index > 0) SizedBox(width: layout.s2),
                  chip,
                ],
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              layout.s4,
              layout.s3,
              layout.s4,
              layout.s3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FluxerButton.primary(
                  label: l10n.channelDetailsActionSearch,
                  onPressed: _canSearch(state) ? _runSearch : null,
                ),
                if (!state.hasSearched && recentHistory.isNotEmpty)
                  _RecentSearchHistory(
                    entries: recentHistory,
                    onSelect: _restoreHistoryEntry,
                  ),
                if (showResultCount) ...<Widget>[
                  SizedBox(height: layout.s2),
                  Text(
                    l10n.channelDetailsSearchResultCount(state.total),
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Expanded(child: _buildResults(context, state)),
        ],
      ),
    );
  }

  List<Widget> _filterChips(
    FluxerLocalizations l10n,
    ChannelSearchState state,
  ) {
    final bool hasAuthorFilter = _chipState.authorIds.isNotEmpty;
    final bool hasChannelFilter = _chipState.channelIds.isNotEmpty;
    final bool hasContentFilter = state.query.contentTypes.isNotEmpty;
    final bool hasMentions = _chipState.mentionIds.isNotEmpty;
    return <Widget>[
      _SearchFilterChip(
        label: l10n.channelDetailsSearchFilterFrom,
        value: _authorChipValue(l10n),
        icon: PhosphorIconsFill.user,
        isActive: hasAuthorFilter,
        onTap: _openFromSheet,
        onRemove: hasAuthorFilter ? _clearAuthorSelection : null,
      ),
      if (widget.guildId != null)
        _SearchFilterChip(
          label: l10n.channelDetailsSearchFilterIn,
          value: _channelChipValue(l10n),
          icon: PhosphorIconsBold.hash,
          isActive: hasChannelFilter,
          onTap: _openInSheet,
          onRemove: hasChannelFilter ? _clearChannelSelection : null,
        ),
      _SearchFilterChip(
        label: l10n.channelDetailsSearchFilterMentions,
        value: _mentionChipValue(l10n),
        icon: PhosphorIconsBold.at,
        isActive: hasMentions,
        onTap: _openMentionsSheet,
        onRemove: hasMentions ? _clearMentionSelection : null,
      ),
      _SearchFilterChip(
        label: l10n.channelDetailsSearchFilterHas,
        value: _hasChipValue(l10n, state.query.contentTypes),
        icon: PhosphorIconsFill.funnel,
        isActive: hasContentFilter,
        onTap: _openHasSheet,
        onRemove: hasContentFilter
            ? () => _updateFilters(
                contentTypes: const <MessageSearchContentFilter>{},
              )
            : null,
      ),
      _SearchFilterChip(
        label: l10n.channelDetailsSearchFilterMore,
        value: _moreChipValue(l10n),
        icon: PhosphorIconsFill.slidersHorizontal,
        isActive: _chipState.hasMoreFilters,
        onTap: _openMoreFiltersSheet,
        onRemove: _chipState.hasMoreFilters ? _clearMoreFilters : null,
      ),
      _SearchFilterChip(
        label: l10n.channelDetailsSearchFilterSort,
        value: channelSearchSortLabel(l10n, state.query.sort),
        icon: channelSearchSortIcon(state.query.sort),
        onTap: _openSortSheet,
      ),
      _SearchFilterChip(
        label: channelSearchScopeLabel(
          l10n,
          state.query.uiScope,
          isGuildChannel: widget.guildId != null,
        ),
        icon: channelSearchScopeIcon(state.query.uiScope),
        isActive: state.query.uiScope != MessageSearchScopeFilter.current,
        onTap: _openScopeSheet,
      ),
    ];
  }

  void _updateFilters({
    MessageSearchScopeFilter? scope,
    MessageSearchSortFilter? sort,
    Set<MessageSearchContentFilter>? contentTypes,
  }) {
    final MessageSearchQuery query = _buildSearchQuery(
      scope: scope,
      sort: sort,
      contentTypes: contentTypes,
    );
    unawaited(
      ref
          .read(
            channelSearchProvider(widget.channelId, widget.guildId).notifier,
          )
          .search(query: query),
    );
    if (query.hasSearchTerms) {
      unawaited(_saveSearchHistory(query));
    }
  }

  String? _hasChipValue(
    FluxerLocalizations l10n,
    Set<MessageSearchContentFilter> contentTypes,
  ) {
    if (contentTypes.isEmpty) {
      return null;
    }
    if (contentTypes.length == 1) {
      return channelSearchContentLabel(l10n, contentTypes.first);
    }
    return l10n.channelDetailsSearchContentTypesCount(contentTypes.length);
  }

  Future<void> _openInSheet() async {
    if (widget.guildId == null || !mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<Channel>? selected =
        await FluxerBottomSheet.showScrollable<List<Channel>>(
          context,
          title: l10n.channelDetailsSearchFilterByChannel,
          minChildSize: 0.5,
          builder: (sheetContext, scrollController, close) {
            return ChannelSearchChannelFilterSheet(
              initialSelectedIds: _chipState.channelIds,
              scrollController: scrollController,
              onDone: (List<Channel> chosen) =>
                  Navigator.of(sheetContext).pop(chosen),
            );
          },
        );
    if (selected != null) {
      _setChannelSelection(selected);
    }
  }

  Future<void> _openMentionsSheet() async {
    final String? guildId = widget.guildId;
    if (!mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<_PickerUser>? selected =
        await FluxerBottomSheet.showScrollable<List<_PickerUser>>(
          context,
          title: l10n.channelDetailsSearchFilterMentions,
          minChildSize: 0.5,
          builder: (sheetContext, scrollController, close) {
            if (guildId != null) {
              return _GuildUserSearchFilterSheet(
                guildId: guildId,
                initialSelectedIds: _chipState.mentionIds,
                scrollController: scrollController,
                onDone: (List<_PickerUser> chosen) =>
                    Navigator.of(sheetContext).pop(chosen),
              );
            }
            return _DmUserFilterSheetLoader(
              channelId: widget.channelId,
              initialSelectedIds: _chipState.mentionIds,
              scrollController: scrollController,
              onDone: (List<_PickerUser> chosen) =>
                  Navigator.of(sheetContext).pop(chosen),
            );
          },
        );
    if (selected != null) {
      _setMentionSelection(selected);
    }
  }

  Future<void> _openMoreFiltersSheet() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ChannelSearchMoreFiltersResult? result =
        await FluxerBottomSheet.showScrollable<ChannelSearchMoreFiltersResult>(
          context,
          title: l10n.channelDetailsSearchFilterMore,
          minChildSize: 0.5,
          builder: (sheetContext, scrollController, close) {
            return ChannelSearchMoreFiltersSheet(
              initial: ChannelSearchMoreFiltersResult(
                pinned: _chipState.pinned,
                authorTypes: _chipState.authorTypes,
                linkHostname: _chipState.linkHostname,
                fileName: _chipState.fileName,
                fileExtension: _chipState.fileExtension,
                dateFilterKey: _chipState.dateFilterKey,
                dateValue: _chipState.dateValue,
              ),
              scrollController: scrollController,
              onDone: (ChannelSearchMoreFiltersResult chosen) {
                Navigator.of(sheetContext).pop(chosen);
              },
            );
          },
        );
    if (result != null) {
      _applyMoreFilters(result);
    }
  }

  Future<void> _openFromSheet() async {
    final String? guildId = widget.guildId;
    if (!mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<_PickerUser>? selected =
        await FluxerBottomSheet.showScrollable<List<_PickerUser>>(
          context,
          title: l10n.channelDetailsSearchFilterByUser,
          minChildSize: 0.5,
          builder: (sheetContext, scrollController, close) {
            if (guildId != null) {
              return _GuildUserSearchFilterSheet(
                guildId: guildId,
                initialSelectedIds: _chipState.authorIds,
                scrollController: scrollController,
                onDone: (List<_PickerUser> chosen) =>
                    Navigator.of(sheetContext).pop(chosen),
              );
            }
            return _DmUserFilterSheetLoader(
              channelId: widget.channelId,
              initialSelectedIds: _chipState.authorIds,
              scrollController: scrollController,
              onDone: (List<_PickerUser> chosen) =>
                  Navigator.of(sheetContext).pop(chosen),
            );
          },
        );
    if (selected != null) {
      _setAuthorSelection(selected);
    }
  }

  Future<void> _openHasSheet() async {
    final ChannelSearchState state = ref.read(
      channelSearchProvider(widget.channelId, widget.guildId),
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Set<MessageSearchContentFilter>? selected =
        await FluxerBottomSheet.showScrollable<Set<MessageSearchContentFilter>>(
          context,
          title: l10n.channelDetailsSearchFilterByContent,
          minChildSize: 0.5,
          builder: (sheetContext, scrollController, close) => _HasFilterSheet(
            initialSelected: state.query.contentTypes,
            scrollController: scrollController,
            onDone: (Set<MessageSearchContentFilter> chosen) =>
                Navigator.of(sheetContext).pop(chosen),
          ),
        );
    if (selected != null) {
      _updateFilters(contentTypes: selected);
    }
  }

  Future<void> _openSortSheet() async {
    final ChannelSearchState state = ref.read(
      channelSearchProvider(widget.channelId, widget.guildId),
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final MessageSearchSortFilter? selected =
        await FluxerBottomSheet.show<MessageSearchSortFilter>(
          context,
          title: l10n.channelDetailsSearchSortBy,
          builder: (sheetContext, close) => FluxerBottomSheetContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for (final MessageSearchSortFilter value
                    in MessageSearchSortFilter.values) ...<Widget>[
                  ChannelSearchOptionCard(
                    icon: channelSearchSortIcon(value),
                    label: channelSearchSortLabel(l10n, value),
                    description: channelSearchSortDescription(l10n, value),
                    isSelected: state.query.sort == value,
                    onTap: () => Navigator.of(sheetContext).pop(value),
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            ),
          ),
        );
    if (selected != null) {
      _updateFilters(sort: selected);
    }
  }

  Future<void> _openScopeSheet() async {
    final ChannelSearchState state = ref.read(
      channelSearchProvider(widget.channelId, widget.guildId),
    );
    final bool isGuildChannel = widget.guildId != null;
    final List<MessageSearchScopeFilter> options = channelSearchScopeOptions(
      isGuildChannel: isGuildChannel,
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final MessageSearchScopeFilter? selected =
        await FluxerBottomSheet.show<MessageSearchScopeFilter>(
          context,
          title: l10n.channelDetailsSearchIn,
          builder: (sheetContext, close) => FluxerBottomSheetContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for (final MessageSearchScopeFilter value
                    in options) ...<Widget>[
                  ChannelSearchOptionCard(
                    icon: channelSearchScopeIcon(value),
                    label: channelSearchScopeLabel(
                      l10n,
                      value,
                      isGuildChannel: isGuildChannel,
                    ),
                    description: channelSearchScopeDescription(
                      l10n,
                      value,
                      isGuildChannel: isGuildChannel,
                    ),
                    isSelected: state.query.uiScope == value,
                    onTap: () => Navigator.of(sheetContext).pop(value),
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            ),
          ),
        );
    if (selected != null) {
      _updateFilters(scope: selected);
    }
  }

  void _retrySearch() => _runSearch();

  Widget _buildResults(BuildContext context, ChannelSearchState state) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    if (!state.hasSearched) {
      return _EmptySheetState(
        icon: PhosphorIconsBold.magnifyingGlass,
        title: l10n.channelDetailsSearchEmptyTitle,
        body: l10n.channelDetailsSearchEmptyBody,
      );
    }
    if (state.isSearching) {
      return const Center(child: FluxerLoadingSpinner());
    }
    if (state.errorMessage != null) {
      return _ErrorSheetState(
        title: state.errorMessage!,
        onRetry: _retrySearch,
      );
    }
    if (state.indexing) {
      return _EmptySheetState(
        icon: PhosphorIconsBold.clockCounterClockwise,
        title: l10n.channelDetailsSearchIndexingTitle,
        body: l10n.channelDetailsSearchIndexingBody,
      );
    }
    if (state.results.isEmpty) {
      return _EmptySheetState(
        icon: PhosphorIconsBold.magnifyingGlass,
        title: l10n.channelDetailsSearchNoResultsTitle,
        body: l10n.channelDetailsSearchNoResultsBody,
      );
    }

    return ListView.builder(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
      itemCount: state.results.length + (state.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= state.results.length) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: layout.s4),
            child: const Center(child: FluxerLoadingSpinner()),
          );
        }
        final entry = state.results[index];
        final label = entry.channelName == null
            ? _formatDate(entry.message.timestamp)
            : '#${entry.channelName} - ${_formatDate(entry.message.timestamp)}';
        return MessagePreviewTile(
          message: entry.message,
          label: label,
          guildId: entry.guildId,
          onTap: () => _popWithJumpRequest(
            context,
            message: entry.message,
            guildId: entry.guildId,
          ),
          onLongPress: () =>
              _showSearchMessageActions(context, ref, entry: entry),
        );
      },
    );
  }
}

class _RecentSearchHistory extends StatelessWidget {
  const _RecentSearchHistory({required this.entries, required this.onSelect});

  final List<ChannelSearchHistoryEntry> entries;
  final ValueChanged<ChannelSearchHistoryEntry> onSelect;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: layout.s3),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            l10n.channelHeaderSearchRecentTitle,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ),
        SizedBox(height: layout.s2),
        Wrap(
          spacing: layout.s2,
          runSpacing: layout.s2,
          children: <Widget>[
            for (final ChannelSearchHistoryEntry entry in entries.take(5))
              ActionChip(
                label: Text(entry.displayText, overflow: TextOverflow.ellipsis),
                onPressed: () => onSelect(entry),
              ),
          ],
        ),
      ],
    );
  }
}
