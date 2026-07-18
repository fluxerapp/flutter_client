part of 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';

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
      _setRows(const <_ComposerRow>[]);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    widget.controller.removeListener(_onTextChanged);
    widget.focusNode.removeListener(_onFocusChanged);
    _animationController.dispose();
    _scrollController.dispose();
    widget.panelHost?.value = null;
    super.dispose();
  }

  void _onFocusChanged() {
    if (!widget.focusNode.hasFocus) {
      _setRows(const <_ComposerRow>[]);
    }
  }

  void _onTextChanged() {
    _debounce?.cancel();
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

  Future<int> _effectiveChannelBits() async {
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
    return ref.read(
      effectiveGuildChannelPermissionBitsProvider(_channelId).future,
    );
  }

  Channel? _guildChannel() {
    final ChannelListState list = ref.read(channelListViewModelProvider);
    return findChannelById(list, _channelId);
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
          onApply: () => _applyChannel(trigger, c),
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
        trigger: trigger,
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
          trigger: trigger,
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
      trigger: trigger,
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
    required ComposerAutocompleteTrigger trigger,
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
    final List<_ComposerRow> rows = ranked
        .map(
          (Member m) => _ComposerRow(
            title: memberDisplayLabel(
              m,
              friendNickname: friendNicknameById[m.id],
            ),
            subtitle: _composerMentionAutocompleteRightLabel(m, discs),
            onApply: () => _applyUserMention(trigger, m),
            mentionMember: m,
          ),
        )
        .toList();
    final int bits = await _effectiveChannelBits();
    if (generation != _syncGeneration) {
      return;
    }
    final bool canMentionEveryone =
        guildId != null &&
        guildId.isNotEmpty &&
        hasPermission(bits, Permission.mentionEveryone);
    final String q = parsed.usernameQuery.trim().toLowerCase();
    if (canMentionEveryone) {
      if (q.isEmpty || 'everyone'.startsWith(q)) {
        rows.add(
          _ComposerRow(
            title: '@everyone',
            onApply: () => _applyLiteralMention(trigger, '@everyone'),
          ),
        );
      }
      if (q.isEmpty || 'here'.startsWith(q)) {
        rows.add(
          _ComposerRow(
            title: '@here',
            onApply: () => _applyLiteralMention(trigger, '@here'),
          ),
        );
      }
    }
    if (guildId != null && guildId.isNotEmpty) {
      final String roleSubtitle =
          l10n.composerAutocompleteRoleMentionDescription;
      final List<db.Role> dbRoles = await ref
          .read(fluxerDatabaseProvider)
          .roleDao
          .getRoles(guildId);
      if (generation != _syncGeneration) {
        return;
      }
      int roleCount = 0;
      for (final db.Role r in dbRoles) {
        if (roleCount >= _kRoleMentionLimit) {
          break;
        }
        if (r.id == guildId) {
          continue;
        }
        if (!(canMentionEveryone || r.mentionable)) {
          continue;
        }
        if (q.isNotEmpty && !r.name.toLowerCase().contains(q)) {
          continue;
        }
        roleCount++;
        final Color? titleColor = (r.color & 0xffffff) == 0
            ? null
            : Color(0xff000000 | (r.color & 0xffffff));
        rows.add(
          _ComposerRow(
            title: '@${r.name}',
            subtitle: roleSubtitle,
            titleColor: titleColor,
            onApply: () => _applyRoleMention(trigger, r.id, r.name, r.color),
          ),
        );
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
      final List<Member> members = <Member>[];
      for (final String id in participantIds) {
        final db.User? user = userById[id];
        final GroupMemberInfo? cached = cachedById[id];
        members.add(
          Member(
            id: id,
            username: user?.username ?? cached?.name ?? '',
            globalName: user?.globalName ?? cached?.name,
            status: user?.status ?? 'offline',
            isBot: user?.bot ?? false,
          ),
        );
      }
      return members;
    }
    return <Member>[
      Member(
        id: dm.recipientId,
        username: dm.recipientUsername ?? dm.recipientName,
        globalName: dm.recipientName,
        status: dm.recipientStatus,
        isBot: dm.isBot,
      ),
    ];
  }

  Future<void> _syncEmoji(
    ComposerAutocompleteTrigger trigger,
    int generation,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await EmojiRegistry.ensureLoaded();
    final bool hasChannel = _channelId.isNotEmpty;
    final String activeGuildId = ref.read(activeGuildIdProvider) ?? '';
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
        channelMessagePermissionsForComposer(
          ref.read(channelMessagePermissionsProvider(_channelId)),
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
            onApply: () =>
                _applyEmoji(trigger, name: entry.name, wire: entry.markdown),
            emojiImageUrl: entry.url,
            emojiCacheKey: entry.cacheKeyForSize(kCustomEmojiFetchSize),
          ),
          UnicodeEmojiResult(:final EmojiEntry entry) => _ComposerRow(
            title: ':${entry.primaryName}:',
            subtitle: l10n.emojiAutocompleteDefaultLabel,
            onApply: () => _applyEmoji(
              trigger,
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
      _selectedIndex = 0;
    });
    if (_usesInStackPanel) {
      _publishPanel();
      if (next.isNotEmpty) {
        _scheduleScrollSelectionIntoView();
      }
      return;
    }
    if (next.isEmpty) {
      _hideOverlay();
    } else {
      _showOverlay();
      _scheduleScrollSelectionIntoView();
    }
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
    final int safeIndex = _selectedIndex.clamp(0, _rows.length - 1);
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

  void _applyUserMention(ComposerAutocompleteTrigger trigger, Member member) {
    final String userId = member.id;
    if (widget.controller is ComposerMentionController &&
        trigger.kind == ComposerAutocompleteTriggerKind.mention) {
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

  void _applyLiteralMention(ComposerAutocompleteTrigger trigger, String text) {
    _replaceTrigger(trigger, text);
    _afterApply();
  }

  void _applyRoleMention(
    ComposerAutocompleteTrigger trigger,
    String roleId,
    String displayName,
    int colorArgb,
  ) {
    if (widget.controller is ComposerMentionController &&
        trigger.kind == ComposerAutocompleteTriggerKind.mention) {
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

  void _applyChannel(ComposerAutocompleteTrigger trigger, Channel c) {
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

  void _applyEmoji(
    ComposerAutocompleteTrigger trigger, {
    required String name,
    required String wire,
  }) {
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
      _selectedIndex = (_selectedIndex + delta + _rows.length) % _rows.length;
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
    _rows[_selectedIndex].onApply();
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
    final int safeIndex = _selectedIndex.clamp(0, _rows.length - 1);
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
