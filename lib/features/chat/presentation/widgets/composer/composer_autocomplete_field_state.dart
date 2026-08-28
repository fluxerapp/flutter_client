part of 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';

const int _kRoleMentionLimit = 10;
const int _kChannelLimit = 10;
const int _kEmojiLimit = 10;
const int _kAutocompleteTypingDebounceMs = 300;
const Duration _kAutocompleteFadeDuration = FluxerMotionTheme.fastDuration;

String _composerMentionAutocompleteRightLabel(
  Member member,
  Map<String, String>? discriminatorByUserId,
) {
  final String? disc = discriminatorByUserId?[member.id];
  final String username = member.username;
  if (disc != null && disc.isNotEmpty && disc != '0') {
    return '$username#$disc';
  }
  return username;
}

class _ComposerRow {
  _ComposerRow({
    required this.title,
    required this.onApply,
    this.subtitle,
    this.mentionMember,
    this.titleColor,
    this.channelRowType,
    this.emojiSurrogates,
    this.emojiImageUrl,
    this.emojiCacheKey,
    this.mediaPreviewUrl,
    this.mediaPreviewCacheKey,
    this.gif,
    this.isDivider = false,
  }) : isSectionHeading = false;

  final String title;
  final VoidCallback onApply;
  final String? subtitle;
  final Member? mentionMember;
  final Color? titleColor;
  final ChannelType? channelRowType;
  final String? emojiSurrogates;
  final String? emojiImageUrl;
  final String? emojiCacheKey;
  final String? mediaPreviewUrl;
  final String? mediaPreviewCacheKey;
  final GifPickerGif? gif;
  final bool isDivider;
  final bool isSectionHeading;
}

