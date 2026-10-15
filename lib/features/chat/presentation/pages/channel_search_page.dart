part of '../sheets/channel_details_sheet.dart';

const Duration _kSearchTypingDebounce = Duration(milliseconds: 300);
const int _kRecentSearchDisplayLimit = 5;
const int _kSearchSkeletonRows = 6;

Route<T> _channelSearchPageRoute<T>(Widget page) {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
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
  await executeChannelDetailsJumpRequest(
    container: container,
    request: request,
  );
}

enum ChannelSearchResultTab {
  messages(null),
  images(ChannelSearchToken(kind: ChannelSearchTokenKind.has, value: 'image')),
  pins(ChannelSearchToken(kind: ChannelSearchTokenKind.pinned, value: 'true')),
  links(ChannelSearchToken(kind: ChannelSearchTokenKind.has, value: 'link')),
  files(ChannelSearchToken(kind: ChannelSearchTokenKind.has, value: 'file'));

  const ChannelSearchResultTab(this.filter);

  final ChannelSearchToken? filter;

  String label(FluxerLocalizations l10n) => switch (this) {
    ChannelSearchResultTab.messages => l10n.channelSearchTabMessages,
    ChannelSearchResultTab.images => l10n.channelSearchTabImages,
    ChannelSearchResultTab.pins => l10n.channelSearchTabPins,
    ChannelSearchResultTab.links => l10n.channelSearchTabLinks,
    ChannelSearchResultTab.files => l10n.channelSearchTabFiles,
  };
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
  List<ChannelSearchToken> _tokens = const <ChannelSearchToken>[];
  ChannelSearchResultTab _tab = ChannelSearchResultTab.messages;
  MessageSearchScopeFilter _scope = MessageSearchScopeFilter.current;
  MessageSearchSortFilter _sort = MessageSearchSortFilter.newest;
  ChannelSearchActiveFilter? _activeFilter;
  List<ChannelSearchHistoryEntry> _recents =
      const <ChannelSearchHistoryEntry>[];
  Timer? _searchDebounce;
  bool _typingPending = false;
  String _lastText = '';
  String? _lastSearchSignature;
  ChannelSearchHistoryEntry? _sessionRecent;

  ChannelSearchProvider get _provider =>
      channelSearchProvider(widget.channelId, widget.guildId);

  bool get _isGuild => widget.guildId?.isNotEmpty ?? false;

  String get _contextKey => channelSearchContextKey(
    channelId: widget.channelId,
    guildId: widget.guildId,
  );

