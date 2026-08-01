part of 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';

// Kept for planned quick-switcher UI wiring.
// ignore: unused_element
const int _kRoleMentionLimit = 10;
const int _kChannelLimit = 10;
const int _kEmojiLimit = 10;
const int _kAutocompleteTypingDebounceMs = 300;
const Duration _kAutocompleteFadeDuration = Duration(milliseconds: 100);

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
    this.isDivider = false,
  });

  final String title;
  final VoidCallback onApply;
  final String? subtitle;
  final Member? mentionMember;
  final Color? titleColor;
  final ChannelType? channelRowType;
  final String? emojiSurrogates;
  final String? emojiImageUrl;
  final String? emojiCacheKey;
  final bool isDivider;
}

class ComposerAutocompleteFieldState
    extends ConsumerState<ComposerAutocompleteField>
    with SingleTickerProviderStateMixin {
  final List<_ComposerRow> _rows = <_ComposerRow>[];
  int _selectedIndex = 0;
  int _syncGeneration = 0;
  Timer? _debounce;

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
    _animationController.dispose();
    _scrollController.dispose();
    widget.panelHost?.value = null;
    super.dispose();
  }

  void _onFocusChanged() {
    if (!widget.focusNode.hasFocus) {
      _stopMentionAutocompleteWatches();
      _setRows(const <_ComposerRow>[]);
    }
  }

  void _onTextChanged() {
    _debounce?.cancel();
    final TextSelection selection = widget.controller.selection;
    if (selection.isValid && selection.isCollapsed) {
      final ComposerAutocompleteTrigger? trigger =
          ComposerAutocompleteTrigger.detectIfAllowed(
            fullText: widget.controller.text,
            caretIndex: selection.baseOffset,
          );
      if (trigger?.kind == ComposerAutocompleteTriggerKind.mention) {
        _scheduleSync();
        return;
      }
    }
    _debounce = Timer(
      const Duration(milliseconds: _kAutocompleteTypingDebounceMs),
      _scheduleSync,
    );
  }

  void _scheduleSync() {
    if (!mounted || !widget.enabled) {
      return;
    }
    final int gen = ++_syncGeneration;
    unawaited(_sync(gen));
  }

  Future<void> _sync(int generation) async {
    final TextSelection sel = widget.controller.selection;
    if (!sel.isValid || !sel.isCollapsed) {
      if (generation == _syncGeneration) {
        _setRows(const <_ComposerRow>[]);
      }
      return;
    }
    final String full = widget.controller.text;
    final int caret = sel.baseOffset;
    final ComposerAutocompleteTrigger? trigger =
        ComposerAutocompleteTrigger.detectIfAllowed(
          fullText: full,
          caretIndex: caret,
        );
    if (generation != _syncGeneration) {
      return;
    }
    if (trigger == null || !widget.allowedTriggers.contains(trigger.kind)) {
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
        await _syncMention(trigger, generation);
        return;
      case ComposerAutocompleteTriggerKind.emoji:
        await _syncEmoji(trigger, generation);
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
    _stopGuildRolesWatch();
    _stopChannelPermissionWatch();
  }

  void _startMentionAutocompleteWatches({
    required String guildId,
    required String channelId,
  }) {
    _startGuildRolesWatch(guildId);
    _startChannelPermissionWatch(channelId);
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
    _guildRolesSubscription = ref.listenManual(
      guildRolesByIdProvider(guildId),
      (
        AsyncValue<Map<String, db.Role>>? previous,
        AsyncValue<Map<String, db.Role>> next,
      ) {
        if (!mounted || !next.hasValue) {
          return;
        }
        _scheduleSync();
      },
    );
  }

  void _stopGuildRolesWatch() {
    _guildRolesSubscription?.close();
    _guildRolesSubscription = null;
    _guildRolesWatchGuildId = null;
  }

  int _firstSelectableRowIndex() {
    for (int i = 0; i < _rows.length; i++) {
      if (!_rows[i].isDivider) {
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
    if (_rows[normalized].isDivider) {
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
      if (!_rows[index].isDivider) {
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
    List<Member> members = const <Member>[];
    Set<String> remoteSearchMemberIds = <String>{};
    Set<String> localMemberIds = <String>{};
    if (guildId != null && guildId.isNotEmpty) {
      _startMentionAutocompleteWatches(guildId: guildId, channelId: _channelId);
      ref.read(guildSyncProvider.notifier).syncIfNeeded(guildId);
      final GuildMentionMemberSearch search = ref.read(
        guildMentionMemberSearchProvider,
      );
      final MentionAutocompleteSession stableSession = _mentionSessionFor(
        guildId,
        parsed,
      );
      final String searchQuery = parsed.usernameQuery.trim();
      members = await search.searchCached(
        guildId: guildId,
        parsed: parsed,
        friendNicknameById: friendNicknameById,
        stableSession: stableSession,
      );
      localMemberIds = <String>{for (final Member m in members) m.id};
      if (generation != _syncGeneration) {
        return;
      }
      await _renderMentionRows(
        generation: generation,
        parsed: parsed,
        guildId: guildId,
        members: members,
        remoteSearchMemberIds: remoteSearchMemberIds,
        localMemberIds: localMemberIds,
        friendNicknameById: friendNicknameById,
        l10n: l10n,
      );
      if (generation != _syncGeneration) {
        return;
      }
      if (await search.shouldFetchFromGateway(guildId, searchQuery)) {
        final ({List<Member> members, Set<String> remoteMemberIds})
        gatewayResult = await search.fetchGatewayAndMerge(
          guildId: guildId,
          query: searchQuery,
          parsed: parsed,
          friendNicknameById: friendNicknameById,
          stableSession: stableSession,
        );
        members = gatewayResult.members;
        remoteSearchMemberIds = gatewayResult.remoteMemberIds;
        if (generation != _syncGeneration) {
          return;
        }
        await _renderMentionRows(
          generation: generation,
          parsed: parsed,
          guildId: guildId,
          members: members,
          remoteSearchMemberIds: remoteSearchMemberIds,
          localMemberIds: localMemberIds,
          friendNicknameById: friendNicknameById,
          l10n: l10n,
        );
      }
      return;
    }
    _stopMentionAutocompleteWatches();
    members = await _dmMentionMembers();
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
      remoteSearchMemberIds: remoteSearchMemberIds,
      localMemberIds: localMemberIds,
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
    required Set<String> localMemberIds,
    required Map<String, String?> friendNicknameById,
    required FluxerLocalizations l10n,
    Map<String, String>? discriminators,
  }) async {
    if (generation != _syncGeneration) {
      return;
    }
    final Map<String, String> discs =
        discriminators ??
        await ref
            .read(guildMentionMemberSearchProvider)
            .discriminatorsFor(members);
    if (generation != _syncGeneration) {
      return;
    }
    List<Member> ranked = members;
    if (guildId != null && guildId.isNotEmpty) {
      final Set<String> assumeVisibleForUserIds = remoteSearchMemberIds
          .difference(localMemberIds);
      ranked = await filterMembersByViewChannel(
        database: ref.read(fluxerDatabaseProvider),
        channelId: _channelId,
        guildId: guildId,
        members: ranked,
        assumeVisibleForUserIds: assumeVisibleForUserIds,
      );
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
        guildId != null &&
        guildId.isNotEmpty &&
        hasPermission(bits, Permission.mentionEveryone);
    final String q = parsed.usernameQuery.trim().toLowerCase();
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
    if (guildId != null && guildId.isNotEmpty) {
      final String roleSubtitle =
          l10n.composerAutocompleteRoleMentionDescription;
      final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
      final MemberRepository memberRepository = ref.read(
        memberRepositoryProvider,
      );
      final Map<String, db.Role>? cachedRolesById = ref
          .read(guildRolesByIdProvider(guildId))
          .value;
      final List<db.Role> dbRoles =
          await resolveGuildRolesForMentionAutocomplete(
            database: database,
            repository: memberRepository,
            guildId: guildId,
            query: q,
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
    final MentionMatchRank bestMemberRank = ranked.isEmpty || q.isEmpty
        ? MentionMatchRank.noMatch
        : mentionMatchRankForMember(
            ranked.first,
            q,
            friendNickname: friendNicknameById[ranked.first.id],
            discriminator: discs[ranked.first.id],
          );
    final MentionMatchRank bestRoleRank = roleRows.isEmpty || q.isEmpty
        ? MentionMatchRank.noMatch
        : mentionMatchRankForRoleName(roleRows.first.title.substring(1), q);
    final bool promoteRoles = shouldPromoteRoleMentionMatches(
      query: q,
      bestRoleRank: bestRoleRank,
      bestMemberRank: bestMemberRank,
    );
    final List<_ComposerRow> rows = <_ComposerRow>[];
    if (promoteRoles) {
      rows
        ..addAll(roleRows)
        ..addAll(memberRows)
        ..addAll(specialRows);
    } else {
      rows
        ..addAll(memberRows)
        ..addAll(specialRows);
      if (roleRows.isNotEmpty) {
        rows
          ..add(_ComposerRow(title: '', onApply: () {}, isDivider: true))
          ..addAll(roleRows);
      }
    }
    if (generation != _syncGeneration) {
      return;
    }
    _setRows(rows);
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
    final bool hasPlutoniumEmojiAccess =
        !hasChannel ||
        composerHasDirectChatEmojiAccess(
          channelId: _channelId,
          dmConversations: ref.read(dmViewModelProvider).conversations,
          currentUserId: ref.read(currentUserIdProvider),
          hasGlobalExpressions: ref.read(
            instanceFeatureEnabledProvider(LimitKeys.featureGlobalExpressions),
          ),
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

    final Map<Guild, List<GuildEmojiEntry>> grouped =
        guildEmojiEntriesForPicker(
          guilds: guilds,
          emojis: allCustom,
          activeGuildId: activeGuildId,
          isPremium: hasPlutoniumEmojiAccess,
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

  void _setRows(List<_ComposerRow> next) {
    if (!mounted) {
      return;
    }
    setState(() {
      _rows
        ..clear()
        ..addAll(next);
      _selectedIndex = next.isEmpty ? 0 : _firstSelectableRowIndex();
    });
    if (_usesInStackPanel) {
      _publishPanel();
      if (next.isNotEmpty) {
        _scheduleScrollSelectionIntoView();
      }
      return;
    }
    if (next.isEmpty) {
      _stopGuildRolesWatch();
      _hideOverlay();
      return;
    }
    _showOverlay();
    _scheduleScrollSelectionIntoView();
  }

  void _publishPanel() {
    final ComposerAutocompletePanelHost? host = widget.panelHost;
    if (host == null) {
      return;
    }
    if (_rows.isEmpty) {
      host.value = null;
      return;
    }
    final int safeIndex = _normalizeSelectableIndex(_selectedIndex);
    host.value = ComposerAutocompletePanelSnapshot(
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
          isDivider: r.isDivider,
        );
      }).toList(),
      selectedIndex: safeIndex,
    );
  }

  void _showOverlay() {
    if (!_overlayController.isShowing) {
      _overlayController.show();
    }
    unawaited(_animationController.forward());
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
      final double offset = (_selectedIndex * _kAutocompleteScrollRowStride)
          .clamp(0.0, controller.position.maxScrollExtent);
      unawaited(
        controller.animateTo(
          offset,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutCubic,
        ),
      );
    });
  }

  ComposerAutocompleteTrigger? _autocompleteTriggerAtCaret(
    ComposerAutocompleteTriggerKind kind,
  ) {
    final TextSelection sel = widget.controller.selection;
    if (!sel.isValid || !sel.isCollapsed) {
      return null;
    }
    final ComposerAutocompleteTrigger? trigger =
        ComposerAutocompleteTrigger.detectIfAllowed(
          fullText: widget.controller.text,
          caretIndex: sel.baseOffset,
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
    final ComposerAutocompleteTrigger? trigger = _autocompleteTriggerForApply(
      ComposerAutocompleteTriggerKind.mention,
    );
    if (trigger == null) {
      return;
    }
    final String userId = member.id;
    if (widget.controller is ComposerMentionController) {
      String? friendNickname;
      for (final friend in ref.read(dmViewModelProvider).friendsList) {
        if (friend.id == userId) {
          friendNickname = friend.nickname;
          break;
        }
      }
      (widget.controller as ComposerMentionController)
          .insertUserMentionPlaceholder(
            matchStart: trigger.matchStart,
            matchEnd: trigger.matchEnd,
            userId: userId,
            displayName: memberDisplayLabel(
              member,
              friendNickname: friendNickname,
            ),
          );
      _afterApply();
      return;
    }
    _replaceTrigger(trigger, '<@$userId>');
    _afterApply();
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

  void applyCurrentSelection() {
    if (_rows.isEmpty) {
      return;
    }
    final int index = _normalizeSelectableIndex(_selectedIndex);
    if (_rows[index].isDivider) {
      return;
    }
    _rows[index].onApply();
  }

  bool get hasOpenMenu => _rows.isNotEmpty;

  Widget _buildOverlay(BuildContext context) {
    if (_rows.isEmpty) {
      return const SizedBox.shrink();
    }
    final RenderBox? renderBox =
        _targetKey.currentContext?.findRenderObject() as RenderBox?;
    final double targetWidth = (renderBox?.hasSize ?? false)
        ? renderBox!.size.width
        : double.infinity;
    final int safeIndex = _normalizeSelectableIndex(_selectedIndex);
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: GestureDetector(
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
                child: _buildPanelBody(context, safeIndex),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPanelBody(BuildContext context, int selectedIndex) {
    final Color panelBg = context.colors.backgroundFloating;
    return Semantics(
      container: true,
      label: 'Suggestions',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_kAutocompleteBorderRadius),
        child: Material(
          color: panelBg,
          shadowColor: Colors.transparent,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: kComposerAutocompletePanelMaxHeight,
            ),
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(
                vertical: _kAutocompleteScrollerVerticalPadding,
              ),
              shrinkWrap: true,
              itemCount: _rows.length,
              separatorBuilder: (BuildContext _, int _) {
                return const SizedBox(height: _kAutocompleteRowGap);
              },
              itemBuilder: (BuildContext _, int i) {
                final _ComposerRow row = _rows[i];
                if (row.isDivider) {
                  return const Divider(height: 1);
                }
                final Member? m = row.mentionMember;
                return ComposerAutocompletePanelListTile(
                  title: row.title,
                  isSelected: i == selectedIndex,
                  onTap: row.onApply,
                  subtitle: row.subtitle,
                  titleColor: row.titleColor,
                  channelRowType: row.channelRowType,
                  userAvatarUserId: m?.id,
                  userAvatarImageUrl: m == null
                      ? null
                      : FluxerMediaUrl.userAvatar(userId: m.id, hash: m.avatar),
                  userAvatarFallbackText: m != null ? row.title : null,
                  userAvatarColor: m?.avatarColor,
                  userAvatarStatus: m == null
                      ? null
                      : ref.watch(userPresenceProvider(m.id)).value?.status ??
                            m.status,
                  emojiSurrogates: row.emojiSurrogates,
                  emojiImageUrl: row.emojiImageUrl,
                );
              },
            ),
          ),
        ),
      ),
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