class ComposerAutocompleteFieldState
    extends ConsumerState<ComposerAutocompleteField>
    with SingleTickerProviderStateMixin {
  final List<_ComposerRow> _rows = <_ComposerRow>[];
  int _selectedIndex = 0;
  int _syncGeneration = 0;
  Timer? _debounce;
  String? _panelHeading;
  bool _gifEmpty = false;

  final LayerLink _layerLink = LayerLink();
  final OverlayPortalController _overlayController = OverlayPortalController();
  final GlobalKey _targetKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  MentionAutocompleteSession? _mentionSession;
  ProviderSubscription<AsyncValue<Map<String, db.Role>>>?
  _guildRolesSubscription;
  String? _guildRolesWatchGuildId;
  ProviderSubscription<ChannelPermissionCaches>? _channelPermissionSubscription;
  String? _channelPermissionWatchChannelId;
  ProviderSubscription<AsyncValue<int>>? _guildMemberCountSubscription;
  String? _guildMemberCountWatchGuildId;
  ViewChannelFilterContext? _viewChannelFilterContext;
  String? _viewChannelFilterContextKey;

  String get _channelId => widget.channelId ?? '';

  bool get _usesInStackPanel =>
      widget.renderMode == AutocompleteRenderMode.inStack;

  ScrollController get _activeScrollController =>
      _usesInStackPanel ? widget.panelScrollController! : _scrollController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _kAutocompleteFadeDuration,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    widget.controller.addListener(_onTextChanged);
    widget.focusNode.addListener(_onFocusChanged);
    widget.slashSession?.addListener(_onSlashSessionChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.duration = context.motion.fast;
  }

  @override
  void didUpdateWidget(ComposerAutocompleteField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onTextChanged);
      widget.controller.addListener(_onTextChanged);
    }
    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode.removeListener(_onFocusChanged);
      widget.focusNode.addListener(_onFocusChanged);
    }
    if (oldWidget.slashSession != widget.slashSession) {
      oldWidget.slashSession?.removeListener(_onSlashSessionChanged);
      widget.slashSession?.addListener(_onSlashSessionChanged);
    }
    if (oldWidget.channelId != widget.channelId) {
      _stopMentionAutocompleteWatches();
      _setRows(const <_ComposerRow>[]);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _stopMentionAutocompleteWatches();
    widget.controller.removeListener(_onTextChanged);
    widget.focusNode.removeListener(_onFocusChanged);
    widget.slashSession?.removeListener(_onSlashSessionChanged);
    _animationController.dispose();
    _scrollController.dispose();
    widget.panelHost?.value = null;
    super.dispose();
  }

  void _onFocusChanged() {
    final ComposerSlashSession? session = widget.slashSession;
    if (session != null &&
        session.isActive &&
        (session.focusedSlot != null || session.optionalHintFocused)) {
      _scheduleSync();
      return;
    }
    if (!widget.focusNode.hasFocus) {
      _stopMentionAutocompleteWatches();
      _setRows(const <_ComposerRow>[]);
    }
  }

  void _onTextChanged() {
    _debounce?.cancel();
    final TextEditingValue editing = widget.controller.value;
    final int? caret = _autocompleteCaretIndex(editing);
    if (caret != null) {
      final ComposerAutocompleteTrigger? trigger =
          ComposerAutocompleteTrigger.detectIfAllowed(
            fullText: editing.text,
            caretIndex: caret,
          );
      if (trigger?.kind == ComposerAutocompleteTriggerKind.mention) {
        _scheduleSync();
        return;
      }
      if (hasOpenMenu) {
        _scheduleSync();
        return;
      }
    }
    _syncGeneration++;
    _debounce = Timer(
      const Duration(milliseconds: _kAutocompleteTypingDebounceMs),
      _scheduleSync,
    );
  }

  static const Set<ComposerAutocompleteTriggerKind> _mentionTriggerKinds =
      <ComposerAutocompleteTriggerKind>{
        ComposerAutocompleteTriggerKind.mention,
        ComposerAutocompleteTriggerKind.commandArgMention,
        ComposerAutocompleteTriggerKind.commandArg,
      };

  ComposerAutocompleteTrigger? _liveMentionTrigger() {
    final ComposerSlashSession? session = widget.slashSession;
    if (session != null &&
        session.isActive &&
        session.focusedSlot?.option.type == ComposerCommandOptionType.user) {
      final String query = _slashSlotQuery(session.focusedSlot!);
      return ComposerAutocompleteTrigger(
        kind: ComposerAutocompleteTriggerKind.commandArg,
        matchStart: 0,
        matchEnd: query.length,
        matchedText: query,
        commandName: normalizeComposerCommandName(session.command?.name),
      );
    }
    final int? caret = _autocompleteCaretIndex(widget.controller.value);
    if (caret == null) {
      return null;
    }
    final ComposerAutocompleteTrigger? trigger =
        ComposerAutocompleteTrigger.detectIfAllowed(
          fullText: widget.controller.text,
          caretIndex: caret,
        );
    if (trigger == null ||
        !_mentionTriggerKinds.contains(trigger.kind) ||
        !widget.allowedTriggers.contains(trigger.kind)) {
      return null;
    }
    return trigger;
  }

  ParsedMentionQuery? _liveMentionParsedQuery() {
    final ComposerAutocompleteTrigger? trigger = _liveMentionTrigger();
    if (trigger == null) {
      return null;
    }
    return parseMentionQuery(trigger.matchedText);
  }

  String? _liveCommandArgName() {
    final ComposerAutocompleteTrigger? trigger = _liveMentionTrigger();
    if (trigger == null) {
      return null;
    }
    if (trigger.kind == ComposerAutocompleteTriggerKind.mention) {
      return null;
    }
    final String name = normalizeComposerCommandName(trigger.commandName);
    return name.isEmpty ? null : name;
  }

  int? _autocompleteCaretIndex(TextEditingValue editing) {
    final TextSelection selection = editing.selection;
    if (selection.isValid) {
      if (selection.isCollapsed) {
        return selection.baseOffset;
      }
      if (editing.composing.isValid && !editing.composing.isCollapsed) {
        return editing.composing.end;
      }
      return selection.extentOffset;
    }
    if (editing.composing.isValid && !editing.composing.isCollapsed) {
      return editing.composing.end;
    }
    return null;
  }

  void _scheduleSync() {
    if (!mounted || !widget.enabled) {
      return;
    }
    final int gen = ++_syncGeneration;
    unawaited(_sync(gen));
  }

  Future<void> _sync(int generation) async {
    if (widget.slashSession != null && widget.slashSession!.isActive) {
      await _syncSlashSession(generation);
      return;
    }
    final TextEditingValue editing = widget.controller.value;
    final int? caret = _autocompleteCaretIndex(editing);
    if (caret == null) {
      if (generation == _syncGeneration) {
        _setRows(const <_ComposerRow>[]);
      }
      return;
    }
    final String full = editing.text;
    final ComposerAutocompleteTrigger? trigger =
        ComposerAutocompleteTrigger.detectIfAllowed(
          fullText: full,
          caretIndex: caret,
        );
    if (generation != _syncGeneration) {
      return;
    }
    if (trigger == null || !widget.allowedTriggers.contains(trigger.kind)) {
      if (widget.slashSession != null && widget.slashSession!.isActive) {
        await _syncSlashSession(generation);
        return;
      }
      _stopMentionAutocompleteWatches();
      _setRows(const <_ComposerRow>[]);
      return;
    }
    switch (trigger.kind) {
      case ComposerAutocompleteTriggerKind.emojiReaction:
        _setRows(const <_ComposerRow>[]);
        return;
      case ComposerAutocompleteTriggerKind.channel:
        await _syncChannels(trigger, generation);
        return;
      case ComposerAutocompleteTriggerKind.mention:
      case ComposerAutocompleteTriggerKind.commandArgMention:
      case ComposerAutocompleteTriggerKind.commandArg:
        await _syncMention(trigger, generation);
        return;
      case ComposerAutocompleteTriggerKind.emoji:
        await _syncEmoji(trigger, generation);
        return;
      case ComposerAutocompleteTriggerKind.command:
        _syncCommands(trigger, generation);
        return;
      case ComposerAutocompleteTriggerKind.gif:
        await _syncGifs(trigger, generation);
        return;
      case ComposerAutocompleteTriggerKind.sticker:
        await _syncStickers(trigger, generation);
        return;
      case ComposerAutocompleteTriggerKind.meme:
        _syncMemes(trigger, generation);
        return;
    }
  }

  Future<int> _channelPermissionBits() async {
    if (_channelId.isEmpty) {
      return 0;
    }
    final bool isDirectChat = isComposerDirectChat(
      channelId: _channelId,
      dmConversations: ref.read(dmViewModelProvider).conversations,
      currentUserId: ref.read(currentUserIdProvider),
    );
    if (isDirectChat) {
      return allPermissions;
    }
    final int? cached = ref.read(channelPermissionCacheProvider)[_channelId];
    if (cached != null) {
      return cached;
    }
    return readEffectiveGuildChannelPermissionBits(
      container: ref.container,
      channelId: _channelId,
    );
  }

  Channel? _guildChannel() {
    return resolveGuildChannel(ref, _channelId);
  }

  void _warmCustomEmoji() {
    // Keep the all-guild custom emoji stream alive (so `_syncEmoji` can read a
    // loaded value) and re-run autocomplete whenever any guild's emoji change.
    ref.listen<AsyncValue<List<GuildEmojiEntry>>>(
      allGuildEmojisForPickerProvider,
      (_, AsyncValue<List<GuildEmojiEntry>> next) {
        if (mounted && next.hasValue) {
          _scheduleSync();
        }
      },
    );
  }

  void _stopMentionAutocompleteWatches() {
    final String? guildId =
        _guildMemberCountWatchGuildId ?? _guildRolesWatchGuildId;
    _stopGuildRolesWatch();
    _stopChannelPermissionWatch();
    _stopGuildMemberCountWatch();
    _clearMentionSessionCaches();
    if (guildId != null && guildId.isNotEmpty) {
      ref.read(guildMentionMemberSearchProvider).cancelGatewaySearch(guildId);
    }
  }

  void _clearMentionSessionCaches() {
    _viewChannelFilterContext = null;
    _viewChannelFilterContextKey = null;
  }

  Future<ViewChannelFilterContext?> _viewChannelFilterContextFor({
    required String guildId,
    required String channelId,
  }) async {
    final String key = '$guildId:$channelId';
    if (_viewChannelFilterContextKey == key &&
        _viewChannelFilterContext != null) {
      return _viewChannelFilterContext;
    }
    final ViewChannelFilterContext? context =
        await loadViewChannelFilterContext(
          database: ref.read(fluxerDatabaseProvider),
          channelId: channelId,
          guildId: guildId,
        );
    if (!mounted) {
      return context;
    }
    _viewChannelFilterContextKey = key;
    _viewChannelFilterContext = context;
    return context;
  }

  void _startMentionAutocompleteWatches({
    required String guildId,
    required String channelId,
  }) {
    prefetchGuildRoles(ref.read(memberRepositoryProvider), guildId);
    _startGuildRolesWatch(guildId);
    _startChannelPermissionWatch(channelId);
    _startGuildMemberCountWatch(guildId);
  }

  void _startGuildMemberCountWatch(String guildId) {
    if (_guildMemberCountWatchGuildId == guildId &&
        _guildMemberCountSubscription != null) {
      return;
    }
    _stopGuildMemberCountWatch();
    _guildMemberCountWatchGuildId = guildId;
    _guildMemberCountSubscription = ref.listenManual(
      guildMemberRowCountProvider(guildId),
      (AsyncValue<int>? previous, AsyncValue<int> next) {
        if (!mounted || !next.hasValue) {
          return;
        }
        if (previous?.value == next.value) {
          return;
        }
        ref.read(guildMentionMemberSearchProvider).invalidateSnapshot(guildId);
        _clearMentionSessionCaches();
        _scheduleSync();
      },
    );
  }

  void _stopGuildMemberCountWatch() {
    _guildMemberCountSubscription?.close();
    _guildMemberCountSubscription = null;
    _guildMemberCountWatchGuildId = null;
  }

  void _startChannelPermissionWatch(String channelId) {
    if (channelId.isEmpty) {
      _stopChannelPermissionWatch();
      return;
    }
    if (_channelPermissionWatchChannelId == channelId &&
        _channelPermissionSubscription != null) {
      return;
    }
    _stopChannelPermissionWatch();
    _channelPermissionWatchChannelId = channelId;
    _channelPermissionSubscription = ref.listenManual(
      channelPermissionCacheProvider,
      (ChannelPermissionCaches? previous, ChannelPermissionCaches next) {
        if (!mounted) {
          return;
        }
        final int? previousBits = previous?[channelId];
        final int? nextBits = next[channelId];
        if (nextBits != null && nextBits != previousBits) {
          _clearMentionSessionCaches();
          _scheduleSync();
        }
      },
    );
    unawaited(
      ref
          .read(channelPermissionCacheProvider.notifier)
          .rebuildChannel(channelId),
    );
  }

  void _stopChannelPermissionWatch() {
    _channelPermissionSubscription?.close();
    _channelPermissionSubscription = null;
    _channelPermissionWatchChannelId = null;
  }

  void _startGuildRolesWatch(String guildId) {
    if (_guildRolesWatchGuildId == guildId && _guildRolesSubscription != null) {
      return;
    }
    _stopGuildRolesWatch();
    _guildRolesWatchGuildId = guildId;
    _guildRolesSubscription = ref
        .listenManual(guildRolesByIdProvider(guildId), (
          AsyncValue<Map<String, db.Role>>? previous,
          AsyncValue<Map<String, db.Role>> next,
        ) {
          if (!mounted || !next.hasValue) {
            return;
          }
          _scheduleSync();
        });
  }

  void _stopGuildRolesWatch() {
    _guildRolesSubscription?.close();
    _guildRolesSubscription = null;
    _guildRolesWatchGuildId = null;
  }

  void _onSlashSessionChanged() {
    _scheduleSync();
  }

  int _firstSelectableRowIndex() {
    for (int i = 0; i < _rows.length; i++) {
      if (!_rows[i].isDivider && !_rows[i].isSectionHeading) {
        return i;
      }
    }
    return 0;
  }

  int _normalizeSelectableIndex(int index) {
    if (_rows.isEmpty) {
      return 0;
    }
    var normalized = index.clamp(0, _rows.length - 1);
    if (_rows[normalized].isDivider || _rows[normalized].isSectionHeading) {
      normalized = _nextSelectableIndex(normalized, 1);
    }
    return normalized;
  }

  int _nextSelectableIndex(int from, int delta) {
    if (_rows.isEmpty) {
      return 0;
    }
    var index = from;
    for (int step = 0; step < _rows.length; step++) {
      index = (index + delta + _rows.length) % _rows.length;
      if (!_rows[index].isDivider && !_rows[index].isSectionHeading) {
        return index;
      }
    }
    return from.clamp(0, _rows.length - 1);
  }

  Future<void> _syncChannels(
    ComposerAutocompleteTrigger trigger,
    int generation,
  ) async {
    final Channel? ch = _guildChannel();
    final String? guildId = ch?.guildId;
    if (guildId == null || guildId.isEmpty) {
      _setRows(const <_ComposerRow>[]);
      return;
    }
    final ChannelListState list = ref.read(channelListViewModelProvider);
    final List<Channel> flat = <Channel>[];
    for (final ChannelCategory cat in list.categories) {
      for (final Channel c in cat.channels) {
        if (!c.isCategory) {
          flat.add(c);
        }
      }
    }
    final String q = trigger.matchedText.toLowerCase();
    List<Channel> filtered = flat;
    if (q.isNotEmpty) {
      filtered = flat
          .where((Channel c) => c.name.toLowerCase().contains(q))
          .toList();
    }
    filtered.sort((Channel a, Channel b) => a.position.compareTo(b.position));
    if (filtered.length > _kChannelLimit) {
      filtered = filtered.sublist(0, _kChannelLimit);
    }
    if (generation != _syncGeneration) {
      return;
    }
    _setRows(
      filtered.map((Channel c) {
        return _ComposerRow(
          title: c.name,
          onApply: () => _applyChannel(c),
          channelRowType: c.type,
        );
      }).toList(),
    );
  }

  Future<void> _syncMention(
    ComposerAutocompleteTrigger trigger,
    int generation,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ParsedMentionQuery parsed = parseMentionQuery(trigger.matchedText);
    final Channel? ch = _guildChannel();
    final String? guildId = ch?.guildId;
    final Map<String, String?> friendNicknameById = friendNicknamesById(
      ref.read(dmViewModelProvider).friendsList,
    );
    if (guildId != null && guildId.isNotEmpty) {
      _startMentionAutocompleteWatches(guildId: guildId, channelId: _channelId);
      ref.read(guildSyncProvider.notifier).syncIfNeeded(guildId);
      final GuildMentionMemberSearch search = ref.read(
        guildMentionMemberSearchProvider,
      );
      final GuildMentionSnapshot snapshot = await search.ensureSnapshot(
        guildId,
      );
      if (generation != _syncGeneration) {
        return;
      }
      final String searchQuery = parsed.usernameQuery.trim();
      await _renderMentionRows(
        generation: generation,
        parsed: parsed,
        guildId: guildId,
        members: snapshot.members,
        remoteSearchMemberIds: search.remoteMemberIdsFor(guildId),
        friendNicknameById: friendNicknameById,
        l10n: l10n,
        discriminators: snapshot.discriminators,
      );
      if (generation != _syncGeneration) {
        return;
      }
      search.scheduleGatewaySearch(
        guildId: guildId,
        query: searchQuery,
        onComplete: () {
          if (mounted) {
            _scheduleSync();
          }
        },
      );
      return;
    }
    _stopMentionAutocompleteWatches();
    final List<Member> members = await _dmMentionMembers();
    if (generation != _syncGeneration) {
      return;
    }
    final Map<String, String> discs = await ref
        .read(guildMentionMemberSearchProvider)
        .discriminatorsFor(members);
    if (generation != _syncGeneration) {
      return;
    }
    final MentionAutocompleteSession stableSession = MentionAutocompleteSession(
      sessionKey: 'dm:${parsed.usernameQuery}',
    );
    final List<Member> ranked = filterGuildMembersForAutocomplete(
      members: members,
      parsed: parsed,
      limit: kMentionResultLimit,
      discriminatorByUserId: discs,
      friendNicknameById: friendNicknameById,
      stableSession: stableSession,
    );
    await _renderMentionRows(
      generation: generation,
      parsed: parsed,
      guildId: null,
      members: ranked,
      remoteSearchMemberIds: const <String>{},
      friendNicknameById: friendNicknameById,
      l10n: l10n,
      discriminators: discs,
    );
  }

  MentionAutocompleteSession _mentionSessionFor(
    String guildId,
    ParsedMentionQuery parsed,
  ) {
    final String sessionKey = '$guildId:${parsed.usernameQuery}';
    if (_mentionSession == null || _mentionSession!.sessionKey != sessionKey) {
      _mentionSession = MentionAutocompleteSession(sessionKey: sessionKey);
    }
    return _mentionSession!;
  }

  Future<void> _renderMentionRows({
    required int generation,
    required ParsedMentionQuery parsed,
    required String? guildId,
    required List<Member> members,
    required Set<String> remoteSearchMemberIds,
    required Map<String, String?> friendNicknameById,
    required FluxerLocalizations l10n,
    Map<String, String>? discriminators,
  }) async {
    if (generation != _syncGeneration) {
      return;
    }
    final ParsedMentionQuery? liveParsed = _liveMentionParsedQuery();
    if (liveParsed == null) {
      if (generation == _syncGeneration) {
        _setRows(const <_ComposerRow>[]);
      }
      return;
    }
    final ParsedMentionQuery activeParsed = liveParsed;
    final Map<String, String> discs =
        discriminators ??
        await ref
            .read(guildMentionMemberSearchProvider)
            .discriminatorsFor(members);
    if (generation != _syncGeneration) {
      return;
    }
    final MentionAutocompleteSession? stableSession =
        guildId != null && guildId.isNotEmpty
        ? _mentionSessionFor(guildId, activeParsed)
        : null;
    List<Member> ranked = filterGuildMembersForAutocomplete(
      members: members,
      parsed: activeParsed,
      limit: kMentionMemberSearchLimit,
      discriminatorByUserId: discs,
      friendNicknameById: friendNicknameById,
      stableSession: stableSession,
      prioritizeMemberIds: remoteSearchMemberIds.isEmpty
          ? null
          : remoteSearchMemberIds,
    );
    final String? commandArgName = _liveCommandArgName();
    final Permission? managePermission = managePermissionForCommand(
      commandArgName,
    );
    final bool isCommandArg = commandArgName != null;
    if (managePermission != null && (guildId == null || guildId.isEmpty)) {
      ranked = const <Member>[];
    }
    final bool filterByViewChannel =
        guildId != null && guildId.isNotEmpty && managePermission == null;
    if (filterByViewChannel) {
      final ViewChannelFilterContext? viewChannelContext =
          await _viewChannelFilterContextFor(
            guildId: guildId,
            channelId: _channelId,
          );
      if (generation != _syncGeneration) {
        return;
      }
      if (viewChannelContext != null) {
        ranked = filterMembersByViewChannelWithContext(
          context: viewChannelContext,
          guildId: guildId,
          members: ranked,
          assumeVisibleForUserIds: remoteSearchMemberIds,
        );
      }
    }
    if (managePermission != null && guildId != null && guildId.isNotEmpty) {
      ranked = await _filterManageableCommandMembers(
        guildId: guildId,
        members: ranked,
        allMembers: members,
        permission: managePermission,
      );
      if (generation != _syncGeneration) {
        return;
      }
    }
    if (ranked.length > kMentionResultLimit) {
      ranked = ranked.sublist(0, kMentionResultLimit);
    }
    if (generation != _syncGeneration) {
      return;
    }
    final List<_ComposerRow> memberRows = ranked
        .map(
          (Member m) => _ComposerRow(
            title: memberDisplayLabel(
              m,
              friendNickname: friendNicknameById[m.id],
            ),
            subtitle: _composerMentionAutocompleteRightLabel(m, discs),
            onApply: () => _applyUserMention(m),
            mentionMember: m,
          ),
        )
        .toList();
    final int bits = await _channelPermissionBits();
    if (generation != _syncGeneration) {
      return;
    }
    final bool canMentionEveryone =
        !isCommandArg &&
        guildId != null &&
        guildId.isNotEmpty &&
        hasPermission(bits, Permission.mentionEveryone);
    final String q = activeParsed.usernameQuery.trim().toLowerCase();
    final List<_ComposerRow> specialRows = <_ComposerRow>[];
    if (canMentionEveryone) {
      if (q.isEmpty || 'everyone'.startsWith(q)) {
        specialRows.add(
          _ComposerRow(
            title: '@everyone',
            onApply: () => _applyLiteralMention('@everyone'),
          ),
        );
      }
      if (q.isEmpty || 'here'.startsWith(q)) {
        specialRows.add(
          _ComposerRow(
            title: '@here',
            onApply: () => _applyLiteralMention('@here'),
          ),
        );
      }
    }
    final List<_ComposerRow> roleRows = <_ComposerRow>[];
    if (!isCommandArg && guildId != null && guildId.isNotEmpty) {
      final String roleSubtitle =
          l10n.composerAutocompleteRoleMentionDescription;
      final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
      final MemberRepository memberRepository = ref.read(
        memberRepositoryProvider,
      );
      final Map<String, db.Role>? cachedRolesById = ref
          .read(guildRolesByIdProvider(guildId))
          .value;
      final List<db.Role> dbRoles = await localRolesForMentionAutocomplete(
        database: database,
        repository: memberRepository,
        guildId: guildId,
        rolesById: cachedRolesById,
      );
      if (generation != _syncGeneration) {
        return;
      }
      final Map<String, db.Role> roleById = <String, db.Role>{
        for (final db.Role role in dbRoles) role.id: role,
      };
      final List<RoleMentionSearchTarget> rankedRoles =
          rankRolesForMentionQuery(
            dbRoles
                .map(
                  (db.Role role) => RoleMentionSearchTarget(
                    id: role.id,
                    name: role.name,
                    position: role.position,
                    mentionable: role.mentionable,
                  ),
                )
                .toList(),
            guildId: guildId,
            query: q,
            canMentionEveryone: canMentionEveryone,
          );
      for (final RoleMentionSearchTarget role in rankedRoles) {
        final int color = roleById[role.id]?.color ?? 0;
        final Color? titleColor = (color & 0xffffff) == 0
            ? null
            : Color(0xff000000 | (color & 0xffffff));
        roleRows.add(
          _ComposerRow(
            title: '@${role.name}',
            subtitle: roleSubtitle,
            titleColor: titleColor,
            onApply: () => _applyRoleMention(role.id, role.name, color),
          ),
        );
      }
    }
    final List<_ComposerRow> rows = <_ComposerRow>[
      ...memberRows,
      ...specialRows,
    ];
    if (roleRows.isNotEmpty) {
      rows
        ..add(_ComposerRow(title: '', onApply: () {}, isDivider: true))
        ..addAll(roleRows);
    }
    if (generation != _syncGeneration) {
      return;
    }
    _setRows(rows);
  }

  Future<List<Member>> _filterManageableCommandMembers({
    required String guildId,
    required List<Member> members,
    required List<Member> allMembers,
    required Permission permission,
  }) async {
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (currentUserId == null || currentUserId.isEmpty) {
      return const <Member>[];
    }
    final int bits = await _channelPermissionBits();
    String? ownerId;
    for (final Guild guild in ref.read(guildListViewModelProvider).guilds) {
      if (guild.id == guildId) {
        ownerId = guild.ownerId;
        break;
      }
    }
    MemberRole? viewerHighest;
    for (final Member member in allMembers) {
      if (member.id == currentUserId) {
        viewerHighest = highestRole(member.roles);
        break;
      }
    }
    if (viewerHighest == null) {
      final String? roleIdsJson = ref
          .read(currentUserMemberIdentityProvider(guildId))
          .value
          ?.roleIdsJson;
      final Map<String, db.Role>? rolesById = ref
          .read(guildRolesByIdProvider(guildId))
          .value;
      if (roleIdsJson != null &&
          roleIdsJson.isNotEmpty &&
          rolesById != null &&
          rolesById.isNotEmpty) {
        final List<dynamic> ids = jsonDecode(roleIdsJson) as List<dynamic>;
        final List<MemberRole> viewerRoles = <MemberRole>[];
        for (final dynamic id in ids) {
          final db.Role? row = rolesById[id as String];
          if (row != null) {
            viewerRoles.add(MemberRole.fromRow(row));
          }
        }
        viewerHighest = highestRole(viewerRoles);
      }
    }
    return members
        .where(
          (Member member) => canManageUserForCommand(
            currentUserId: currentUserId,
            otherUserId: member.id,
            permission: permission,
            viewerPermissions: bits,
            ownerId: ownerId,
            targetIsOwner: ownerId != null && ownerId == member.id,
            viewerHighest: viewerHighest,
            targetHighest: highestRole(member.roles),
          ),
        )
        .toList();
  }

  Future<List<Member>> _dmMentionMembers() async {
    final List<DmConversation> dms = ref.read(
      dmViewModelProvider.select((DmViewState s) => s.conversations),
    );
    final DmConversation? dm = findDmById(dms, _channelId);
    if (dm == null) {
      return const <Member>[];
    }
    if (dm.isGroup) {
      final String? currentUserId = ref.read(currentUserIdProvider);
      final List<String> participantIds = dm.remoteRecipientIds
          .where((String id) => id != currentUserId)
          .toList();
      final List<db.User> users = await ref
          .read(fluxerDatabaseProvider)
          .userDao
          .getUsersByIds(participantIds);
      final Map<String, db.User> userById = <String, db.User>{
        for (final db.User u in users) u.id: u,
      };
      final Map<String, GroupMemberInfo> cachedById = <String, GroupMemberInfo>{
        for (final GroupMemberInfo g in dm.groupMembers) g.id: g,
      };
      return <Member>[
        for (final String id in participantIds)
          dmGroupParticipantMentionMember(
            participantId: id,
            user: userById[id],
            cached: cachedById[id],
          ),
      ];
    }
    final db.User? recipientUser = await ref
        .read(fluxerDatabaseProvider)
        .userDao
        .getUserById(dm.recipientId);
    return <Member>[
      dmRecipientMentionMember(dm: dm, recipientUser: recipientUser),
    ];
  }

  Future<void> _syncEmoji(
    ComposerAutocompleteTrigger trigger,
    int generation,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await EmojiRegistry.ensureLoaded();
    final bool hasChannel = _channelId.isNotEmpty;
    final String activeGuildId = ref.read(contextualGuildIdProvider) ?? '';
    final bool hasPlutoniumEmojiAccess = ref.read(
      instanceFeatureEnabledProvider(LimitKeys.featureGlobalExpressions),
    );
    final bool canUseExternal =
        !hasChannel ||
        readChannelMessagePermissionsForComposer(
          ref,
          _channelId,
        ).canUseExternalEmojis;
    final List<Guild> guilds = ref.read(guildListViewModelProvider).guilds;
    final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);

    final List<GuildEmojiEntry> allCustom = await ref.read(
      allGuildEmojisForPickerProvider.future,
    );
    final Map<String, double> scores = await database.emojiUsageDao
        .getFrecencyScores();
    if (generation != _syncGeneration) {
      return;
    }

    final bool hasGlobalEmojiPickerAccess =
        !hasChannel || (hasPlutoniumEmojiAccess && canUseExternal);
    final Map<Guild, List<GuildEmojiEntry>> grouped =
        guildEmojiEntriesForPicker(
          guilds: guilds,
          emojis: allCustom,
          activeGuildId: activeGuildId.isEmpty ? null : activeGuildId,
          isPremium: hasGlobalEmojiPickerAccess,
          canUseExternalEmojis: canUseExternal,
        );
    final List<GuildEmojiEntry> customOrdered = <GuildEmojiEntry>[];
    for (final MapEntry<Guild, List<GuildEmojiEntry>> e in grouped.entries) {
      if (e.key.id == activeGuildId) {
        customOrdered.addAll(e.value);
      }
    }
    for (final MapEntry<Guild, List<GuildEmojiEntry>> e in grouped.entries) {
      if (e.key.id != activeGuildId) {
        customOrdered.addAll(e.value);
      }
    }
    final Map<String, String> guildNameById = <String, String>{
      for (final Guild g in guilds) g.id: g.name,
    };

    final List<EmojiAutocompleteResult> results = searchEmojiAutocomplete(
      matchedText: trigger.matchedText,
      unicode: EmojiRegistry.allEmojis,
      custom: customOrdered,
      score: (String key) => scores[key] ?? 0.0,
      limit: _kEmojiLimit,
    );
    final List<_ComposerRow> rows = <_ComposerRow>[
      for (final EmojiAutocompleteResult r in results)
        switch (r) {
          CustomEmojiResult(:final GuildEmojiEntry entry) => _ComposerRow(
            title: ':${entry.name}:',
            subtitle: guildNameById[entry.guildId],
            onApply: () => _applyEmoji(name: entry.name, wire: entry.markdown),
            emojiImageUrl: entry.url,
            emojiCacheKey: entry.cacheKeyForSize(kCustomEmojiFetchSize),
          ),
          UnicodeEmojiResult(:final EmojiEntry entry) => _ComposerRow(
            title: ':${entry.primaryName}:',
            subtitle: l10n.emojiAutocompleteDefaultLabel,
            onApply: () => _applyEmoji(
              name: entry.primaryName,
              wire: ':${entry.primaryName}:',
            ),
            emojiSurrogates: entry.surrogates,
          ),
        },
    ];
    _setRows(rows);
  }

  void _syncCommands(ComposerAutocompleteTrigger trigger, int generation) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Channel? ch = _guildChannel();
    final bool isDirect = isComposerDirectChat(
      channelId: _channelId,
      dmConversations: ref.read(dmViewModelProvider).conversations,
      currentUserId: ref.read(currentUserIdProvider),
    );
    final int bits =
        ref.read(channelPermissionCacheProvider)[_channelId] ??
        (isDirect ? allPermissions : 0);
    final List<ComposerSlashCommand> filtered =
        filterCommandsByQuery(composerSlashCommands(l10n), trigger.matchedText)
            .where((ComposerSlashCommand c) {
              return canUseComposerCommand(
                command: c,
                hasChannel: _channelId.isNotEmpty,
                isGuild: ch?.guildId != null && ch!.guildId.isNotEmpty,
                channelPermissionBits: bits,
              );
            })
            .toList(growable: false);
    if (generation != _syncGeneration) {
      return;
    }
    _setRows(
      filtered
          .map(
            (ComposerSlashCommand c) => _ComposerRow(
              title: c.name,
              subtitle: c.description,
              onApply: () => _applyCommand(c),
            ),
          )
          .toList(),
      heading: l10n.composerAutocompleteCommandsHeading,
    );
  }

  Future<void> _syncGifs(
    ComposerAutocompleteTrigger trigger,
    int generation,
  ) async {
    final String query = trigger.matchedText.trim();
    if (query.isEmpty) {
      _setRows(const <_ComposerRow>[], gifEmpty: true);
      return;
    }
    final locale = gifLocaleFromFlutterLocale(Localizations.localeOf(context));
    final List<GifPickerGif> results = await ref.read(
      gifSearchProvider((query: query, locale: locale)).future,
    );
    if (generation != _syncGeneration) {
      return;
    }
    final List<GifPickerGif> limited = results.length > kMentionResultLimit
        ? results.sublist(0, kMentionResultLimit)
        : results;
    if (limited.isEmpty) {
      _setRows(const <_ComposerRow>[], gifEmpty: true);
      return;
    }
    _setRows(
      limited
          .map(
            (GifPickerGif gif) => _ComposerRow(
              title: gif.title.trim().isEmpty
                  ? parseKlipyTitleFromUrl(gif.url)
                  : gif.title,
              onApply: () => _applyGif(gif),
              gif: gif,
            ),
          )
          .toList(),
    );
  }

  Future<void> _syncStickers(
    ComposerAutocompleteTrigger trigger,
    int generation,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String q = trigger.matchedText.trim().toLowerCase();
    final List<StickerEntry> all =
        ref.read(allGuildStickersForPickerProvider).value ??
        const <StickerEntry>[];
    final List<StickerEntry> frecent =
        ref.read(frecentStickersProvider).value ?? const <StickerEntry>[];
    bool matches(StickerEntry s) {
      if (q.isEmpty) {
        return true;
      }
      if (s.name.toLowerCase().contains(q)) {
        return true;
      }
      return s.tags.any((String t) => t.toLowerCase().contains(q));
    }

    final List<StickerEntry> results = <StickerEntry>[];
    final Set<String> seen = <String>{};
    for (final StickerEntry s in <StickerEntry>[...frecent, ...all]) {
      if (seen.contains(s.id) || !matches(s)) {
        continue;
      }
      seen.add(s.id);
      results.add(s);
      if (results.length >= kMentionResultLimit) {
        break;
      }
    }
    if (generation != _syncGeneration) {
      return;
    }
    _setRows(
      results
          .map(
            (StickerEntry s) => _ComposerRow(
              title: s.name,
              subtitle: s.description,
              onApply: () => _applySticker(s),
              mediaPreviewUrl: s.urlForSize(64),
              mediaPreviewCacheKey: s.cacheKeyForSize(64),
            ),
          )
          .toList(),
      heading: l10n.composerAutocompleteStickersHeading,
    );
  }

  void _syncMemes(ComposerAutocompleteTrigger trigger, int generation) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String q = trigger.matchedText.trim().toLowerCase();
    final List<FavoriteMeme> all =
        ref.read(favoriteMemesProvider).value ?? const <FavoriteMeme>[];
    final List<FavoriteMeme> filtered = all.where((FavoriteMeme m) {
      if (q.isEmpty) {
        return true;
      }
      if (m.name.toLowerCase().contains(q)) {
        return true;
      }
      return m.tags.any((String t) => t.toLowerCase().contains(q));
    }).toList();
    final List<FavoriteMeme> limited = filtered.length > kMentionResultLimit
        ? filtered.sublist(0, kMentionResultLimit)
        : filtered;
    if (generation != _syncGeneration) {
      return;
    }
    _setRows(
      limited
          .map(
            (FavoriteMeme m) => _ComposerRow(
              title: m.name,
              onApply: () => _applyMeme(m),
              mediaPreviewUrl: m.url,
            ),
          )
          .toList(),
      heading: l10n.composerAutocompleteMediaHeading,
    );
  }

  Future<void> _syncSlashSession(int generation) async {
    final ComposerSlashSession session = widget.slashSession!;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (session.optionalHintFocused) {
      _setRows(
        session.absentOptional
            .map(
              (ComposerCommandOption option) => _ComposerRow(
                title: option.name,
                subtitle: option.description,
                onApply: () => session.addOptionalOption(option.name),
              ),
            )
            .toList(),
        heading: l10n.composerAutocompleteOptionalArgumentsHeading,
      );
      return;
    }
    final ComposerSlashSlotState? slot = session.focusedSlot;
    if (slot == null) {
      _setRows(const <_ComposerRow>[]);
      return;
    }
    final String query = slot.text.trim();
    final String commandName = session.command?.name ?? '';
    switch (slot.option.type) {
      case ComposerCommandOptionType.choice:
      case ComposerCommandOptionType.boolean:
        final List<ComposerCommandChoice> choices =
            slot.option.type == ComposerCommandOptionType.boolean
            ? const <ComposerCommandChoice>[
                ComposerCommandChoice(name: 'true', value: 'true'),
                ComposerCommandChoice(name: 'false', value: 'false'),
              ]
            : slot.option.choices;
        final String needle = query.toLowerCase();
        final List<ComposerCommandChoice> filtered = needle.isEmpty
            ? choices
            : choices
                  .where(
                    (ComposerCommandChoice c) =>
                        c.name.toLowerCase().contains(needle) ||
                        c.value.toLowerCase().contains(needle),
                  )
                  .toList();
        _setRows(
          filtered
              .map(
                (ComposerCommandChoice c) => _ComposerRow(
                  title: c.name,
                  onApply: () {
                    session.applySlotChoice(
                      session.focusedSlotIndex,
                      c.name,
                      c.value,
                    );
                    session.focusNextSlot();
                    _afterApply();
                  },
                ),
              )
              .toList(),
          heading: l10n.composerAutocompleteChoicesHeading,
        );
        return;
      case ComposerCommandOptionType.user:
        await _syncMention(
          _slashSlotTrigger(
            kind: ComposerAutocompleteTriggerKind.commandArg,
            query: _slashSlotQuery(slot),
            commandName: normalizeComposerCommandName(commandName),
          ),
          generation,
        );
        return;
      case ComposerCommandOptionType.channel:
        await _syncChannels(
          _slashSlotTrigger(
            kind: ComposerAutocompleteTriggerKind.channel,
            query: _slashSlotQuery(slot),
          ),
          generation,
        );
        return;
      case ComposerCommandOptionType.role:
        await _syncRoles(slot, generation);
        return;
      case ComposerCommandOptionType.string:
        if (commandName == '/gif') {
          await _syncGifs(
            _slashSlotTrigger(
              kind: ComposerAutocompleteTriggerKind.gif,
              query: query,
            ),
            generation,
          );
          return;
        }
        if (commandName == '/sticker') {
          await _syncStickers(
            _slashSlotTrigger(
              kind: ComposerAutocompleteTriggerKind.sticker,
              query: query,
            ),
            generation,
          );
          return;
        }
        if (commandName == '/saved') {
          _syncMemes(
            _slashSlotTrigger(
              kind: ComposerAutocompleteTriggerKind.meme,
              query: query,
            ),
            generation,
          );
          return;
        }
        _setRows(const <_ComposerRow>[]);
        return;
      case ComposerCommandOptionType.integer:
      case ComposerCommandOptionType.number:
        _setRows(const <_ComposerRow>[]);
    }
  }

  String _slashSlotQuery(ComposerSlashSlotState slot) {
    String query = slot.text.trim();
    switch (slot.option.type) {
      case ComposerCommandOptionType.user:
      case ComposerCommandOptionType.role:
        if (query.startsWith('@')) {
          query = query.substring(1);
        }
      case ComposerCommandOptionType.channel:
        if (query.startsWith('#')) {
          query = query.substring(1);
        }
      case ComposerCommandOptionType.string:
      case ComposerCommandOptionType.integer:
      case ComposerCommandOptionType.number:
      case ComposerCommandOptionType.boolean:
      case ComposerCommandOptionType.choice:
        break;
    }
    return query;
  }

  ComposerAutocompleteTrigger _slashSlotTrigger({
    required ComposerAutocompleteTriggerKind kind,
    required String query,
    String? commandName,
  }) {
    return ComposerAutocompleteTrigger(
      kind: kind,
      matchStart: 0,
      matchEnd: query.length,
      matchedText: query,
      commandName: commandName,
    );
  }

  Future<void> _syncRoles(ComposerSlashSlotState slot, int generation) async {
    final Channel? ch = _guildChannel();
    final String? guildId = ch?.guildId;
    if (guildId == null || guildId.isEmpty) {
      _setRows(const <_ComposerRow>[]);
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    final MemberRepository memberRepository = ref.read(
      memberRepositoryProvider,
    );
    final Map<String, db.Role>? cachedRolesById = ref
        .read(guildRolesByIdProvider(guildId))
        .value;
    final List<db.Role> dbRoles = await localRolesForMentionAutocomplete(
      database: database,
      repository: memberRepository,
      guildId: guildId,
      rolesById: cachedRolesById,
    );
    if (generation != _syncGeneration) {
      return;
    }
    final String q = _slashSlotQuery(slot).toLowerCase();
    List<db.Role> filtered = dbRoles;
    if (q.isNotEmpty) {
      filtered = dbRoles
          .where((db.Role role) => role.name.toLowerCase().contains(q))
          .toList();
    }
    filtered.sort((db.Role a, db.Role b) => b.position.compareTo(a.position));
    if (filtered.length > _kRoleMentionLimit) {
      filtered = filtered.sublist(0, _kRoleMentionLimit);
    }
    final String roleSubtitle = l10n.composerAutocompleteRoleMentionDescription;
    _setRows(
      filtered.map((db.Role role) {
        final int color = role.color;
        final Color? titleColor = (color & 0xffffff) == 0
            ? null
            : Color(0xff000000 | (color & 0xffffff));
        return _ComposerRow(
          title: '@${role.name}',
          subtitle: roleSubtitle,
          titleColor: titleColor,
          onApply: () => _applyRoleMention(role.id, role.name, color),
        );
      }).toList(),
    );
  }

  void _setRows(
    List<_ComposerRow> next, {
    String? heading,
    bool gifEmpty = false,
  }) {
    if (!mounted) {
      return;
    }
    setState(() {
      _rows
        ..clear()
        ..addAll(next);
      _panelHeading = heading;
      _gifEmpty = gifEmpty;
      _selectedIndex = next.isEmpty ? 0 : _firstSelectableRowIndex();
    });
    if (next.isEmpty && !gifEmpty) {
      _stopMentionAutocompleteWatches();
    }
    if (_usesInStackPanel) {
      _publishPanel();
      if (next.isNotEmpty || gifEmpty) {
        _scheduleScrollSelectionIntoView();
      }
      return;
    }
    if (next.isEmpty && !gifEmpty) {
      _hideOverlay();
      return;
    }
    _showOverlay();
    _scheduleScrollSelectionIntoView();
  }

  ComposerAutocompletePanelSnapshot _panelSnapshot() {
    final int safeIndex = _rows.isEmpty
        ? 0
        : _normalizeSelectableIndex(_selectedIndex);
    final List<ComposerAutocompleteGifTile> gifs = _rows
        .where((_ComposerRow r) => r.gif != null)
        .map(
          (_ComposerRow r) => ComposerAutocompleteGifTile(
            id: r.gif!.id,
            title: r.title,
            imageUrl: r.gif!.proxySrc.isNotEmpty ? r.gif!.proxySrc : r.gif!.src,
            onTap: r.onApply,
          ),
        )
        .toList();
    return ComposerAutocompletePanelSnapshot(
      rows: _rows.map((_ComposerRow r) {
        final Member? m = r.mentionMember;
        final String? status = m == null
            ? null
            : ref.read(userPresenceProvider(m.id)).value?.status ?? m.status;
        return ComposerAutocompletePanelRow(
          title: r.title,
          subtitle: r.subtitle,
          titleColor: r.titleColor,
          onTap: r.onApply,
          channelRowType: r.channelRowType,
          userAvatarUserId: m?.id,
          userAvatarImageUrl: m == null
              ? null
              : FluxerMediaUrl.userAvatar(userId: m.id, hash: m.avatar),
          userAvatarFallbackText: m != null ? r.title : null,
          userAvatarColor: m?.avatarColor,
          userAvatarStatus: status,
          emojiSurrogates: r.emojiSurrogates,
          emojiImageUrl: r.emojiImageUrl,
          emojiCacheKey: r.emojiCacheKey,
          mediaPreviewUrl: r.mediaPreviewUrl,
          mediaPreviewCacheKey: r.mediaPreviewCacheKey,
          isDivider: r.isDivider,
          isSectionHeading: r.isSectionHeading,
        );
      }).toList(),
      selectedIndex: safeIndex,
      heading: _panelHeading,
      gifs: gifs,
      gifEmpty: _gifEmpty,
    );
  }

  void _publishPanel() {
    final ComposerAutocompletePanelHost? host = widget.panelHost;
    if (host == null) {
      return;
    }
    if (_rows.isEmpty && !_gifEmpty) {
      host.value = null;
      return;
    }
    host.value = _panelSnapshot();
  }

  void _showOverlay() {
    if (!_overlayController.isShowing) {
      _overlayController.show();
    }
    _animationController.forward();
  }

  void _hideOverlay() {
    if (!_overlayController.isShowing) {
      return;
    }
    unawaited(
      _animationController.reverse().then((_) {
        if (mounted && _overlayController.isShowing && _rows.isEmpty) {
          _overlayController.hide();
        }
      }),
    );
  }

  void _scheduleScrollSelectionIntoView() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ScrollController controller = _activeScrollController;
      if (!mounted || !controller.hasClients) {
        return;
      }
      final double offset =
          (_selectedIndex * kComposerAutocompleteScrollRowStride).clamp(
            0.0,
            controller.position.maxScrollExtent,
          );
      controller.animateTo(
        offset,
        duration: context.motion.normal,
        curve: Curves.easeOutCubic,
      );
    });
  }

  ComposerAutocompleteTrigger? _autocompleteTriggerAtCaret(
    ComposerAutocompleteTriggerKind kind,
  ) {
    final int? caret = _autocompleteCaretIndex(widget.controller.value);
    if (caret == null) {
      return null;
    }
    final ComposerAutocompleteTrigger? trigger =
        ComposerAutocompleteTrigger.detectIfAllowed(
          fullText: widget.controller.text,
          caretIndex: caret,
        );
    if (trigger == null ||
        trigger.kind != kind ||
        !widget.allowedTriggers.contains(kind)) {
      return null;
    }
    return trigger;
  }

  ComposerAutocompleteTrigger? _autocompleteTriggerForApply(
    ComposerAutocompleteTriggerKind kind,
  ) {
    final ComposerAutocompleteTrigger? atCaret = _autocompleteTriggerAtCaret(
      kind,
    );
    if (atCaret != null) {
      return atCaret;
    }
    final String text = widget.controller.text;
    if (text.isEmpty) {
      return null;
    }
    final ComposerAutocompleteTrigger? atEnd =
        ComposerAutocompleteTrigger.detectIfAllowed(
          fullText: text,
          caretIndex: text.length,
        );
    if (atEnd == null ||
        atEnd.kind != kind ||
        !widget.allowedTriggers.contains(kind)) {
      return null;
    }
    return atEnd;
  }

  void _replaceTrigger(ComposerAutocompleteTrigger trigger, String inserted) {
    final String full = widget.controller.text;
    final String before = full.substring(0, trigger.matchStart);
    final String after = full.substring(trigger.matchEnd);
    final String spaced = inserted.endsWith(' ') ? inserted : '$inserted ';
    final String next = '$before$spaced$after';
    final int cursor = before.length + spaced.length;
    widget.controller.value = TextEditingValue(
      text: next,
      selection: TextSelection.collapsed(offset: cursor),
    );
  }

  void _applyUserMention(Member member) {
    final ComposerSlashSession? session = widget.slashSession;
    if (session != null &&
        session.isActive &&
        session.focusedSlot?.option.type == ComposerCommandOptionType.user) {
      session.applySlotPayload(
        index: session.focusedSlotIndex,
        display: memberDisplayLabel(member),
        wire: '<@${member.id}>',
      );
      session.focusNextSlot();
      _afterApply();
      return;
    }
    for (final ComposerAutocompleteTriggerKind kind
        in <ComposerAutocompleteTriggerKind>[
          ComposerAutocompleteTriggerKind.commandArgMention,
          ComposerAutocompleteTriggerKind.commandArg,
          ComposerAutocompleteTriggerKind.mention,
        ]) {
      final ComposerAutocompleteTrigger? trigger = _autocompleteTriggerForApply(
        kind,
      );
      if (trigger == null) {
        continue;
      }
      final int start = composerAutocompleteReplacementStart(
        textUpToCursor: widget.controller.text.substring(0, trigger.matchEnd),
        trigger: trigger,
      );
      if (widget.controller is ComposerMentionController) {
        String? friendNickname;
        for (final friend in ref.read(dmViewModelProvider).friendsList) {
          if (friend.id == member.id) {
            friendNickname = friend.nickname;
            break;
          }
        }
        (widget.controller as ComposerMentionController)
            .insertUserMentionPlaceholder(
              matchStart: start,
              matchEnd: trigger.matchEnd,
              userId: member.id,
              displayName: memberDisplayLabel(
                member,
                friendNickname: friendNickname,
              ),
            );
        _afterApply();
        return;
      }
      final String full = widget.controller.text;
      final String next =
          '${full.substring(0, start)}<@${member.id}> ${full.substring(trigger.matchEnd)}';
      widget.controller.value = TextEditingValue(
        text: next,
        selection: TextSelection.collapsed(
          offset: start + member.id.length + 4,
        ),
      );
      _afterApply();
      return;
    }
  }

  void _applyLiteralMention(String text) {
    final ComposerAutocompleteTrigger? trigger = _autocompleteTriggerForApply(
      ComposerAutocompleteTriggerKind.mention,
    );
    if (trigger == null) {
      return;
    }
    _replaceTrigger(trigger, text);
    _afterApply();
  }

  void _applyRoleMention(String roleId, String displayName, int colorArgb) {
    final ComposerSlashSession? session = widget.slashSession;
    if (session != null &&
        session.isActive &&
        session.focusedSlot?.option.type == ComposerCommandOptionType.role) {
      session.applySlotPayload(
        index: session.focusedSlotIndex,
        display: '@$displayName',
        wire: '<@&$roleId>',
      );
      session.focusNextSlot();
      _afterApply();
      return;
    }
    final ComposerAutocompleteTrigger? trigger = _autocompleteTriggerForApply(
      ComposerAutocompleteTriggerKind.mention,
    );
    if (trigger == null) {
      return;
    }
    if (widget.controller is ComposerMentionController) {
      (widget.controller as ComposerMentionController)
          .insertRoleMentionPlaceholder(
            matchStart: trigger.matchStart,
            matchEnd: trigger.matchEnd,
            roleId: roleId,
            displayName: displayName,
            colorArgb: colorArgb,
          );
      _afterApply();
      return;
    }
    _replaceTrigger(trigger, '<@&$roleId>');
    _afterApply();
  }

  void _applyChannel(Channel c) {
    final ComposerSlashSession? session = widget.slashSession;
    if (session != null &&
        session.isActive &&
        session.focusedSlot?.option.type == ComposerCommandOptionType.channel) {
      session.applySlotPayload(
        index: session.focusedSlotIndex,
        display: c.name,
        wire: '<#${c.id}>',
      );
      session.focusNextSlot();
      _afterApply();
      return;
    }
    final ComposerAutocompleteTrigger? trigger = _autocompleteTriggerForApply(
      ComposerAutocompleteTriggerKind.channel,
    );
    if (trigger == null) {
      return;
    }
    if (widget.controller is ComposerMentionController) {
      (widget.controller as ComposerMentionController)
          .insertChannelMentionPlaceholder(
            matchStart: trigger.matchStart,
            matchEnd: trigger.matchEnd,
            channelId: c.id,
            displayName: c.name,
          );
      _afterApply();
      return;
    }
    _replaceTrigger(trigger, '<#${c.id}>');
    _afterApply();
  }

  void _applyEmoji({required String name, required String wire}) {
    final ComposerAutocompleteTrigger? trigger = _autocompleteTriggerForApply(
      ComposerAutocompleteTriggerKind.emoji,
    );
    if (trigger == null) {
      return;
    }
    final TextEditingController controller = widget.controller;
    if (controller is InlineTokenTextEditingController) {
      controller.replaceRangeWithToken(
        trigger.matchStart,
        trigger.matchEnd,
        EmojiInlineToken(displayName: name, wireText: wire),
        ensureTrailingSpace: true,
        maxWireLength: widget.maxActualLength,
      );
    } else {
      _replaceTrigger(trigger, wire);
    }
    _afterApply();
  }

  void _applyCommand(ComposerSlashCommand command) {
    final int? caret = _autocompleteCaretIndex(widget.controller.value);
    if (caret == null) {
      return;
    }
    final ComposerAutocompleteTrigger? trigger = _autocompleteTriggerForApply(
      ComposerAutocompleteTriggerKind.command,
    );
    if (trigger == null) {
      return;
    }
    final ({int start, int end, String text}) replacement =
        createComposerCommandReplacement(
          display: widget.controller.text,
          textUpToCursor: widget.controller.text.substring(0, caret),
          matchStart: trigger.matchStart,
          caret: caret,
          command: command,
        );
    if (command is ComposerActionSlashCommand && command.options.isNotEmpty) {
      final String next =
          widget.controller.text.substring(0, replacement.start) +
          widget.controller.text.substring(replacement.end);
      widget.controller.value = TextEditingValue(
        text: next,
        selection: TextSelection.collapsed(offset: replacement.start),
      );
      widget.slashSession?.start(command);
      _afterApply();
      return;
    }
    widget.controller.value = TextEditingValue(
      text:
          widget.controller.text.substring(0, replacement.start) +
          replacement.text +
          widget.controller.text.substring(replacement.end),
      selection: TextSelection.collapsed(
        offset: replacement.start + replacement.text.length,
      ),
    );
    _afterApply();
  }

  void _applyGif(GifPickerGif gif) {
    widget.onSelectGif?.call(gif);
    widget.slashSession?.clear();
    _afterApply();
  }

  void _applySticker(StickerEntry sticker) {
    widget.onSelectSticker?.call(sticker);
    widget.slashSession?.clear();
    _afterApply();
  }

  void _applyMeme(FavoriteMeme meme) {
    widget.onSelectMeme?.call(meme);
    widget.slashSession?.clear();
    _afterApply();
  }

  void _afterApply() {
    widget.onApplied?.call();
    _closeMenu();
  }

  void _closeMenu() {
    _stopGuildRolesWatch();
    _setRows(const <_ComposerRow>[]);
  }

  void closeAutocompleteMenu() {
    _closeMenu();
  }

  void moveSelection(int delta) {
    if (_rows.isEmpty) {
      return;
    }
    setState(() {
      _selectedIndex = _nextSelectableIndex(_selectedIndex, delta);
    });
    if (_usesInStackPanel) {
      _publishPanel();
    }
    _scheduleScrollSelectionIntoView();
  }

  void moveSelectionToEdge({required bool first}) {
    if (_rows.isEmpty) {
      return;
    }
    setState(() {
      _selectedIndex = first
          ? _firstSelectableRowIndex()
          : _nextSelectableIndex(_rows.length, -1);
    });
    if (_usesInStackPanel) {
      _publishPanel();
    }
    _scheduleScrollSelectionIntoView();
  }

  void applyCurrentSelection() {
    if (_rows.isEmpty) {
      return;
    }
    final int index = _normalizeSelectableIndex(_selectedIndex);
    if (_rows[index].isDivider || _rows[index].isSectionHeading) {
      return;
    }
    _rows[index].onApply();
  }

  bool get hasOpenMenu => _rows.isNotEmpty || _gifEmpty;

  Widget _buildOverlay(BuildContext context) {
    if (_rows.isEmpty && !_gifEmpty) {
      return const SizedBox.shrink();
    }
    final RenderBox? renderBox =
        _targetKey.currentContext?.findRenderObject() as RenderBox?;
    final double targetWidth = (renderBox?.hasSize ?? false)
        ? renderBox!.size.width
        : double.infinity;
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: FluxerGestureDetector(
            onTap: _closeMenu,
            behavior: HitTestBehavior.opaque,
            child: const ColoredBox(color: Colors.transparent),
          ),
        ),
        CompositedTransformFollower(
          link: _layerLink,
          followerAnchor: Alignment.bottomLeft,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: TextFieldTapRegion(
              child: SizedBox(
                width: targetWidth,
                child: ComposerAutocompletePanelBody(
                  snap: _panelSnapshot(),
                  scrollController: _scrollController,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _warmCustomEmoji();
    if (_usesInStackPanel) {
      return widget.child;
    }
    return OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder: _buildOverlay,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double maxW = constraints.maxWidth;
          final bool hasWidth = maxW.isFinite && maxW > 0;
          return SizedBox(
            width: hasWidth ? maxW : null,
            child: CompositedTransformTarget(
              link: _layerLink,
              child: KeyedSubtree(key: _targetKey, child: widget.child),
            ),
          );
        },
      ),
    );
  }
}