  @override
  void initState() {
    super.initState();
    final ChannelSearchState existing = ref.read(_provider);
    _lastText = existing.hasSearched ? existing.query.rawQuery : '';
    _scope = existing.query.uiScope;
    _sort = existing.query.uiSort;
    _textController = TextEditingController(text: _lastText);
    _focusNode = FocusNode();
    _scrollController = ScrollController()..addListener(_onScroll);
    _textController.addListener(_onTextChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
    unawaited(_loadRecents());
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _textController
      ..removeListener(_onTextChanged)
      ..dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _loadRecents() async {
    if (!mounted) {
      return;
    }
    final ChannelSearchHistoryRepository repository = await ref.read(
      channelSearchHistoryRepositoryProvider.future,
    );
    if (!mounted) {
      return;
    }
    setState(() => _recents = repository.readForContext(_contextKey));
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    if (position.pixels >=
        position.maxScrollExtent - _kSheetLoadMoreThreshold) {
      unawaited(ref.read(_provider.notifier).loadMore());
    }
  }

  void _onTextChanged() {
    final ChannelSearchActiveFilter? active = channelSearchActiveFilter(
      _textController.value,
      isGuildChannel: _isGuild,
    );
    final bool textChanged = _textController.text != _lastText;
    _lastText = _textController.text;
    if (active?.kind != _activeFilter?.kind ||
        active?.query != _activeFilter?.query ||
        textChanged) {
      setState(() => _activeFilter = active);
    }
    if (!textChanged) {
      return;
    }
    if (active != null) {
      _searchDebounce?.cancel();
      _typingPending = false;
      return;
    }
    _scheduleSearch();
  }

  String get _committedText {
    final ChannelSearchActiveFilter? active = _activeFilter;
    if (active == null) {
      return _textController.text.trim();
    }
    return channelSearchRemoveRange(
      _textController.value,
      active.start,
      active.end,
    ).text.trim();
  }

  bool get _hasQuery => _committedText.isNotEmpty || _tokens.isNotEmpty;

  MessageSearchQuery _buildQuery() {
    final ChannelSearchToken? tabFilter = _tab.filter;
    return MessageSearchQuery.build(
      channelId: widget.channelId,
      guildId: widget.guildId,
      rawQuery: _committedText,
      uiScope: _scope,
      uiSort: _sort,
      context: ChannelSearchParseContext(
        currentUserId: ref.read(currentUserIdProvider),
        resolveChannelByName: _resolveChannelName,
      ),
      chipFilters: channelSearchChipFiltersForTokens(
        _tokens,
        extra: <ChannelSearchToken>[?tabFilter],
      ),
    );
  }

  String? _resolveChannelName(String channelName) {
    if (!_isGuild) {
      return null;
    }
    return resolveChannelIdByName(
      ref.read(channelListViewModelProvider).categories,
      channelName,
    );
  }

  void _scheduleSearch() {
    _searchDebounce?.cancel();
    if (!_hasQuery) {
      setState(() {
        _typingPending = false;
        _tab = ChannelSearchResultTab.messages;
      });
      unawaited(ref.read(_provider.notifier).search(query: _buildQuery()));
      return;
    }
    setState(() => _typingPending = true);
    _searchDebounce = Timer(_kSearchTypingDebounce, () {
      if (!mounted) {
        return;
      }
      setState(() => _typingPending = false);
      _runSearch();
    });
  }

  String get _searchSignature => <String>[
    channelSearchQuerySignature(
      text: _committedText,
      tokens: <ChannelSearchToken>[..._tokens, ?_tab.filter],
    ),
    '${_scope.index}',
    '${_sort.index}',
  ].join('|');

  void _runSearch({bool remember = false}) {
    _searchDebounce?.cancel();
    if (_typingPending) {
      setState(() => _typingPending = false);
    }
    final MessageSearchQuery query = _buildQuery();
    _lastSearchSignature = _searchSignature;
    unawaited(ref.read(_provider.notifier).search(query: query));
    if (remember && query.hasSearchTerms) {
      unawaited(_remember());
    }
  }

  bool get _showsSettledResults {
    final ChannelSearchState state = ref.read(_provider);
    return !_typingPending &&
        state.hasSearched &&
        !state.isSearching &&
        !state.indexing &&
        state.errorMessage == null &&
        _lastSearchSignature == _searchSignature;
  }

  Future<void> _remember({bool refinable = true}) async {
    if (!_hasQuery) {
      return;
    }
    final ChannelSearchHistoryEntry entry = ChannelSearchHistoryEntry.fromQuery(
      contextKey: _contextKey,
      text: _committedText,
      tokens: _tokens,
      scopeIndex: _scope.index,
      sortIndex: _sort.index,
      timestampMs: DateTime.now().millisecondsSinceEpoch,
    );
    final ChannelSearchHistoryEntry? previous = _sessionRecent;
    _sessionRecent = refinable ? entry : null;
    final ChannelSearchHistoryRepository repository = await ref.read(
      channelSearchHistoryRepositoryProvider.future,
    );
    await repository.addEntry(entry, replacing: previous);
    await _loadRecents();
  }

  void _onSubmitted(String _) {
    final ChannelSearchActiveFilter? active = _activeFilter;
    if (active != null) {
      final ChannelSearchToken? token = _resolveTypedFilter(active);
      if (token != null) {
        _addToken(token);
      }
      _focusNode.requestFocus();
      return;
    }
    if (_showsSettledResults) {
      unawaited(_remember());
    } else {
      _runSearch(remember: true);
    }
    _focusNode.unfocus();
  }

  ChannelSearchToken? _resolveTypedFilter(ChannelSearchActiveFilter active) {
    final String query = active.query.trim();
    switch (active.kind) {
      case ChannelSearchTokenKind.has:
        final MessageSearchContentFilter? filter =
            channelSearchContentFilterForValue(query);
        return filter == null ? null : channelSearchHasToken(filter);
      case ChannelSearchTokenKind.pinned:
      case ChannelSearchTokenKind.authorType:
        final List<String> values = channelSearchValueSuggestions(
          active.kind,
          query,
        );
        return values.length == 1
            ? ChannelSearchToken(kind: active.kind, value: values.single)
            : null;
      case ChannelSearchTokenKind.before:
      case ChannelSearchTokenKind.during:
      case ChannelSearchTokenKind.after:
        final DateTime? date = channelSearchParseDate(query);
        return date == null
            ? null
            : ChannelSearchToken(
                kind: active.kind,
                value: formatChannelSearchDate(date),
              );
      case ChannelSearchTokenKind.from:
      case ChannelSearchTokenKind.mentions:
      case ChannelSearchTokenKind.channel:
        return null;
    }
  }

  void _addToken(ChannelSearchToken token) {
    final ChannelSearchActiveFilter? active = _activeFilter;
    if (active != null) {
      final TextEditingValue stripped = channelSearchRemoveRange(
        _textController.value,
        active.start,
        active.end,
      );
      _lastText = stripped.text;
      _textController.value = stripped;
    }
    setState(() {
      _activeFilter = null;
      _tokens = channelSearchAddToken(_tokens, token);
    });
    _runSearch(remember: true);
  }

  void _removeToken(ChannelSearchToken token) {
    setState(() {
      _tokens = <ChannelSearchToken>[
        for (final ChannelSearchToken existing in _tokens)
          if (existing != token) existing,
      ];
    });
    if (_hasQuery) {
      _runSearch();
    } else {
      _scheduleSearch();
    }
  }

  void _clearAll() {
    _searchDebounce?.cancel();
    _sessionRecent = null;
    _lastText = '';
    _textController.clear();
    setState(() {
      _tokens = const <ChannelSearchToken>[];
      _activeFilter = null;
      _typingPending = false;
      _tab = ChannelSearchResultTab.messages;
    });
    unawaited(ref.read(_provider.notifier).search(query: _buildQuery()));
  }

  void _startFilter(ChannelSearchTokenKind kind) {
    _textController.value = channelSearchInsertFilterPrefix(
      _textController.value,
      kind,
    );
    _focusNode.requestFocus();
  }

  void _selectTab(ChannelSearchResultTab tab) {
    if (tab == _tab) {
      return;
    }
    setState(() => _tab = tab);
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }
    _runSearch();
  }

  Future<void> _pickDate(ChannelSearchTokenKind kind) async {
    _focusNode.unfocus();
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2015),
      lastDate: now,
    );
    if (!mounted || picked == null) {
      return;
    }
    _addToken(
      ChannelSearchToken(kind: kind, value: formatChannelSearchDate(picked)),
    );
  }

  void _restoreRecent(ChannelSearchHistoryEntry entry) {
    final ({String text, List<ChannelSearchToken> tokens}) query = entry.query;
    _searchDebounce?.cancel();
    _lastText = query.text;
    _textController.value = TextEditingValue(
      text: query.text,
      selection: TextSelection.collapsed(offset: query.text.length),
    );
    setState(() {
      _tokens = query.tokens;
      _activeFilter = null;
      _typingPending = false;
      _tab = ChannelSearchResultTab.messages;
      _scope = MessageSearchScopeFilter.values[entry.scopeIndex];
      _sort = MessageSearchSortFilter.values[entry.sortIndex];
    });
    _runSearch();
    unawaited(_remember(refinable: false));
    _focusNode.unfocus();
  }

  Future<void> _removeRecent(ChannelSearchHistoryEntry entry) async {
    final ChannelSearchHistoryRepository repository = await ref.read(
      channelSearchHistoryRepositoryProvider.future,
    );
    await repository.removeEntry(entry);
    await _loadRecents();
  }

  Future<void> _clearRecents() async {
    final ChannelSearchHistoryRepository repository = await ref.read(
      channelSearchHistoryRepositoryProvider.future,
    );
    await repository.clearForContext(_contextKey);
    await _loadRecents();
  }

  void _openResult(MessageSearchResultEntry entry) {
    unawaited(_remember());
    _popWithJumpRequest(
      context,
      message: entry.message,
      guildId: entry.guildId,
    );
  }

  Future<void> _openFilterMenu() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<MessageSearchScopeFilter> scopes = channelSearchScopeOptions(
      isGuildChannel: _isGuild,
    );
    await FluxerBottomSheet.show<void>(
      context,
      variant: FluxerBottomSheetVariant.menu,
      builder: (BuildContext sheetContext, VoidCallback close) {
        void pick(VoidCallback action) {
          Navigator.of(sheetContext).pop();
          action();
        }

        return ListView(
          shrinkWrap: true,
          padding: FluxerBottomSheet.scrollViewPadding(
            sheetContext,
            padding: EdgeInsets.only(
              bottom: FluxerBottomSheet.bottomGapOf(sheetContext),
            ),
          ),
          children: <Widget>[
            FluxerBottomSheetGroupColumn(
              children: <Widget>[
                FluxerBottomSheetSection(
                  title: l10n.channelSearchFilterMenuTitle,
                  child: FluxerMenuGroup(
                    children: <Widget>[
                      for (final ChannelSearchTokenKind kind
                          in channelSearchMenuFilters(isGuildChannel: _isGuild))
                        FluxerBottomSheetMenuItem(
                          key: ValueKey<String>('search-menu-${kind.key}'),
                          label: channelSearchFilterLabel(l10n, kind),
                          icon: channelSearchFilterIcon(kind),
                          onTap: () => pick(() => _startFilter(kind)),
                        ),
                    ],
                  ),
                ),
                FluxerBottomSheetSection(
                  title: l10n.channelDetailsSearchSortBy,
                  child: FluxerMenuGroup(
                    children: <Widget>[
                      for (final MessageSearchSortFilter sort
                          in MessageSearchSortFilter.values)
                        FluxerBottomSheetMenuItem(
                          label: channelSearchSortLabel(l10n, sort),
                          icon: channelSearchSortIcon(sort),
                          isSelected: sort == _sort,
                          onTap: () => pick(() {
                            setState(() => _sort = sort);
                            if (_hasQuery) {
                              _runSearch();
                            }
                          }),
                        ),
                    ],
                  ),
                ),
                FluxerBottomSheetSection(
                  title: l10n.channelDetailsSearchIn,
                  child: FluxerMenuGroup(
                    children: <Widget>[
                      for (final MessageSearchScopeFilter scope in scopes)
                        FluxerBottomSheetMenuItem(
                          label: channelSearchScopeLabel(
                            l10n,
                            scope,
                            isGuildChannel: _isGuild,
                          ),
                          icon: channelSearchScopeIcon(scope),
                          isSelected: scope == _scope,
                          onTap: () => pick(() {
                            setState(() => _scope = scope);
                            if (_hasQuery) {
                              _runSearch();
                            }
                          }),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final ChannelSearchState state = ref.watch(_provider);
    final Color background = context.colors.backgroundSecondary;
    final bool showTabs = _activeFilter == null && _hasQuery;
    final bool isSearching =
        _typingPending || state.isSearching || state.indexing;

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                layout.s1,
                layout.s2,
                layout.s1,
                layout.s2,
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const PhosphorIcon(PhosphorIconsBold.caretLeft),
                    iconSize: 20,
                    color: context.colors.textSecondary,
                    tooltip: l10n.back,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: ChannelSearchField(
                      controller: _textController,
                      focusNode: _focusNode,
                      tokens: _tokens,
                      guildId: widget.guildId,
                      hintText: l10n.channelDetailsSearchHint,
                      isSearching: isSearching && _hasQuery,
                      onSubmitted: _onSubmitted,
                      onRemoveToken: _removeToken,
                      onClear: _clearAll,
                    ),
                  ),
                  IconButton(
                    key: const ValueKey<String>('search-filter-button'),
                    icon: const PhosphorIcon(
                      PhosphorIconsBold.slidersHorizontal,
                    ),
                    iconSize: 20,
                    color: context.colors.textPrimary,
                    tooltip: l10n.channelSearchFiltersButton,
                    onPressed: () => unawaited(_openFilterMenu()),
                  ),
                ],
              ),
            ),
            if (showTabs) _buildTabs(context, l10n, state),
            Expanded(
              child: AnimatedSwitcher(
                duration: context.motion.fast,
                child: KeyedSubtree(
                  key: ValueKey<String>(_bodyKey(state)),
                  child: _buildBody(context, l10n, state),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _showsSkeleton(ChannelSearchState state) =>
      _typingPending || (state.isSearching && state.results.isEmpty);

  String _bodyKey(ChannelSearchState state) {
    final ChannelSearchActiveFilter? active = _activeFilter;
    if (active != null) {
      return 'suggest-${active.kind.key}';
    }
    if (!_hasQuery) {
      return 'landing';
    }
    return _showsSkeleton(state) ? 'loading' : 'results';
  }

  Widget _buildTabs(
    BuildContext context,
    FluxerLocalizations l10n,
    ChannelSearchState state,
  ) {
    final colors = context.colors;
    final layout = context.layout;
    final bool settled =
        state.hasSearched &&
        !state.isSearching &&
        !state.indexing &&
        !_typingPending &&
        state.errorMessage == null;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colors.backgroundModifierAccent),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: layout.s4),
        child: Row(
          children: <Widget>[
            for (final ChannelSearchResultTab tab
                in ChannelSearchResultTab.values)
              _SearchResultTab(
                key: ValueKey<String>('search-tab-${tab.name}'),
                label: tab == _tab && settled
                    ? l10n.channelSearchTabCount(tab.label(l10n), state.total)
                    : tab.label(l10n),
                selected: tab == _tab,
                onTap: () => _selectTab(tab),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    FluxerLocalizations l10n,
    ChannelSearchState state,
  ) {
    final ChannelSearchActiveFilter? active = _activeFilter;
    if (active != null) {
      return ChannelSearchFilterSuggestions(
        filter: active,
        channelId: widget.channelId,
        guildId: widget.guildId,
        onPick: _addToken,
        onPickDate: (ChannelSearchTokenKind kind) => unawaited(_pickDate(kind)),
      );
    }
    if (!_hasQuery) {
      return _buildLanding(context, l10n);
    }
    if (_showsSkeleton(state)) {
      return const _SearchResultSkeleton();
    }
    final String? error = state.errorMessage;
    if (error != null && state.results.isEmpty) {
      return _ErrorSheetState(title: error, onRetry: _runSearch);
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
    final layout = context.layout;
    return ListView.separated(
      controller: _scrollController,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: layout.s2, bottom: layout.s4),
      itemCount: state.results.length + (state.isLoadingMore ? 1 : 0),
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 1,
        thickness: 1,
        indent: layout.s4,
        endIndent: layout.s4,
        color: context.colors.backgroundModifierAccent,
      ),
      itemBuilder: (BuildContext context, int index) {
        if (index >= state.results.length) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: layout.s4),
            child: const Center(child: FluxerLoadingSpinner()),
          );
        }
        final MessageSearchResultEntry entry = state.results[index];
        final String? channelName = entry.channelName;
        final bool otherChannel = entry.message.channelId != widget.channelId;
        return MessagePreviewTile(
          message: entry.message,
          flat: true,
          label: channelName != null && otherChannel ? '#$channelName' : null,
          guildId: entry.guildId,
          onTap: () => _openResult(entry),
          onLongPress: () =>
              _showSearchMessageActions(context, ref, entry: entry),
        );
      },
    );
  }

  Widget _buildLanding(BuildContext context, FluxerLocalizations l10n) {
    final layout = context.layout;
    final List<ChannelSearchHistoryEntry> recents = _recents
        .take(_kRecentSearchDisplayLimit)
        .toList();
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
      children: <Widget>[
        if (recents.isNotEmpty) ...<Widget>[
          ChannelSearchSectionHeader(
            title: l10n.channelHeaderSearchRecentTitle,
            actionLabel: l10n.channelHeaderSearchClearHistory,
            onAction: () => unawaited(_clearRecents()),
          ),
          for (final ChannelSearchHistoryEntry entry in recents)
            ChannelSearchRecentRow(
              key: ValueKey<String>('recent-${entry.signature}'),
              entry: entry,
              guildId: widget.guildId,
              onTap: () => _restoreRecent(entry),
              onRemove: () => unawaited(_removeRecent(entry)),
            ),
        ],
        ChannelSearchSectionHeader(title: l10n.channelHeaderSearchFiltersTitle),
        for (final ChannelSearchTokenKind kind in channelSearchMenuFilters(
          isGuildChannel: _isGuild,
        ))
          ChannelSearchSuggestionRow(
            key: ValueKey<String>('search-filter-${kind.key}'),
            leading: PhosphorIcon(
              channelSearchFilterIcon(kind),
              size: 20,
              color: context.colors.textSecondary,
            ),
            title: channelSearchFilterLabel(l10n, kind),
            trailing: '${kind.key}:',
            onTap: () => _startFilter(kind),
          ),
      ],
    );
  }
}

class _SearchResultTab extends StatelessWidget {
  const _SearchResultTab({
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final Color color = selected
        ? colors.brandPrimaryLight
        : colors.textSecondary;
    return Semantics(
      selected: selected,
      button: true,
      child: FluxerGestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsetsDirectional.only(end: layout.s5),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: layout.s3),
                  child: AnimatedDefaultTextStyle(
                    duration: context.motion.fast,
                    style: context.textStyles.bodyMedium.copyWith(
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                    child: Text(label, maxLines: 1),
                  ),
                ),
                AnimatedContainer(
                  duration: context.motion.fast,
                  height: 2,
                  color: selected
                      ? colors.brandPrimaryLight
                      : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchResultSkeleton extends StatelessWidget {
  const _SearchResultSkeleton();

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final Color tile = context.colors.backgroundModifierHover;
    Widget bar(double width, double height) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: tile, borderRadius: layout.radiusSm),
    );
    return ListView.builder(
      key: const ValueKey<String>('search-skeleton'),
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(layout.s4, layout.s3, layout.s4, 0),
      itemCount: _kSearchSkeletonRows,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: EdgeInsets.only(bottom: layout.s5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: tile, shape: BoxShape.circle),
            ),
            SizedBox(width: layout.s3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  bar(96 + (index % 3) * 24, 12),
                  SizedBox(height: layout.s2),
                  bar(double.infinity, 10),
                  SizedBox(height: layout.s1_5),
                  bar(140 + (index % 2) * 60, 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
