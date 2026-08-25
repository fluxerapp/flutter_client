import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/data/channel_search_history_repository.dart';
import 'package:fluxer_app/features/chat/data/channel_search_query_parser.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_segments.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_search_autocomplete.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_header_search_provider.dart';
import 'package:fluxer_app/features/chat/utils/channel_search_text_edit_utils.dart';
import 'package:fluxer_app/features/chat/utils/channel_search_utils.dart';
import 'package:fluxer_app/features/chat/utils/composer_mention_query.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/members/data/guild_mention_member_search.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/ui/input/fluxer_clipboard_scope.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kChannelHeaderSearchFieldWidth = 244;

enum _ChannelSearchAutocompleteMode {
  none,
  filters,
  history,
  users,
  channels,
  filterValues,
  dates,
}

class ChannelHeaderSearchField extends ConsumerStatefulWidget {
  const ChannelHeaderSearchField({
    required this.channelId,
    required this.guildId,
    this.dm,
    this.highContrast = false,
    super.key,
  });

  final String channelId;
  final String? guildId;
  final DmConversation? dm;
  final bool highContrast;

  @override
  ConsumerState<ChannelHeaderSearchField> createState() =>
      _ChannelHeaderSearchFieldState();
}

class _ChannelHeaderSearchFieldState
    extends ConsumerState<ChannelHeaderSearchField>
    with SingleTickerProviderStateMixin {
  static const Duration _kUserSearchDebounce = Duration(milliseconds: 300);

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _searchAnchorKey = GlobalKey();
  final OverlayPortalController _overlayController = OverlayPortalController();
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  _ChannelSearchAutocompleteMode _autocompleteMode =
      _ChannelSearchAutocompleteMode.none;
  ChannelSearchFilterOption? _activeFilter;
  int _selectedIndex = -1;
  bool _hasNavigated = false;
  bool _suppressAutoOpen = false;
  Timer? _userSearchDebounce;
  List<Member> _userResults = const <Member>[];
  Map<String, String> _userDiscriminators = const <String, String>{};
  final Map<String, String> _userIdsByTag = <String, String>{};
  final Map<String, String> _channelIdsByName = <String, String>{};
  String _listboxId = 'channel-search-listbox';
  bool _openAutocompleteUpward = false;
  bool _alignAutocompleteRight = true;

  bool get _isGuildChannel => widget.guildId != null;

  MessageSearchScopeFilter get _effectiveScope =>
      ref.watch(channelHeaderSearchProvider).scope;

  MessageSearchSortFilter get _effectiveSort =>
      ref.watch(channelHeaderSearchProvider).sort;

  @override
  void initState() {
    super.initState();
    _listboxId = 'channel-search-listbox-${widget.channelId}';
    _animationController = AnimationController(
      vsync: this,
      duration: FluxerMotionTheme.normalDuration,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _controller.addListener(_onQueryChanged);
    _focusNode
      ..addListener(_onFocusChanged)
      ..onKeyEvent = _handleKeyEvent;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(channelHeaderSearchProvider.notifier)
          .bindChannel(channelId: widget.channelId, guildId: widget.guildId);
    });
  }

  @override
  void didUpdateWidget(ChannelHeaderSearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId ||
        oldWidget.guildId != widget.guildId) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        ref
            .read(channelHeaderSearchProvider.notifier)
            .bindChannel(channelId: widget.channelId, guildId: widget.guildId);
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.duration = context.motion.normal;
  }

  @override
  void dispose() {
    _userSearchDebounce?.cancel();
    _controller
      ..removeListener(_onQueryChanged)
      ..dispose();
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onQueryChanged() {
    pruneSearchHintMaps(
      query: _controller.text,
      usersByTag: _userIdsByTag,
      channelsByName: _channelIdsByName,
    );
    _publishDisplayText(_controller.text);
    _suppressAutoOpen = false;
    _updateAutocompleteMode();
    setState(() => _hasNavigated = false);
    _showOverlayIfNeeded();
  }

  void _publishDisplayText(String text) {
    ref.read(channelHeaderSearchProvider.notifier).updateDisplayText(text);
  }

  String _normalizedFilterKey(String key) =>
      key.startsWith('-') ? key.substring(1) : key;

  ChannelSearchAutocompleteEntry _sectionHeader({
    required ChannelSearchAutocompleteSection section,
    required String title,
    IconData? icon,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    return ChannelSearchAutocompleteEntry(
      section: section,
      label: title,
      icon: icon,
      selectable: false,
      isSectionHeader: true,
      sectionActionLabel: actionLabel,
      onSectionAction: onAction,
    );
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      _updateAutocompleteMode();
      _showOverlayIfNeeded();
      return;
    }
    _hideOverlay();
    setState(() {
      _autocompleteMode = _ChannelSearchAutocompleteMode.none;
      _activeFilter = null;
      _selectedIndex = -1;
    });
  }

  void _updateAutocompleteMode() {
    if (!_focusNode.hasFocus || _suppressAutoOpen) {
      _autocompleteMode = _ChannelSearchAutocompleteMode.none;
      _activeFilter = null;
      return;
    }

    final String text = _controller.text;
    final int cursor = _controller.selection.baseOffset.clamp(0, text.length);
    final String textBeforeCursor = text.substring(0, cursor);
    final List<String> words = textBeforeCursor.split(RegExp(r'\s+'));
    final String currentWord = words.isEmpty ? '' : words.last;

    final ChannelSearchFilterOption? matchingFilter = _matchFilterPrefix(
      currentWord,
    );
    if (matchingFilter != null) {
      final String afterColon = currentWord.substring(
        matchingFilter.syntaxLabel.length,
      );
      if (isDateFilterKey(_normalizedFilterKey(matchingFilter.key))) {
        _autocompleteMode = _ChannelSearchAutocompleteMode.dates;
        _activeFilter = matchingFilter;
        return;
      }
      if (_normalizedFilterKey(matchingFilter.key) == 'has' ||
          matchingFilter.values != null) {
        _autocompleteMode = _ChannelSearchAutocompleteMode.filterValues;
        _activeFilter = matchingFilter;
        return;
      }
      if (isUserFilterKey(matchingFilter.key)) {
        _autocompleteMode = _ChannelSearchAutocompleteMode.users;
        _activeFilter = matchingFilter;
        _scheduleUserSearch(afterColon);
        return;
      }
      if (_normalizedFilterKey(matchingFilter.key) == 'in' && _isGuildChannel) {
        _autocompleteMode = _ChannelSearchAutocompleteMode.channels;
        _activeFilter = matchingFilter;
        return;
      }
      _autocompleteMode = _ChannelSearchAutocompleteMode.none;
      _activeFilter = null;
      return;
    }

    if (currentWord.isEmpty) {
      _autocompleteMode = _ChannelSearchAutocompleteMode.history;
      _activeFilter = null;
      return;
    }

    final bool partialFilter =
        channelSearchAutocompleteFilterOptions(
          isGuildChannel: _isGuildChannel,
          currentWord: currentWord,
        ).any((ChannelSearchFilterOption option) {
          if (option.requiresGuild && !_isGuildChannel) {
            return false;
          }
          if (currentWord.isEmpty) {
            return true;
          }
          return option.syntaxLabel.contains(currentWord) ||
              option.key.contains(currentWord);
        });
    _autocompleteMode = partialFilter
        ? _ChannelSearchAutocompleteMode.filters
        : _ChannelSearchAutocompleteMode.none;
    _activeFilter = null;
  }

  ChannelSearchFilterOption? _matchFilterPrefix(String currentWord) {
    if (currentWord.startsWith('-')) {
      for (final ChannelSearchFilterOption option
          in kChannelSearchFilterOptions) {
        final String syntax = '-${option.syntaxLabel}';
        if (currentWord.startsWith(syntax)) {
          return channelSearchFilterOptionForKey('-${option.key}');
        }
      }
    }
    for (final ChannelSearchFilterOption option
        in kChannelSearchFilterOptions) {
      if (currentWord.startsWith(option.syntaxLabel)) {
        return option;
      }
    }
    return null;
  }

  void _scheduleUserSearch(String query) {
    _userSearchDebounce?.cancel();
    final String trimmed = query.trim();
    if (trimmed.isEmpty) {
      unawaited(_fetchUsers(''));
      return;
    }
    _userSearchDebounce = Timer(_kUserSearchDebounce, () {
      unawaited(_fetchUsers(trimmed));
    });
  }

  Future<({List<Member> members, Map<String, String> discriminators})>
  _loadSearchUsers(String query, {int limit = 12}) async {
    final String? guildId = widget.guildId;
    final String normalized = query.toLowerCase();
    List<Member> members = const <Member>[];
    Map<String, String> discriminators = const <String, String>{};
    if (guildId != null) {
      final ParsedMentionQuery parsed = parseMentionQuery(query);
      final GuildMentionMemberSearch search = ref.read(
        guildMentionMemberSearchProvider,
      );
      final String trimmed = query.trim();
      if (trimmed.isEmpty) {
        members = await search.searchCached(guildId: guildId, parsed: parsed);
      } else {
        members = (await search.searchCachedThenGateway(
          guildId: guildId,
          query: trimmed,
          parsed: parsed,
        )).members;
      }
      discriminators = await search.discriminatorsFor(members);
    } else if (widget.dm != null) {
      final DmConversation dm = widget.dm!;
      final String? currentUserId = ref.read(currentUserIdProvider);
      final Set<String> userIds = <String>{
        ...dm.remoteRecipientIds,
        if (currentUserId != null && currentUserId.isNotEmpty) currentUserId,
      };
      final List<db.User> users = await ref
          .read(fluxerDatabaseProvider)
          .userDao
          .getUsersByIds(userIds.toList());
      members = <Member>[
        for (final db.User user in users)
          if (normalized.isEmpty || _dmUserMatchesSearch(user, normalized))
            Member(
              id: user.id,
              username: user.username,
              globalName: user.globalName,
              avatar: user.avatar,
              avatarColor: user.avatarColor,
            ),
      ];
      discriminators = <String, String>{
        for (final db.User user in users)
          if (visibleUserDiscriminator(user.discriminator)
              case final String disc)
            user.id: disc,
      };
    }
    return (
      members: members.take(limit).toList(),
      discriminators: discriminators,
    );
  }

  Future<void> _fetchUsers(String query) async {
    final String? guildId = widget.guildId;
    try {
      if (guildId != null) {
        final ParsedMentionQuery parsed = parseMentionQuery(query);
        final GuildMentionMemberSearch search = ref.read(
          guildMentionMemberSearchProvider,
        );
        final List<Member> cached = await search.searchCached(
          guildId: guildId,
          parsed: parsed,
        );
        final Map<String, String> cachedDiscs = await search.discriminatorsFor(
          cached,
        );
        if (!mounted) {
          return;
        }
        setState(() {
          _userResults = cached.take(12).toList();
          _userDiscriminators = cachedDiscs;
        });
        _showOverlayIfNeeded();
        if (query.trim().isEmpty ||
            !await search.shouldFetchFromGateway(guildId, query)) {
          return;
        }
        final ({List<Member> members, Set<String> remoteMemberIds}) gateway =
            await search.fetchGatewayAndMerge(
              guildId: guildId,
              query: query,
              parsed: parsed,
            );
        final Map<String, String> discs = await search.discriminatorsFor(
          gateway.members,
        );
        if (!mounted) {
          return;
        }
        setState(() {
          _userResults = gateway.members.take(12).toList();
          _userDiscriminators = discs;
        });
        _showOverlayIfNeeded();
        return;
      }
      final ({List<Member> members, Map<String, String> discriminators})
      loaded = await _loadSearchUsers(query);
      if (!mounted) {
        return;
      }
      setState(() {
        _userResults = loaded.members;
        _userDiscriminators = loaded.discriminators;
      });
      _showOverlayIfNeeded();
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() {
        _userResults = const <Member>[];
        _userDiscriminators = const <String, String>{};
      });
      _showOverlayIfNeeded();
    }
  }

  bool _dmUserMatchesSearch(db.User user, String normalizedQuery) {
    if (user.username.toLowerCase().contains(normalizedQuery)) {
      return true;
    }
    final String? globalName = user.globalName;
    return globalName != null &&
        globalName.toLowerCase().contains(normalizedQuery);
  }

  List<ChannelSearchAutocompleteEntry> _buildEntries() {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    switch (_autocompleteMode) {
      case _ChannelSearchAutocompleteMode.filters:
        return _sectionedEntries(
          section: ChannelSearchAutocompleteSection.filters,
          title: l10n.channelHeaderSearchFiltersTitle,
          icon: PhosphorIconsFill.funnel,
          items: _filterEntries(l10n, _currentWord()),
        );
      case _ChannelSearchAutocompleteMode.history:
        return _historyEntries(l10n);
      case _ChannelSearchAutocompleteMode.users:
        return _sectionedEntries(
          section: ChannelSearchAutocompleteSection.users,
          title: l10n.channelHeaderSearchUsersTitle,
          icon: PhosphorIconsBold.magnifyingGlass,
          items: _userEntries(),
        );
      case _ChannelSearchAutocompleteMode.channels:
        return _sectionedEntries(
          section: ChannelSearchAutocompleteSection.channels,
          title: l10n.channelHeaderSearchChannelsTitle,
          icon: PhosphorIconsBold.hash,
          items: _channelEntries(),
        );
      case _ChannelSearchAutocompleteMode.filterValues:
        return _sectionedEntries(
          section: ChannelSearchAutocompleteSection.filterValues,
          title: l10n.channelHeaderSearchValuesTitle,
          icon: PhosphorIconsFill.funnel,
          items: _valueEntries(l10n),
        );
      case _ChannelSearchAutocompleteMode.dates:
        return _sectionedEntries(
          section: ChannelSearchAutocompleteSection.dates,
          title: l10n.channelHeaderSearchDatesTitle,
          icon: PhosphorIconsFill.calendar,
          items: _dateEntries(),
        );
      case _ChannelSearchAutocompleteMode.none:
        return const <ChannelSearchAutocompleteEntry>[];
    }
  }

  List<ChannelSearchAutocompleteEntry> _sectionedEntries({
    required ChannelSearchAutocompleteSection section,
    required String title,
    required IconData icon,
    required List<ChannelSearchAutocompleteEntry> items,
  }) {
    if (items.isEmpty) {
      return const <ChannelSearchAutocompleteEntry>[];
    }
    return <ChannelSearchAutocompleteEntry>[
      _sectionHeader(section: section, title: title, icon: icon),
      ...items,
    ];
  }

  String _currentWord() {
    final String text = _controller.text;
    final int cursor = _controller.selection.baseOffset.clamp(0, text.length);
    final String textBeforeCursor = text.substring(0, cursor);
    final List<String> words = textBeforeCursor.split(RegExp(r'\s+'));
    return words.isEmpty ? '' : words.last;
  }

  List<ChannelSearchAutocompleteEntry> _filterEntries(
    FluxerLocalizations l10n,
    String currentWord,
  ) {
    final Iterable<ChannelSearchFilterOption> options =
        channelSearchAutocompleteFilterOptions(
          isGuildChannel: _isGuildChannel,
          currentWord: currentWord,
        );
    return options
        .map(
          (ChannelSearchFilterOption option) => ChannelSearchAutocompleteEntry(
            section: ChannelSearchAutocompleteSection.filters,
            label: option.syntaxLabel,
            subtitle: channelSearchFilterDescription(l10n, option.key),
            filterKey: option.key,
          ),
        )
        .toList();
  }

  List<ChannelSearchAutocompleteEntry> _historyEntries(
    FluxerLocalizations l10n,
  ) {
    final List<ChannelSearchAutocompleteEntry> entries =
        <ChannelSearchAutocompleteEntry>[
          _sectionHeader(
            section: ChannelSearchAutocompleteSection.filters,
            title: l10n.channelHeaderSearchFiltersTitle,
            icon: PhosphorIconsFill.funnel,
          ),
        ];
    for (final ChannelSearchFilterOption option
        in channelSearchHistoryFilterOptions(isGuildChannel: _isGuildChannel)) {
      entries.add(
        ChannelSearchAutocompleteEntry(
          section: ChannelSearchAutocompleteSection.filters,
          label: option.syntaxLabel,
          subtitle: channelSearchFilterDescription(l10n, option.key),
          filterKey: option.key,
        ),
      );
    }

    final String contextKey = channelSearchContextKey(
      channelId: widget.channelId,
      guildId: widget.guildId,
    );
    final AsyncValue<ChannelSearchHistoryRepository> repoAsync = ref.watch(
      channelSearchHistoryRepositoryProvider,
    );
    final List<ChannelSearchHistoryEntry> history =
        repoAsync.value?.readForContext(contextKey) ??
        const <ChannelSearchHistoryEntry>[];
    if (history.isNotEmpty) {
      entries.add(
        _sectionHeader(
          section: ChannelSearchAutocompleteSection.history,
          title: l10n.channelHeaderSearchRecentTitle,
          icon: PhosphorIconsFill.clockCounterClockwise,
          actionLabel: l10n.channelHeaderSearchClearHistory,
          onAction: () => unawaited(_clearHistory()),
        ),
      );
      for (final ChannelSearchHistoryEntry entry in history.take(5)) {
        entries.add(
          ChannelSearchAutocompleteEntry(
            section: ChannelSearchAutocompleteSection.history,
            label: entry.displayText,
            historyText: entry.displayText,
          ),
        );
      }
    }
    return entries;
  }

  List<ChannelSearchAutocompleteEntry> _userEntries() {
    return _userResults.map((Member member) {
      final String tag = formatChannelSearchUserTag(
        member.username,
        _userDiscriminators[member.id],
      );
      return ChannelSearchAutocompleteEntry(
        section: ChannelSearchAutocompleteSection.users,
        label: memberDisplayLabel(member),
        subtitle: tag,
        userId: member.id,
        avatarImageUrl: FluxerMediaUrl.userAvatar(
          userId: member.id,
          hash: member.avatar,
        ),
        avatarColor: member.avatarColor,
        value: member.username,
      );
    }).toList();
  }

  List<ChannelSearchAutocompleteEntry> _channelEntries() {
    final String? guildId = widget.guildId;
    if (guildId == null) {
      return const <ChannelSearchAutocompleteEntry>[];
    }
    final String query = _activeFilter == null
        ? ''
        : _currentWord().substring(_activeFilter!.syntaxLabel.length);
    final List<ChannelCategory> categories = ref
        .read(channelListViewModelProvider)
        .categories;
    final List<Channel> channels = <Channel>[
      for (final ChannelCategory category in categories)
        ...category.channels.where(
          (Channel channel) =>
              channel.type == ChannelType.guildText ||
              channel.type == ChannelType.guildVoice,
        ),
    ];
    final String normalized = query.toLowerCase();
    final Iterable<Channel> matches = channels.where(
      (Channel channel) =>
          normalized.isEmpty || channel.name.toLowerCase().contains(normalized),
    );
    return matches
        .take(12)
        .map(
          (Channel channel) => ChannelSearchAutocompleteEntry(
            section: ChannelSearchAutocompleteSection.channels,
            label: channel.name,
            channelType: channel.type,
            channelId: channel.id,
            value: channel.name,
          ),
        )
        .toList();
  }

  List<ChannelSearchAutocompleteEntry> _valueEntries(FluxerLocalizations l10n) {
    final ChannelSearchFilterOption? filter = _activeFilter;
    if (filter == null) {
      return const <ChannelSearchAutocompleteEntry>[];
    }
    final String query = _currentWord().substring(filter.syntaxLabel.length);
    final String normalized = query.toLowerCase();

    if (_normalizedFilterKey(filter.key) == 'has') {
      return kChannelSearchHasContentFilters
          .where((MessageSearchContentFilter contentFilter) {
            final String label = channelSearchContentLabel(l10n, contentFilter);
            final String value = channelSearchHasValueForContentFilter(
              contentFilter,
            );
            return normalized.isEmpty ||
                label.toLowerCase().contains(normalized) ||
                value.contains(normalized);
          })
          .map(
            (MessageSearchContentFilter contentFilter) =>
                ChannelSearchAutocompleteEntry(
                  section: ChannelSearchAutocompleteSection.filterValues,
                  label: channelSearchContentLabel(l10n, contentFilter),
                  subtitle: channelSearchContentDescription(
                    l10n,
                    contentFilter,
                  ),
                  value: channelSearchHasValueForContentFilter(contentFilter),
                  useValueLayout: true,
                ),
          )
          .toList();
    }

    final List<String>? values = filter.values;
    if (values == null) {
      return const <ChannelSearchAutocompleteEntry>[];
    }
    return values
        .where(
          (String value) =>
              normalized.isEmpty || value.toLowerCase().contains(normalized),
        )
        .map(
          (String value) => ChannelSearchAutocompleteEntry(
            section: ChannelSearchAutocompleteSection.filterValues,
            label: value,
            value: value,
            useValueLayout: true,
            isDefault:
                (filter.key == 'sort' && value == 'timestamp') ||
                (filter.key == 'order' && value == 'desc') ||
                (filter.key == 'pinned' && value == 'false'),
          ),
        )
        .toList();
  }

  List<ChannelSearchAutocompleteEntry> _dateEntries() {
    final DateTime now = DateTime.now();
    final String query = _activeFilter == null
        ? ''
        : _currentWord()
              .substring(_activeFilter!.syntaxLabel.length)
              .toLowerCase();
    final List<ChannelSearchAutocompleteEntry> entries =
        <ChannelSearchAutocompleteEntry>[
          ChannelSearchAutocompleteEntry(
            section: ChannelSearchAutocompleteSection.dates,
            label: 'Today',
            value: formatChannelSearchDate(now),
            icon: PhosphorIconsFill.calendar,
          ),
          ChannelSearchAutocompleteEntry(
            section: ChannelSearchAutocompleteSection.dates,
            label: 'Yesterday',
            value: formatChannelSearchDate(
              now.subtract(const Duration(days: 1)),
            ),
            icon: PhosphorIconsFill.calendar,
          ),
        ];
    if (query.isEmpty) {
      return entries;
    }
    return entries
        .where(
          (ChannelSearchAutocompleteEntry entry) =>
              entry.label.toLowerCase().contains(query) ||
              (entry.value?.toLowerCase().contains(query) ?? false),
        )
        .toList();
  }

  void _showOverlayIfNeeded() {
    final List<ChannelSearchAutocompleteEntry> entries = _buildEntries();
    if (entries.isEmpty) {
      _hideOverlay();
      return;
    }
    _updateAutocompletePlacement();
    if (!_overlayController.isShowing) {
      _overlayController.show();
      _animationController.forward(from: 0);
    }
    setState(() {});
  }

  void _hideOverlay() {
    if (_overlayController.isShowing) {
      unawaited(
        _animationController.reverse().then((_) {
          if (mounted && _overlayController.isShowing) {
            _overlayController.hide();
          }
        }),
      );
    }
  }

  List<int> _selectableEntryIndices(
    List<ChannelSearchAutocompleteEntry> entries,
  ) {
    final List<int> indices = <int>[];
    for (int i = 0; i < entries.length; i++) {
      if (entries[i].selectable) {
        indices.add(i);
      }
    }
    return indices;
  }

  void _updateAutocompletePlacement() {
    const double gap = 8;
    const double margin = 12;
    const double flipThreshold = 240;
    const double preferredWidth =
        ChannelHeaderSearchAutocomplete.absoluteMaxWidth;

    final MediaQueryData media = MediaQuery.of(context);
    final double screenTop = media.padding.top + margin;
    final double screenBottom =
        media.size.height - media.padding.bottom - margin;
    final double screenLeft = media.padding.left + margin;
    final double screenRight = media.size.width - media.padding.right - margin;

    final BuildContext? anchorContext = _searchAnchorKey.currentContext;
    if (anchorContext == null) {
      _openAutocompleteUpward = false;
      _alignAutocompleteRight = true;
      return;
    }
    final RenderBox? anchor = anchorContext.findRenderObject() as RenderBox?;
    if (anchor == null || !anchor.hasSize) {
      _openAutocompleteUpward = false;
      _alignAutocompleteRight = true;
      return;
    }

    final Offset anchorOrigin = anchor.localToGlobal(Offset.zero);
    final double anchorTop = anchorOrigin.dy;
    final double anchorBottom = anchorTop + anchor.size.height;
    final double anchorLeft = anchorOrigin.dx;
    final double anchorRight = anchorLeft + anchor.size.width;
    final double spaceBelow = screenBottom - anchorBottom - gap;
    final double spaceAbove = anchorTop - screenTop - gap;
    final double spaceRight = screenRight - anchorLeft - gap;
    final double spaceLeft = anchorRight - screenLeft - gap;
    _openAutocompleteUpward =
        spaceBelow < flipThreshold && spaceAbove > spaceBelow;
    _alignAutocompleteRight =
        spaceLeft >= preferredWidth || spaceLeft >= spaceRight;
  }

  double _availableAutocompleteHeight(BuildContext context) {
    const double gap = 8;
    const double margin = 12;
    const double absoluteMax =
        ChannelHeaderSearchAutocomplete.absoluteMaxHeight;

    final MediaQueryData media = MediaQuery.of(context);
    final double screenTop = media.padding.top + margin;
    final double screenBottom =
        media.size.height - media.padding.bottom - margin;

    final BuildContext? anchorContext = _searchAnchorKey.currentContext;
    if (anchorContext == null) {
      return math.min(absoluteMax, media.size.height * 0.55);
    }
    final RenderBox? anchor = anchorContext.findRenderObject() as RenderBox?;
    if (anchor == null || !anchor.hasSize) {
      return math.min(absoluteMax, media.size.height * 0.55);
    }

    final double anchorTop = anchor.localToGlobal(Offset.zero).dy;
    final double anchorBottom = anchorTop + anchor.size.height;
    final double available = _openAutocompleteUpward
        ? anchorTop - screenTop - gap
        : screenBottom - anchorBottom - gap;
    if (available <= 0) {
      return math.min(absoluteMax, media.size.height * 0.4);
    }
    return math.min(absoluteMax, available);
  }

  double _availableAutocompleteWidth(BuildContext context) {
    const double gap = 8;
    const double margin = 12;
    const double absoluteMax = ChannelHeaderSearchAutocomplete.absoluteMaxWidth;
    const double absoluteMin = ChannelHeaderSearchAutocomplete.absoluteMinWidth;

    final MediaQueryData media = MediaQuery.of(context);
    final double screenLeft = media.padding.left + margin;
    final double screenRight = media.size.width - media.padding.right - margin;

    final BuildContext? anchorContext = _searchAnchorKey.currentContext;
    if (anchorContext == null) {
      return absoluteMax;
    }
    final RenderBox? anchor = anchorContext.findRenderObject() as RenderBox?;
    if (anchor == null || !anchor.hasSize) {
      return absoluteMax;
    }

    final Offset anchorOrigin = anchor.localToGlobal(Offset.zero);
    final double anchorLeft = anchorOrigin.dx;
    final double anchorRight = anchorLeft + anchor.size.width;
    final double available = _alignAutocompleteRight
        ? anchorRight - screenLeft - gap
        : screenRight - anchorLeft - gap;
    if (available <= 0) {
      return absoluteMin;
    }
    return math.min(absoluteMax, available).clamp(160, absoluteMax);
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.escape) {
      if (_controller.text.trim().isNotEmpty) {
        _clearSearch();
        return KeyEventResult.handled;
      }
      _focusNode.unfocus();
      return KeyEventResult.handled;
    }

    final List<ChannelSearchAutocompleteEntry> entries = _buildEntries();
    final List<int> selectableIndices = _selectableEntryIndices(entries);
    final int total = selectableIndices.length;

    if (event.logicalKey == LogicalKeyboardKey.arrowDown && total > 0) {
      setState(() {
        final int currentPos = selectableIndices.indexOf(_selectedIndex);
        final int nextPos = currentPos < 0 ? 0 : (currentPos + 1) % total;
        _selectedIndex = selectableIndices[nextPos];
        _hasNavigated = true;
      });
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp && total > 0) {
      setState(() {
        final int currentPos = selectableIndices.indexOf(_selectedIndex);
        final int nextPos = currentPos <= 0 ? total - 1 : currentPos - 1;
        _selectedIndex = selectableIndices[nextPos];
        _hasNavigated = true;
      });
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.enter) {
      if (total > 0 && _selectedIndex >= 0) {
        final ChannelSearchAutocompleteEntry entry = entries[_selectedIndex];
        if (_hasNavigated ||
            entry.section == ChannelSearchAutocompleteSection.users ||
            entry.section == ChannelSearchAutocompleteSection.channels) {
          _applyEntry(entry);
          return KeyEventResult.handled;
        }
      }
      unawaited(_submitSearch());
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.tab && total > 0) {
      setState(() {
        _autocompleteMode = _ChannelSearchAutocompleteMode.none;
        _activeFilter = null;
        _selectedIndex = -1;
      });
      _hideOverlay();
      return KeyEventResult.ignored;
    }
    return KeyEventResult.ignored;
  }

  void _applyEntry(ChannelSearchAutocompleteEntry entry) {
    switch (entry.section) {
      case ChannelSearchAutocompleteSection.filters:
        _insertFilter(entry.filterKey ?? entry.label);
      case ChannelSearchAutocompleteSection.history:
        if (entry.historyText != null) {
          final ChannelSearchHistoryEntry? historyEntry =
              _historyEntryForDisplayText(entry.historyText!);
          _controller.text = entry.historyText!;
          _userIdsByTag
            ..clear()
            ..addAll(historyEntry?.usersByTag ?? const <String, String>{});
          _channelIdsByName
            ..clear()
            ..addAll(historyEntry?.channelsByName ?? const <String, String>{});
          _publishDisplayText(entry.historyText!);
          if (historyEntry != null) {
            ref.read(channelHeaderSearchProvider.notifier)
              ..setScope(
                MessageSearchScopeFilter.values[historyEntry.scopeIndex],
              )
              ..setSort(MessageSearchSortFilter.values[historyEntry.sortIndex]);
          }
          unawaited(_submitSearch());
        }
      case ChannelSearchAutocompleteSection.users:
        _insertFilterValue(
          filterKey: _activeFilter?.key ?? 'from',
          value: entry.value ?? entry.label,
          userId: entry.userId,
          userTagAlias: entry.subtitle,
        );
      case ChannelSearchAutocompleteSection.channels:
        _insertFilterValue(
          filterKey: 'in',
          value: entry.value ?? entry.label,
          channelId: entry.channelId,
        );
      case ChannelSearchAutocompleteSection.filterValues:
        _insertFilterValue(
          filterKey: _activeFilter?.key ?? 'has',
          value: entry.value ?? entry.label,
        );
      case ChannelSearchAutocompleteSection.dates:
        _insertFilterValue(
          filterKey: _activeFilter?.key ?? 'before',
          value: entry.value ?? entry.label,
        );
    }
    setState(() {
      _selectedIndex = -1;
      _hasNavigated = false;
      _suppressAutoOpen =
          entry.section == ChannelSearchAutocompleteSection.history;
    });
    _updateAutocompleteMode();
    _showOverlayIfNeeded();
  }

  ChannelSearchHistoryEntry? _historyEntryForDisplayText(String displayText) {
    final String contextKey = channelSearchContextKey(
      channelId: widget.channelId,
      guildId: widget.guildId,
    );
    final ChannelSearchHistoryRepository? repo = ref
        .read(channelSearchHistoryRepositoryProvider)
        .value;
    if (repo == null) {
      return null;
    }
    for (final ChannelSearchHistoryEntry entry in repo.readForContext(
      contextKey,
    )) {
      if (entry.displayText == displayText) {
        return entry;
      }
    }
    return null;
  }

  void _insertFilter(String filterKey) {
    final ChannelSearchFilterOption? option = channelSearchFilterOptionForKey(
      filterKey,
    );
    if (option == null) {
      return;
    }
    _replaceCurrentWord(
      '${option.syntaxLabel}${option.requiresValue ? '' : ' '}',
    );
    if (!option.requiresValue) {
      unawaited(_submitSearch());
    }
  }

  void _insertFilterValue({
    required String filterKey,
    required String value,
    String? userId,
    String? channelId,
    String? userTagAlias,
  }) {
    final bool needsQuotes = value.contains(' ');
    final String display = needsQuotes ? '"$value"' : value;
    _replaceCurrentWord('$filterKey:$display ');
    if (userId != null) {
      _userIdsByTag[value] = userId;
      if (userTagAlias != null &&
          userTagAlias.isNotEmpty &&
          userTagAlias != value) {
        _userIdsByTag[userTagAlias] = userId;
      }
    }
    if (channelId != null) {
      _channelIdsByName[value] = channelId;
    }
    if (filterKey == 'has' ||
        _normalizedFilterKey(filterKey) == 'from' ||
        _normalizedFilterKey(filterKey) == 'mentions' ||
        isDateFilterKey(_normalizedFilterKey(filterKey)) ||
        channelSearchFilterHasPredefinedValues(
          _normalizedFilterKey(filterKey),
        )) {
      unawaited(_submitSearch());
    }
  }

  void _replaceCurrentWord(String replacement) {
    applySearchTextEdit(_controller, replacement: replacement);
    _updateAutocompleteMode();
    setState(() => _hasNavigated = false);
  }

  List<ChannelSearchSegment> _resolvedSegments() {
    final List<ChannelSearchSegment> segments = ref
        .read(channelHeaderSearchProvider)
        .segments;
    return segments.map((ChannelSearchSegment segment) {
      if (segment.type == ChannelSearchSegmentType.user) {
        final String? id = _userIdsByTag[segment.display];
        if (id != null) {
          return ChannelSearchSegment(
            type: segment.type,
            filterKey: segment.filterKey,
            display: segment.display,
            id: id,
            rawValue: segment.rawValue,
          );
        }
      }
      if (segment.type == ChannelSearchSegmentType.channel) {
        final String? id = _channelIdsByName[segment.display];
        if (id != null) {
          return ChannelSearchSegment(
            type: segment.type,
            filterKey: segment.filterKey,
            display: segment.display,
            id: id,
            rawValue: segment.rawValue,
          );
        }
      }
      return segment;
    }).toList();
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

  String? _resolveUserFromLoaded({
    required String tag,
    required List<Member> members,
    required Map<String, String> discriminators,
  }) {
    return resolveUserIdByTag(
      tag,
      members: members,
      discriminators: discriminators,
    );
  }

  Future<ChannelSearchParseContext> _parseContext() async {
    List<Member> members = _userResults;
    Map<String, String> discriminators = _userDiscriminators;
    try {
      final String? guildId = widget.guildId;
      if (guildId != null) {
        final GuildMentionMemberSearch search = ref.read(
          guildMentionMemberSearchProvider,
        );
        members = await search.cachedMembersAfterGatewayQueries(
          guildId: guildId,
          queries: channelSearchUserFilterValues(_controller.text),
        );
        discriminators = await search.discriminatorsFor(members);
      } else {
        final ({List<Member> members, Map<String, String> discriminators})
        loaded = await _loadSearchUsers('', limit: 50);
        members = loaded.members;
        discriminators = loaded.discriminators;
      }
    } on Object {
      members = _userResults;
      discriminators = _userDiscriminators;
    }
    return ChannelSearchParseContext(
      guildId: widget.guildId,
      currentUserId: ref.read(currentUserIdProvider),
      resolveChannelByName: _resolveChannelName,
      resolveUserByTag: (String tag) => _resolveUserFromLoaded(
        tag: tag,
        members: members,
        discriminators: discriminators,
      ),
    );
  }

  Future<void> _submitSearch() async {
    final ChannelSearchParseHints hints = buildChannelSearchHintsFromSegments(
      _resolvedSegments(),
      usersByTag: _userIdsByTag,
      channelsByName: _channelIdsByName,
    );
    final MessageSearchQuery query = MessageSearchQuery.build(
      channelId: widget.channelId,
      guildId: widget.guildId,
      rawQuery: _controller.text,
      uiScope: _effectiveScope,
      uiSort: _effectiveSort,
      hints: hints,
      context: await _parseContext(),
    );
    if (!query.hasSearchTerms) {
      return;
    }

    ref
        .read(channelHeaderSearchProvider.notifier)
        .activateSearch(channelId: widget.channelId, guildId: widget.guildId);
    await ref
        .read(channelSearchProvider(widget.channelId, widget.guildId).notifier)
        .search(query: query);

    final AsyncValue<ChannelSearchHistoryRepository> repoAsync = ref.read(
      channelSearchHistoryRepositoryProvider,
    );
    final ChannelSearchHistoryRepository? repo = repoAsync.value;
    if (repo != null) {
      await repo.addEntry(
        ChannelSearchHistoryEntry(
          contextKey: channelSearchContextKey(
            channelId: widget.channelId,
            guildId: widget.guildId,
          ),
          displayText: _controller.text,
          authorId: query.authorId,
          scopeIndex: _effectiveScope.index,
          sortIndex: _effectiveSort.index,
          contentTypeIndices: query.contentTypes
              .map((MessageSearchContentFilter f) => f.index)
              .toList(),
          timestampMs: DateTime.now().millisecondsSinceEpoch,
          usersByTag: Map<String, String>.from(_userIdsByTag),
          channelsByName: Map<String, String>.from(_channelIdsByName),
        ),
      );
    }

    setState(() {
      _suppressAutoOpen = true;
      _autocompleteMode = _ChannelSearchAutocompleteMode.none;
    });
    _hideOverlay();
  }

  Future<void> _clearHistory() async {
    final AsyncValue<ChannelSearchHistoryRepository> repoAsync = ref.read(
      channelSearchHistoryRepositoryProvider,
    );
    final ChannelSearchHistoryRepository? repo = repoAsync.value;
    if (repo == null) {
      return;
    }
    await repo.clearForContext(
      channelSearchContextKey(
        channelId: widget.channelId,
        guildId: widget.guildId,
      ),
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _selectedIndex = -1;
      _hasNavigated = false;
    });
    _updateAutocompleteMode();
    _showOverlayIfNeeded();
  }

  void _clearSearch() {
    _controller.clear();
    _userIdsByTag.clear();
    _channelIdsByName.clear();
    ref.read(channelHeaderSearchProvider.notifier)
      ..updateDisplayText('')
      ..closeSearch();
    unawaited(
      ref
          .read(
            channelSearchProvider(widget.channelId, widget.guildId).notifier,
          )
          .search(text: ''),
    );
    setState(() {
      _suppressAutoOpen = false;
      _selectedIndex = -1;
    });
  }

  Future<void> _openScopeMenu() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<MessageSearchScopeFilter> options = channelSearchScopeOptions(
      isGuildChannel: _isGuildChannel,
    );
    final MessageSearchScopeFilter? selected =
        await FluxerBottomSheet.show<MessageSearchScopeFilter>(
          context,
          title: l10n.channelDetailsSearchIn,
          builder: (BuildContext sheetContext, VoidCallback close) {
            return FluxerBottomSheetContent(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  for (final MessageSearchScopeFilter value
                      in options) ...<Widget>[
                    ListTile(
                      leading: PhosphorIcon(channelSearchScopeIcon(value)),
                      title: Text(
                        channelSearchScopeLabel(
                          l10n,
                          value,
                          isGuildChannel: _isGuildChannel,
                        ),
                      ),
                      subtitle: Text(
                        channelSearchScopeDescription(
                          l10n,
                          value,
                          isGuildChannel: _isGuildChannel,
                        ),
                      ),
                      selected: _effectiveScope == value,
                      onTap: () => Navigator.of(sheetContext).pop(value),
                    ),
                  ],
                ],
              ),
            );
          },
        );
    if (selected != null) {
      ref.read(channelHeaderSearchProvider.notifier).setScope(selected);
      if (_controller.text.trim().isNotEmpty ||
          queryFromControllerHasTerms() ||
          ref.read(channelHeaderSearchProvider).isActive) {
        unawaited(_submitSearch());
      }
    }
  }

  bool queryFromControllerHasTerms() {
    if (_controller.text.trim().isEmpty) {
      return false;
    }
    final MessageSearchQuery query = MessageSearchQuery.build(
      channelId: widget.channelId,
      guildId: widget.guildId,
      rawQuery: _controller.text,
      uiScope: _effectiveScope,
      uiSort: _effectiveSort,
      hints: buildChannelSearchHintsFromSegments(
        _resolvedSegments(),
        usersByTag: _userIdsByTag,
        channelsByName: _channelIdsByName,
      ),
      context: ChannelSearchParseContext(
        guildId: widget.guildId,
        currentUserId: ref.read(currentUserIdProvider),
        resolveChannelByName: _resolveChannelName,
        resolveUserByTag: (String tag) => resolveUserIdByTag(
          tag,
          members: _userResults,
          discriminators: _userDiscriminators,
        ),
      ),
    );
    return query.hasSearchTerms;
  }

  _SearchFieldColors _colors(BuildContext context) {
    if (!widget.highContrast) {
      return _SearchFieldColors(
        border: context.colors.backgroundModifierAccent,
        borderFocused: context.colors.backgroundModifierAccentFocus,
        background: context.colors.backgroundTextarea,
        icon: context.colors.textTertiary,
        text: context.colors.textPrimary,
        placeholder: context.colors.textTertiary,
        badgeBackground: context.colors.backgroundSecondary,
        badgeBorder: context.colors.backgroundModifierAccent,
        badgeIcon: context.colors.textPrimaryMuted,
        clear: context.colors.textTertiary,
        clearHoverBackground: context.colors.backgroundModifierHover,
        clearHover: context.colors.textPrimary,
      );
    }
    return const _SearchFieldColors(
      border: Color(0x73FFFFFF),
      borderFocused: Color(0xB8FFFFFF),
      background: Color(0x0FFFFFFF),
      icon: Colors.white,
      text: Colors.white,
      placeholder: Color(0xE6FFFFFF),
      badgeBackground: Color(0x29FFFFFF),
      badgeBorder: Color(0x6BFFFFFF),
      badgeIcon: Colors.white,
      clear: Colors.white,
      clearHoverBackground: Color(0x33FFFFFF),
      clearHover: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    ref.watch(channelHeaderSearchProvider);
    final bool touchPrimary = isTouchPrimaryInput(ref);
    final _SearchFieldColors colors = _colors(context);
    final List<ChannelSearchAutocompleteEntry> entries = _buildEntries();
    final int selectedIndex = _hasNavigated ? _selectedIndex : -1;
    final MessageSearchScopeFilter scope = _effectiveScope;

    if (entries.isNotEmpty && _focusNode.hasFocus) {
      _updateAutocompletePlacement();
    }

    final Widget autocomplete = ChannelHeaderSearchAutocomplete(
      entries: entries,
      selectedIndex: selectedIndex,
      listboxId: _listboxId,
      touchPrimary: touchPrimary,
      maxHeight: _availableAutocompleteHeight(context),
      maxWidth: _availableAutocompleteWidth(context),
      onEntrySelected: _applyEntry,
      onEntryHover: (int index) => setState(() {
        _selectedIndex = index;
        _hasNavigated = true;
      }),
    );

    final Widget searchField = CompositedTransformTarget(
      key: _searchAnchorKey,
      link: _layerLink,
      child: SizedBox(
        width: kChannelHeaderSearchFieldWidth,
        child: AnimatedContainer(
          duration: context.motion.fast,
          constraints: const BoxConstraints(minHeight: 36),
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _focusNode.hasFocus ? colors.borderFocused : colors.border,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Row(
            children: <Widget>[
              _ScopeButton(
                colors: colors,
                scopeIcon: channelSearchScopeIcon(scope),
                scopeLabel: channelSearchScopeLabel(
                  l10n,
                  scope,
                  isGuildChannel: _isGuildChannel,
                ),
                onTap: () => unawaited(_openScopeMenu()),
              ),
              Expanded(child: _buildEditableField(context, l10n, colors)),
              if (_controller.text.isNotEmpty)
                _ClearSearchButton(colors: colors, onPressed: _clearSearch),
            ],
          ),
        ),
      ),
    );

    return OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder: (BuildContext context) {
        if (entries.isEmpty) {
          return const SizedBox.shrink();
        }
        return Stack(
          children: <Widget>[
            Positioned.fill(
              child: FluxerGestureDetector(
                onTap: _hideOverlay,
                behavior: HitTestBehavior.opaque,
                child: const ColoredBox(color: Colors.transparent),
              ),
            ),
            CompositedTransformFollower(
              link: _layerLink,
              targetAnchor: _openAutocompleteUpward
                  ? (_alignAutocompleteRight
                        ? Alignment.topRight
                        : Alignment.topLeft)
                  : (_alignAutocompleteRight
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft),
              followerAnchor: _openAutocompleteUpward
                  ? (_alignAutocompleteRight
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft)
                  : (_alignAutocompleteRight
                        ? Alignment.topRight
                        : Alignment.topLeft),
              offset: Offset(0, _openAutocompleteUpward ? -8 : 8),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Align(
                  alignment: _alignAutocompleteRight
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  child: TextFieldTapRegion(child: autocomplete),
                ),
              ),
            ),
          ],
        );
      },
      child: searchField,
    );
  }

  Widget _buildEditableField(
    BuildContext context,
    FluxerLocalizations l10n,
    _SearchFieldColors colors,
  ) {
    return FluxerClipboardScope(
      controller: _controller,
      focusNode: _focusNode,
      builder:
          (
            BuildContext context,
            FluxerClipboardScopeState clipboardScope,
            FocusNode focusNode,
          ) {
            return TextField(
              controller: _controller,
              focusNode: focusNode,
              textAlignVertical: TextAlignVertical.center,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.text,
                fontSize: 14,
                height: 1.25,
              ),
              decoration: InputDecoration(
                isDense: true,
                filled: false,
                hintText: l10n.channelDetailsSearchHint,
                hintStyle: context.textStyles.bodySmall.copyWith(
                  color: colors.placeholder,
                  fontSize: 14,
                  height: 1.25,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              ),
              textInputAction: TextInputAction.search,
              contextMenuBuilder: clipboardScope.buildContextMenu,
              onTap: () {
                setState(() => _suppressAutoOpen = false);
                _updateAutocompleteMode();
                _showOverlayIfNeeded();
              },
              onSubmitted: (_) => unawaited(_submitSearch()),
            );
          },
    );
  }
}

