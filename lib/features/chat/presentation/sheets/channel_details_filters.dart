part of 'channel_details_sheet.dart';

class _SearchFilterChip extends StatelessWidget {
  const _SearchFilterChip({
    required this.label,
    required this.onTap,
    this.value,
    this.icon,
    this.isActive = false,
    this.onRemove,
  });

  final String label;
  final String? value;
  final IconData? icon;
  final bool isActive;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final background = isActive
        ? colors.brandPrimary
        : colors.backgroundSecondaryAlt;
    final borderColor = isActive ? colors.brandPrimary : colors.borderColor;
    final labelColor = isActive ? Colors.white : colors.textSecondary;
    final valueColor = isActive ? Colors.white : colors.textPrimary;
    final iconColor = isActive ? Colors.white : colors.textSecondary;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                PhosphorIcon(icon!, size: 14, color: iconColor),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: context.textStyles.label.copyWith(
                  color: labelColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (value != null && value!.isNotEmpty) ...[
                const SizedBox(width: 4),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 120),
                  child: Text(
                    value!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: context.textStyles.label.copyWith(color: valueColor),
                  ),
                ),
              ],
              if (isActive && onRemove != null) ...[
                const SizedBox(width: 6),
                FluxerGestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onRemove,
                  child: const PhosphorIcon(
                    PhosphorIconsBold.x,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _PickerUser {
  const _PickerUser({
    required this.id,
    required this.username,
    required this.displayName,
    required this.discriminator,
    this.avatar,
    this.avatarColor,
    this.status = 'offline',
  });

  factory _PickerUser.fromUserRow(db.User user, {String? nick}) {
    final display =
        nick ??
        user.globalName ??
        (user.username.isNotEmpty ? user.username : user.id);
    return _PickerUser(
      id: user.id,
      username: user.username,
      displayName: display,
      discriminator: user.discriminator,
      avatar: user.avatar,
      avatarColor: user.avatarColor,
      status: user.status,
    );
  }

  factory _PickerUser.fromMember(
    Member member, {
    required String discriminator,
  }) {
    return _PickerUser(
      id: member.id,
      username: member.username,
      displayName: member.displayName,
      discriminator: discriminator,
      avatar: member.avatar,
      avatarColor: member.avatarColor,
      status: member.status,
    );
  }

  final String id;
  final String username;
  final String displayName;
  final String discriminator;
  final String? avatar;
  final int? avatarColor;
  final String status;

  String get tag {
    if (username.isEmpty) {
      return '@$id';
    }
    final String? visibleDiscriminator = visibleUserDiscriminator(
      discriminator,
    );
    if (visibleDiscriminator == null) {
      return '@$username';
    }
    return '@$username#$visibleDiscriminator';
  }
}

const Duration _kUserFilterSearchDebounce = Duration(milliseconds: 300);

class _DmUserFilterSheetLoader extends ConsumerStatefulWidget {
  const _DmUserFilterSheetLoader({
    required this.channelId,
    required this.initialSelectedIds,
    required this.scrollController,
    required this.onDone,
  });

  final String channelId;
  final Set<String> initialSelectedIds;
  final ScrollController scrollController;
  final ValueChanged<List<_PickerUser>> onDone;

  @override
  ConsumerState<_DmUserFilterSheetLoader> createState() =>
      _DmUserFilterSheetLoaderState();
}

class _DmUserFilterSheetLoaderState
    extends ConsumerState<_DmUserFilterSheetLoader> {
  late final Future<List<_PickerUser>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = _loadDmCandidates();
  }

  Future<List<_PickerUser>> _loadDmCandidates() async {
    final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    final String? currentUserId = ref.read(currentUserIdProvider);
    final db.DmChannel? dmRow = await database.dmChannelDao.getDmChannelById(
      widget.channelId,
    );

    final Set<String> ids = <String>{
      if (dmRow != null)
        ...buildDmRemoteRecipientIds(
          parseDmChannelRecipientIds(dmRow.recipientIds),
          dmRow.recipientId,
        ),
      if (currentUserId != null && currentUserId.isNotEmpty) currentUserId,
    };

    final List<db.User> users = await database.userDao.getUsersByIds(
      ids.toList(),
    );
    return users.map(_PickerUser.fromUserRow).toList()..sort(
      (a, b) =>
          a.displayName.toLowerCase().compareTo(b.displayName.toLowerCase()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<_PickerUser>>(
      future: _usersFuture,
      builder: (BuildContext context, AsyncSnapshot<List<_PickerUser>> snap) {
        if (!snap.hasData) {
          return _scrollableSheetPlaceholder(
            context,
            widget.scrollController,
            const Center(child: FluxerLoadingSpinner()),
          );
        }
        return _UserFilterSheet(
          availableUsers: snap.data!,
          initialSelectedIds: widget.initialSelectedIds,
          scrollController: widget.scrollController,
          onDone: widget.onDone,
        );
      },
    );
  }
}

class _GuildUserSearchFilterSheet extends ConsumerStatefulWidget {
  const _GuildUserSearchFilterSheet({
    required this.guildId,
    required this.initialSelectedIds,
    required this.scrollController,
    required this.onDone,
  });

  final String guildId;
  final Set<String> initialSelectedIds;
  final ScrollController scrollController;
  final ValueChanged<List<_PickerUser>> onDone;

  @override
  ConsumerState<_GuildUserSearchFilterSheet> createState() =>
      _GuildUserSearchFilterSheetState();
}

class _GuildUserSearchFilterSheetState
    extends ConsumerState<_GuildUserSearchFilterSheet> {
  late final TextEditingController _searchController;
  late final Map<String, _PickerUser> _selectedById;
  List<_PickerUser> _results = <_PickerUser>[];
  bool _isLoading = false;
  String _searchTerm = '';
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _selectedById = <String, _PickerUser>{
      for (final String id in widget.initialSelectedIds)
        id: _PickerUser(
          id: id,
          username: '',
          displayName: id,
          discriminator: '',
        ),
    };
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() => _searchTerm = _searchController.text);
    _searchDebounce?.cancel();
    _searchDebounce = Timer(_kUserFilterSearchDebounce, () {
      unawaited(_fetchUsers(_searchTerm.trim()));
    });
  }

  Future<void> _fetchUsers(String query) async {
    if (query.isEmpty) {
      if (mounted) {
        setState(() {
          _results = <_PickerUser>[];
          _isLoading = false;
        });
      }
      return;
    }
    if (mounted) {
      setState(() => _isLoading = true);
    }
    List<_PickerUser> pickers = <_PickerUser>[];
    try {
      final ParsedMentionQuery parsed = parseMentionQuery(query);
      final String searchQuery = parsed.usernameQuery.trim();
      final ParsedMentionQuery rankingQuery =
          parsed.hasTagSeparator &&
              searchQuery.isNotEmpty &&
              (parsed.tagQuery ?? '').trim().isEmpty
          ? parseMentionQuery(searchQuery)
          : parsed;
      final GuildMentionMemberSearch search = ref.read(
        guildMentionMemberSearchProvider,
      );
      List<Member> members = await search.searchCached(
        guildId: widget.guildId,
        parsed: rankingQuery,
      );
      if (searchQuery.isNotEmpty) {
        members = (await search.searchCachedThenGateway(
          guildId: widget.guildId,
          query: searchQuery,
          parsed: rankingQuery,
        )).members;
      }
      final Map<String, String> discriminatorByUserId = await search
          .discriminatorsFor(members);
      pickers = members
          .map(
            (Member member) => _PickerUser.fromMember(
              member,
              discriminator:
                  visibleUserDiscriminator(discriminatorByUserId[member.id]) ??
                  '',
            ),
          )
          .toList();
    } on Object {
      pickers = <_PickerUser>[];
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _results = pickers;
      _isLoading = false;
    });
  }

  void _toggle(_PickerUser user) {
    setState(() {
      if (_selectedById.containsKey(user.id)) {
        _selectedById.remove(user.id);
      } else {
        _selectedById[user.id] = user;
      }
    });
  }

  List<_PickerUser> _selectionForResult() => _selectedById.values.toList();

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    return Padding(
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      ),
      child: Column(
        children: <Widget>[
          FluxerInput(
            controller: _searchController,
            hint: l10n.channelDetailsSearchUsersHint,
            prefixIcon: const PhosphorIcon(PhosphorIconsBold.magnifyingGlass),
            suffixIcon: _searchTerm.isNotEmpty
                ? const PhosphorIcon(PhosphorIconsBold.x)
                : null,
            onSuffixTap: _searchTerm.isNotEmpty
                ? () {
                    _searchController.clear();
                  }
                : null,
            textInputAction: TextInputAction.search,
            autofocus: true,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: _searchTerm.trim().isEmpty
                ? _scrollableSheetPlaceholder(
                    context,
                    widget.scrollController,
                    Center(
                      child: Text(
                        l10n.channelDetailsSearchUsersTypeToSearch,
                        style: context.textStyles.bodySmall.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ),
                  )
                : _isLoading
                ? _scrollableSheetPlaceholder(
                    context,
                    widget.scrollController,
                    const Center(child: FluxerLoadingSpinner()),
                  )
                : _results.isEmpty
                ? _scrollableSheetPlaceholder(
                    context,
                    widget.scrollController,
                    Center(
                      child: Text(
                        l10n.channelDetailsSearchUsersEmpty,
                        style: context.textStyles.bodySmall.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ),
                  )
                : ListView.separated(
                    controller: widget.scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: FluxerBottomSheet.scrollViewPadding(
                      context,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                    ),
                    itemCount: _results.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 4),
                    itemBuilder: (BuildContext context, int index) {
                      final _PickerUser user = _results[index];
                      final bool isSelected = _selectedById.containsKey(
                        user.id,
                      );
                      return _UserFilterRow(
                        user: user,
                        isSelected: isSelected,
                        onTap: () => _toggle(user),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FluxerButton.primary(
              label: l10n.channelDetailsDone,
              onPressed: () => widget.onDone(_selectionForResult()),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserFilterSheet extends StatefulWidget {
  const _UserFilterSheet({
    required this.availableUsers,
    required this.initialSelectedIds,
    required this.scrollController,
    required this.onDone,
  });

  final List<_PickerUser> availableUsers;
  final Set<String> initialSelectedIds;
  final ScrollController scrollController;
  final ValueChanged<List<_PickerUser>> onDone;

  @override
  State<_UserFilterSheet> createState() => _UserFilterSheetState();
}

class _UserFilterSheetState extends State<_UserFilterSheet> {
  late final TextEditingController _searchController;
  late final Set<String> _selectedIds;
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _selectedIds = <String>{...widget.initialSelectedIds};
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() => _searchTerm = _searchController.text);
  }

  void _toggle(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  List<_PickerUser> get _filteredUsers {
    final q = _searchTerm.trim().toLowerCase();
    if (q.isEmpty) {
      return widget.availableUsers;
    }
    return [
      for (final user in widget.availableUsers)
        if (user.displayName.toLowerCase().contains(q) ||
            user.username.toLowerCase().contains(q) ||
            user.tag.toLowerCase().contains(q))
          user,
    ];
  }

  List<_PickerUser> _selectionForResult() {
    final byId = {for (final u in widget.availableUsers) u.id: u};
    return [
      for (final id in _selectedIds)
        if (byId[id] != null)
          byId[id]!
        else
          _PickerUser(id: id, username: '', displayName: id, discriminator: ''),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final filtered = _filteredUsers;

    return Padding(
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      ),
      child: Column(
        children: [
          FluxerInput(
            controller: _searchController,
            hint: l10n.channelDetailsSearchUsersHint,
            prefixIcon: const PhosphorIcon(PhosphorIconsBold.magnifyingGlass),
            suffixIcon: _searchTerm.isNotEmpty
                ? const PhosphorIcon(PhosphorIconsBold.x)
                : null,
            onSuffixTap: _searchTerm.isNotEmpty
                ? () {
                    _searchController.clear();
                  }
                : null,
            textInputAction: TextInputAction.search,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: filtered.isEmpty
                ? _scrollableSheetPlaceholder(
                    context,
                    widget.scrollController,
                    Center(
                      child: Text(
                        _searchTerm.isNotEmpty
                            ? l10n.channelDetailsSearchUsersEmpty
                            : l10n.channelDetailsSearchUsersNoAvailable,
                        style: context.textStyles.bodySmall.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ),
                  )
                : ListView.separated(
                    controller: widget.scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: FluxerBottomSheet.scrollViewPadding(
                      context,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                    ),
                    itemCount: filtered.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 4),
                    itemBuilder: (context, index) {
                      final user = filtered[index];
                      final isSelected = _selectedIds.contains(user.id);
                      return _UserFilterRow(
                        user: user,
                        isSelected: isSelected,
                        onTap: () => _toggle(user.id),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FluxerButton.primary(
              label: l10n.channelDetailsDone,
              onPressed: () => widget.onDone(_selectionForResult()),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserFilterRow extends StatelessWidget {
  const _UserFilterRow({
    required this.user,
    required this.isSelected,
    required this.onTap,
  });

  final _PickerUser user;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final accent = colors.brandPrimaryLight;
    final background = isSelected
        ? accent.withValues(alpha: 0.10)
        : Colors.transparent;
    final borderColor = isSelected ? accent : colors.borderColor;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              FluxerAvatar.user(
                imageUrl: FluxerMediaUrl.userAvatar(
                  userId: user.id,
                  hash: user.avatar,
                ),
                fallbackText: user.displayName,
                avatarColor: user.avatarColor,
                size: 36,
                showStatus: false,
                userId: user.id,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      user.displayName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          (isSelected
                                  ? context.textStyles.channelName
                                  : context.textStyles.username)
                              .copyWith(
                                fontSize: 15,
                                color: colors.textPrimary,
                              ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      user.tag,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyles.timestamp.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 12),
                PhosphorIcon(PhosphorIconsBold.check, size: 20, color: accent),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _HasFilterSheet extends StatefulWidget {
  const _HasFilterSheet({
    required this.initialSelected,
    required this.scrollController,
    required this.onDone,
  });

  final Set<MessageSearchContentFilter> initialSelected;
  final ScrollController scrollController;
  final ValueChanged<Set<MessageSearchContentFilter>> onDone;

  @override
  State<_HasFilterSheet> createState() => _HasFilterSheetState();
}

class _HasFilterSheetState extends State<_HasFilterSheet> {
  late final Set<MessageSearchContentFilter> _selected;

  @override
  void initState() {
    super.initState();
    _selected = <MessageSearchContentFilter>{...widget.initialSelected};
  }

  void _toggle(MessageSearchContentFilter value) {
    setState(() {
      if (_selected.contains(value)) {
        _selected.remove(value);
      } else {
        _selected.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;

    return Padding(
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                l10n.channelDetailsHasFilterPrompt,
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              controller: widget.scrollController,
              padding: FluxerBottomSheet.scrollViewPadding(
                context,
                padding: const EdgeInsets.symmetric(vertical: 4),
              ),
              itemCount: kChannelSearchHasContentFilters.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final value = kChannelSearchHasContentFilters[index];
                return ChannelSearchOptionCard(
                  icon: _contentIcon(value),
                  label: _contentLabel(l10n, value),
                  description: _contentDescription(l10n, value),
                  isSelected: _selected.contains(value),
                  onTap: () => _toggle(value),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FluxerButton.primary(
              label: l10n.channelDetailsDone,
              onPressed: () => widget.onDone(_selected),
            ),
          ),
        ],
      ),
    );
  }
}
