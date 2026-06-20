part of 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';

const int _kMentionLimit = 100;
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
  });

  final String title;
  final VoidCallback onApply;
  final String? subtitle;
  final Member? mentionMember;
  final Color? titleColor;
  final ChannelType? channelRowType;
  final String? emojiSurrogates;
  final String? emojiImageUrl;
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

  String get _channelId => widget.channelId ?? '';

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
  }

  @override
  void dispose() {
    _debounce?.cancel();
    widget.controller.removeListener(_onTextChanged);
    widget.focusNode.removeListener(_onFocusChanged);
    _animationController.dispose();
    _scrollController.dispose();
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
    final bool isDm = ref.read(
      dmViewModelProvider.select(
        (DmViewState s) => findDmById(s.conversations, _channelId) != null,
      ),
    );
    if (isDm) {
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
    final ({
      List<Member> members,
      Set<String> remoteSearchMemberIds,
      Set<String> localMemberIds,
    })
    source = await _mentionMemberSource(parsed);
    if (generation != _syncGeneration) {
      return;
    }
    final Map<String, String>? discs = await _discriminatorsFor(source.members);
    if (generation != _syncGeneration) {
      return;
    }
    List<Member> ranked = rankMembersForMentionQuery(
      source.members,
      parsed,
      limit: _kMentionLimit,
      discriminatorByUserId: discs,
      prioritizeMemberIds: source.remoteSearchMemberIds,
    );
    final Channel? ch = _guildChannel();
    final String? guildId = ch?.guildId;
    if (guildId != null && guildId.isNotEmpty) {
      final Set<String> assumeVisibleForUserIds = source.remoteSearchMemberIds
          .difference(source.localMemberIds);
      ranked = await filterMembersByViewChannel(
        database: ref.read(fluxerDatabaseProvider),
        channelId: _channelId,
        guildId: guildId,
        members: ranked,
        assumeVisibleForUserIds: assumeVisibleForUserIds,
      );
    }
    if (generation != _syncGeneration) {
      return;
    }
    final List<_ComposerRow> rows = ranked
        .map(
          (Member m) => _ComposerRow(
            title: memberDisplayLabel(m),
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

  Future<
    ({
      List<Member> members,
      Set<String> remoteSearchMemberIds,
      Set<String> localMemberIds,
    })
  >
  _mentionMemberSource(ParsedMentionQuery parsed) async {
    final Channel? ch = _guildChannel();
    final String? guildId = ch?.guildId;
    if (guildId != null && guildId.isNotEmpty) {
      final MemberRepository repo = ref.read(memberRepositoryProvider);
      final GuildMemberChunkWaiter chunkWaiter = ref.read(
        guildMemberChunkWaiterProvider,
      );
      final String searchQuery = parsed.usernameQuery.trim();
      List<Member> members = const <Member>[];
      Set<String> localMemberIds = <String>{};
      Set<String> remoteSearchMemberIds = <String>{};
      try {
        final GatewayConnection connection = ref.read(
          gatewayConnectionProvider,
        );
        connection.requestGuildMembers(
          guildId: guildId,
          query: searchQuery.isEmpty ? null : searchQuery,
          limit: _kMentionLimit,
        );
        await chunkWaiter.waitForChunk(guildId);
        final List<String> scopeUserIds = chunkWaiter.lastChunkUserIds(guildId);
        members = await repo.searchMembersForAutocomplete(
          guildId: guildId,
          query: searchQuery,
          scopeUserIds: scopeUserIds,
        );
        final Set<String> memberIds = <String>{
          for (final Member m in members) m.id,
        };
        if (searchQuery.isNotEmpty) {
          remoteSearchMemberIds = memberIds;
        } else {
          localMemberIds = memberIds;
        }
      } on Object {
        members = const <Member>[];
      }
      return (
        members: members,
        remoteSearchMemberIds: remoteSearchMemberIds,
        localMemberIds: localMemberIds,
      );
    }
    final List<DmConversation> dms = ref.read(
      dmViewModelProvider.select((DmViewState s) => s.conversations),
    );
    final DmConversation? dm = findDmById(dms, _channelId);
    if (dm == null) {
      return (
        members: const <Member>[],
        remoteSearchMemberIds: <String>{},
        localMemberIds: <String>{},
      );
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
      return (
        members: members,
        remoteSearchMemberIds: <String>{},
        localMemberIds: <String>{},
      );
    }
    return (
      members: <Member>[
        Member(
          id: dm.recipientId,
          username: dm.recipientUsername ?? dm.recipientName,
          globalName: dm.recipientName,
          status: dm.recipientStatus,
          isBot: dm.isBot,
        ),
      ],
      remoteSearchMemberIds: <String>{},
      localMemberIds: <String>{},
    );
  }

  Future<Map<String, String>?> _discriminatorsFor(List<Member> members) async {
    if (members.isEmpty) {
      return null;
    }
    final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    final List<String> ids = members.map((Member m) => m.id).toList();
    final List<db.User> users = await database.userDao.getUsersByIds(ids);
    return {for (final db.User u in users) u.id: u.discriminator};
  }

  Future<void> _syncEmoji(
    ComposerAutocompleteTrigger trigger,
    int generation,
  ) async {
    await EmojiRegistry.ensureLoaded();
    final bool hasChannel = _channelId.isNotEmpty;
    final String activeGuildId = ref.read(activeGuildIdProvider) ?? '';
    // No channel context (e.g. bio) offers every accessible custom emoji; a
    // channel applies the same premium/external gating as the message composer.
    final bool isPremium =
        !hasChannel || ref.read(currentUserPremiumTypeProvider) > 0;
    final bool canUseExternal =
        !hasChannel ||
        channelMessagePermissionsForComposer(
          ref.read(channelMessagePermissionsProvider(_channelId)),
        ).canUseExternalEmojis;
    final List<Guild> guilds = ref.read(guildListViewModelProvider).guilds;
    final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

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
          isPremium: isPremium,
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
    if (next.isEmpty) {
      _hideOverlay();
    } else {
      _showOverlay();
      _scheduleScrollSelectionIntoView();
    }
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
      if (!mounted || !_scrollController.hasClients) {
        return;
      }
      final double offset = (_selectedIndex * _kAutocompleteScrollRowStride)
          .clamp(0.0, _scrollController.position.maxScrollExtent);
      unawaited(
        _scrollController.animateTo(
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
      (widget.controller as ComposerMentionController)
          .insertUserMentionPlaceholder(
            matchStart: trigger.matchStart,
            matchEnd: trigger.matchEnd,
            userId: userId,
            displayName: memberDisplayLabel(member),
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
                  userAvatarFallbackText: m != null
                      ? memberDisplayLabel(m)
                      : null,
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