class _SearchFieldColors {
  const _SearchFieldColors({
    required this.border,
    required this.borderFocused,
    required this.background,
    required this.icon,
    required this.text,
    required this.placeholder,
    required this.badgeBackground,
    required this.badgeBorder,
    required this.badgeIcon,
    required this.clear,
    required this.clearHoverBackground,
    required this.clearHover,
  });

  final Color border;
  final Color borderFocused;
  final Color background;
  final Color icon;
  final Color text;
  final Color placeholder;
  final Color badgeBackground;
  final Color badgeBorder;
  final Color badgeIcon;
  final Color clear;
  final Color clearHoverBackground;
  final Color clearHover;
}

class _ScopeButton extends StatefulWidget {
  const _ScopeButton({
    required this.colors,
    required this.scopeIcon,
    required this.scopeLabel,
    required this.onTap,
  });

  final _SearchFieldColors colors;
  final IconData scopeIcon;
  final String scopeLabel;
  final VoidCallback onTap;

  @override
  State<_ScopeButton> createState() => _ScopeButtonState();
}

class _ScopeButtonState extends State<_ScopeButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final Color iconColor = _hovered
        ? widget.colors.clearHover
        : widget.colors.icon;
    final Color badgeIconColor = _hovered
        ? widget.colors.clearHover
        : widget.colors.badgeIcon;

    final Widget button = Semantics(
      button: true,
      label: widget.scopeLabel,
      child: Tooltip(
        message: widget.scopeLabel,
        child: Material(
          color: _hovered
              ? widget.colors.clearHoverBackground
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            onTap: widget.onTap,
            onHover: (bool hovered) => setState(() => _hovered = hovered),
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SizedBox(
                width: 16,
                height: 16,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    PhosphorIcon(
                      PhosphorIconsFill.magnifyingGlass,
                      size: 16,
                      color: iconColor,
                    ),
                    Positioned(
                      left: -4,
                      bottom: -4,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: widget.colors.badgeBackground,
                          border: Border.all(color: widget.colors.badgeBorder),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: SizedBox(
                          width: 12,
                          height: 12,
                          child: Center(
                            child: PhosphorIcon(
                              widget.scopeIcon,
                              size: 8,
                              color: badgeIconColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    return button;
  }
}

class _ClearSearchButton extends StatefulWidget {
  const _ClearSearchButton({required this.colors, required this.onPressed});

  final _SearchFieldColors colors;
  final VoidCallback onPressed;

  @override
  State<_ClearSearchButton> createState() => _ClearSearchButtonState();
}

class _ClearSearchButtonState extends State<_ClearSearchButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final Widget button = Material(
      color: _hovered ? widget.colors.clearHoverBackground : Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: widget.onPressed,
        onHover: (bool hovered) => setState(() => _hovered = hovered),
        borderRadius: BorderRadius.circular(6),
        child: SizedBox(
          width: 24,
          height: 24,
          child: Center(
            child: PhosphorIcon(
              PhosphorIconsBold.x,
              size: 14,
              color: _hovered ? widget.colors.clearHover : widget.colors.clear,
            ),
          ),
        ),
      ),
    );
    return button;
  }
}
