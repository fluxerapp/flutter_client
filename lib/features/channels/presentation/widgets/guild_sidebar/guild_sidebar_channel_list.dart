part of 'guild_sidebar.dart';

const int _maxCachedGuildChannelLists = 5;

class _GuildSidebarChannelListHost extends StatefulWidget {
  const _GuildSidebarChannelListHost({
    required this.activeGuildId,
    required this.guild,
    required this.onHeaderTap,
  });

  final String activeGuildId;
  final Guild guild;
  final VoidCallback? onHeaderTap;

  @override
  State<_GuildSidebarChannelListHost> createState() =>
      _GuildSidebarChannelListHostState();
}

class _GuildSidebarChannelListHostState
    extends State<_GuildSidebarChannelListHost> {
  final LinkedHashMap<String, Guild> _guildsById =
      LinkedHashMap<String, Guild>();

  void _rememberActiveGuild() {
    final String guildId = widget.activeGuildId;
    _guildsById
      ..remove(guildId)
      ..[guildId] = widget.guild;
    while (_guildsById.length > _maxCachedGuildChannelLists) {
      _guildsById.remove(_guildsById.keys.first);
    }
  }

  Widget _offstageGuildSidebarScope({
    required String guildId,
    required Guild guild,
    required bool isActive,
  }) {
    final Widget scope = FluxerEntranceSettleScope(
      key: ValueKey<String>(guildId),
      child: _GuildSidebarChannelList(
        guildId: guildId,
        guild: guild,
        isActive: isActive,
        onHeaderTap: widget.onHeaderTap,
      ),
    );
    if (isActive) {
      return scope;
    }
    return ExcludeSemantics(child: scope);
  }

  @override
  Widget build(BuildContext context) {
    _rememberActiveGuild();
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        for (final MapEntry<String, Guild> entry in _guildsById.entries)
          Offstage(
            offstage: entry.key != widget.activeGuildId,
            child: _offstageGuildSidebarScope(
              guildId: entry.key,
              guild: entry.value,
              isActive: entry.key == widget.activeGuildId,
            ),
          ),
      ],
    );
  }
}

class _GuildSidebarChannelList extends ConsumerStatefulWidget {
  const _GuildSidebarChannelList({
    required this.guildId,
    required this.guild,
    required this.isActive,
    required this.onHeaderTap,
  });

  final String guildId;
  final Guild guild;
  final bool isActive;
  final VoidCallback? onHeaderTap;

  @override
  ConsumerState<_GuildSidebarChannelList> createState() =>
      _GuildSidebarChannelListState();
}

class _GuildSidebarChannelListState
    extends ConsumerState<_GuildSidebarChannelList> {
  static const double _selectedRevealStep = 480;
  static const int _maxSelectedRevealSteps = 20;

  late final ScrollController _scrollController;
  late final GuildScrollIndicatorController _scrollIndicator;
  final Map<String, GlobalKey> _channelKeys = <String, GlobalKey>{};
  List<String> _indicatorOrder = const <String>[];
  bool _restoring = false;
  bool _needsScrollClamp = false;
  bool _needsSelectedReveal = false;
  bool _selectedRevealScheduled = false;
  int _selectedRevealSteps = 0;
  GuildSidebarScrollStore? _scrollStore;
  Widget? _inactiveList;

  double _savedScrollOffset() => _scrollStore?.offsetFor(widget.guildId) ?? 0;

  void _syncScrollRestoreState() {
    _needsScrollClamp = _savedScrollOffset() > 0;
    _needsSelectedReveal = _scrollStore?.offsetFor(widget.guildId) == null;
    _selectedRevealSteps = 0;
  }

  void _refreshGuildPermissions() {
    unawaited(
      ref
          .read(guildPermissionsProvider.notifier)
          .refreshPermissions(widget.guildId),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollStore = ref.read(guildSidebarScrollStoreProvider);
    _syncScrollRestoreState();
    _scrollController = ScrollController(
      initialScrollOffset: _savedScrollOffset(),
    )..addListener(_persistScroll);
    _scrollIndicator = GuildScrollIndicatorController(
      scrollController: _scrollController,
      itemKeys: _channelKeys,
      resolveSeverity: _resolveChannelScrollSeverity,
      isMounted: () => mounted,
      orderedIds: () => _indicatorOrder,
    )..attach();
    if (widget.isActive) {
      _refreshGuildPermissions();
      _scheduleScrollRestore();
    }
  }

  @override
  void didUpdateWidget(_GuildSidebarChannelList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isActive && widget.isActive) {
      _scrollIndicator.resetAnimation();
      _refreshGuildPermissions();
      _syncScrollRestoreState();
      _scheduleScrollRestore();
    }
  }

  void _scheduleScrollRestore() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !widget.isActive) {
        return;
      }
      _clampScrollOffset();
      if (_needsSelectedReveal) {
        _revealSelectedChannel();
      } else if (_scrollStore?.shownChannelFor(widget.guildId) !=
          ref.read(activeChannelIdProvider)) {
        _revealSelectedChannelIfHidden();
      }
      _scrollIndicator.scheduleUpdate();
    });
  }

  void _scheduleRevealIfHidden() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _revealSelectedChannelIfHidden();
    });
  }

  RenderBox? _selectedTile(String channelId) {
    final RenderObject? tile = _channelKeys[channelId]?.currentContext
        ?.findRenderObject();
    if (tile is RenderBox && tile.attached && tile.hasSize) {
      return tile;
    }
    return null;
  }

  bool _isTileFullyVisible(RenderBox tile) {
    final RenderObject viewport = RenderAbstractViewport.of(tile);
    if (viewport is! RenderBox) {
      return false;
    }
    final double top = tile.localToGlobal(Offset.zero, ancestor: viewport).dy;
    return top >= kGuildSidebarHeaderMinHeight &&
        top + tile.size.height <= viewport.size.height;
  }

  void _revealSelectedChannelIfHidden() {
    if (_needsSelectedReveal ||
        !mounted ||
        !widget.isActive ||
        !_scrollController.hasClients) {
      return;
    }
    final String? channelId = ref.read(activeChannelIdProvider);
    if (channelId == null || !_indicatorOrder.contains(channelId)) {
      return;
    }
    final RenderBox? tile = _selectedTile(channelId);
    if (tile != null && _isTileFullyVisible(tile)) {
      _scrollStore?.setShownChannel(widget.guildId, channelId);
      return;
    }
    setState(() {
      _needsSelectedReveal = true;
      _selectedRevealSteps = 0;
    });
    _scheduleSelectedReveal();
  }

  void _scheduleSelectedReveal() {
    if (_selectedRevealScheduled) {
      return;
    }
    _selectedRevealScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _selectedRevealScheduled = false;
      _revealSelectedChannel();
    });
  }

  void _revealSelectedChannel() {
    if (!_needsSelectedReveal ||
        !mounted ||
        !widget.isActive ||
        !_scrollController.hasClients ||
        _indicatorOrder.isEmpty) {
      return;
    }
    final String? channelId = ref.read(activeChannelIdProvider);
    if (channelId == null || !_indicatorOrder.contains(channelId)) {
      _finishSelectedReveal();
      return;
    }
    final ScrollPosition position = _scrollController.position;
    final RenderBox? tile = _selectedTile(channelId);
    if (tile != null) {
      _scrollStore?.setShownChannel(widget.guildId, channelId);
      if (!_isTileFullyVisible(tile)) {
        final double centered = RenderAbstractViewport.of(
          tile,
        ).getOffsetToReveal(tile, 0.5).offset;
        _jumpWithoutPersisting(
          centered.clamp(position.minScrollExtent, position.maxScrollExtent),
        );
      }
      _finishSelectedReveal();
      return;
    }
    if (_selectedRevealSteps == 0 &&
        position.pixels > position.minScrollExtent) {
      _selectedRevealSteps++;
      _jumpWithoutPersisting(position.minScrollExtent);
      _scheduleSelectedReveal();
      return;
    }
    if (position.pixels >= position.maxScrollExtent ||
        _selectedRevealSteps >= _maxSelectedRevealSteps) {
      _jumpWithoutPersisting(position.minScrollExtent);
      _finishSelectedReveal();
      return;
    }
    _selectedRevealSteps++;
    _jumpWithoutPersisting(
      (position.pixels + _selectedRevealStep).clamp(
        position.minScrollExtent,
        position.maxScrollExtent,
      ),
    );
    _scheduleSelectedReveal();
  }

  void _jumpWithoutPersisting(double offset) {
    _restoring = true;
    _scrollController.jumpTo(offset);
    _restoring = false;
  }

  void _finishSelectedReveal() {
    setState(() {
      _needsSelectedReveal = false;
    });
    _persistScroll();
    _scrollIndicator.scheduleUpdate();
  }

  @override
  void deactivate() {
    _persistScroll();
    super.deactivate();
  }

  @override
  void dispose() {
    _persistScroll();
    _scrollController
      ..removeListener(_persistScroll)
      ..dispose();
    _scrollIndicator.detach();
    super.dispose();
  }

  GuildScrollIndicatorSeverity? _resolveChannelScrollSeverity(
    String channelId,
  ) {
    return channelScrollIndicatorSeverity(
      ref: ref,
      guildId: widget.guildId,
      channelId: channelId,
      unread:
          ref.read(
            guildListedChannelUnreadSnapshotProvider(widget.guildId),
          )[channelId] ??
          ref.read(channelUnreadOrLastKnownProvider(channelId)),
    );
  }

  void _persistScroll() {
    if (_restoring) {
      return;
    }
    if (_scrollStore != null && _scrollController.hasClients) {
      _scrollStore!.setOffset(widget.guildId, _scrollController.offset);
    }
  }

  void _clampScrollOffset() {
    if (!_needsScrollClamp || !_scrollController.hasClients) {
      return;
    }
    final double maxExtent = _scrollController.position.maxScrollExtent;
    if (maxExtent <= 0) {
      return;
    }
    _needsScrollClamp = false;
    final double target = _savedScrollOffset().clamp(0.0, maxExtent);
    if ((_scrollController.offset - target).abs() > 0.5) {
      _jumpWithoutPersisting(target);
    }
    _scrollIndicator.scheduleUpdate();
  }

  void _scheduleScrollClamp() {
    if (!_needsScrollClamp) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _clampScrollOffset();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isActive) {
      return _inactiveList ?? const SizedBox.shrink();
    }
    _scrollStore = ref.read(guildSidebarScrollStoreProvider);
    final List<GuildSidebarEntry> sidebarEntries = ref.watch(
      guildSidebarEntriesProvider,
    );
    final List<String> indicatorOrder = <String>[
      for (final GuildSidebarEntry entry in sidebarEntries)
        if (entry.kind == GuildSidebarEntryKind.channel ||
            entry.kind == GuildSidebarEntryKind.thread)
          entry.channel!.id,
    ];
    if (!listEquals(indicatorOrder, _indicatorOrder)) {
      _indicatorOrder = indicatorOrder;
      if (_needsSelectedReveal && indicatorOrder.isNotEmpty) {
        _scheduleSelectedReveal();
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !widget.isActive) {
          return;
        }
        ref
            .read(recentGuildUnreadRetentionProvider.notifier)
            .retain(widget.guildId, _indicatorOrder);
      });
    }
    ref
      ..listen(guildReadStateProvider.select((s) => s[widget.guildId]), (_, _) {
        _scrollIndicator.scheduleUpdate();
      })
      ..listen(guildListedChannelUnreadSnapshotProvider(widget.guildId), (
        _,
        _,
      ) {
        _scrollIndicator.scheduleUpdate();
      })
      ..listen<List<GuildSidebarEntry>>(guildSidebarEntriesProvider, (
        List<GuildSidebarEntry>? previous,
        List<GuildSidebarEntry> next,
      ) {
        _scrollIndicator.scheduleUpdate();
        if (_needsScrollClamp && next.isNotEmpty) {
          _scheduleScrollClamp();
        }
      })
      ..listen<String?>(activeChannelIdProvider, (_, String? next) {
        if (next != null) {
          _scheduleRevealIfHidden();
        }
      });
    final bool showMembersEntry =
        !isMobileLayout(context) &&
        hasMembersPagePermission(
          ref.watch(guildPermissionsProvider)[widget.guildId] ?? 0,
        );
    final bool isMembersSelected = ref.watch(
      routeStateProvider.select(
        (RouteState routeState) =>
            routeState.kind == RouteKind.guildMembers &&
            routeState.guildId == widget.guildId,
      ),
    );
    final int membersOffset = showMembersEntry ? 2 : 0;
    final Size viewport = MediaQuery.sizeOf(context);
    final Widget channelListView = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return CustomScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          scrollCacheExtent: const ScrollCacheExtent.pixels(600),
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: GuildSidebarHeaderDelegate(
                guild: widget.guild,
                outageUnavailable: false,
                onTap: widget.onHeaderTap,
                bannerWidth: constraints.maxWidth,
                viewportHeight: viewport.height,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 12),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((
                  BuildContext context,
                  int index,
                ) {
                  final int entryIndex =
                      showMembersEntry && index >= membersOffset
                      ? index - membersOffset
                      : index;
                  if (showMembersEntry) {
                    if (index == 0) {
                      return _MembersSidebarTile(
                        guildId: widget.guildId,
                        isSelected: isMembersSelected,
                      );
                    }
                    if (index == 1) {
                      return Divider(
                        height: 1,
                        indent: 12,
                        endIndent: 12,
                        color: context.colors.borderColor,
                      );
                    }
                  }
                  final GuildSidebarEntry entry = sidebarEntries[entryIndex];
                  switch (entry.kind) {
                    case GuildSidebarEntryKind.categoryHeader:
                      return _CategoryHeader(
                        key: ValueKey<String>('cat:${entry.category!.id}'),
                        category: entry.category!,
                        isCollapsed: entry.isCategoryCollapsed,
                        guildId: widget.guildId,
                      );
                    case GuildSidebarEntryKind.channel:
                      final String channelId = entry.channel!.id;
                      return RepaintBoundary(
                        child: _ChannelTile(
                          key: ValueKey<String>(channelId),
                          tileKey: _channelKeys.putIfAbsent(
                            channelId,
                            GlobalKey.new,
                          ),
                          channel: entry.channel!,
                          guildId: widget.guildId,
                          guild: widget.guild,
                        ),
                      );
                    case GuildSidebarEntryKind.thread:
                      final String threadId = entry.channel!.id;
                      return RepaintBoundary(
                        child: ThreadSidebarTile(
                          key: ValueKey<String>('thread:$threadId'),
                          tileKey: _channelKeys.putIfAbsent(
                            threadId,
                            GlobalKey.new,
                          ),
                          thread: entry.channel!,
                          guildId: widget.guildId,
                          isLast: entry.isLastThread,
                        ),
                      );
                    case GuildSidebarEntryKind.voiceParticipants:
                      return VoiceChannelParticipantsList(
                        key: ValueKey<String>('vp:${entry.channel!.id}'),
                        guildId: entry.guildId!,
                        channelId: entry.channel!.id,
                      );
                  }
                }, childCount: membersOffset + sidebarEntries.length),
              ),
            ),
          ],
        );
      },
    );
    final Widget child = ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: GuildScrollIndicatorLayer(
        controller: _scrollIndicator,
        label: FluxerLocalizations.of(context).scrollIndicatorNewMessages,
        animated: false,
        topInset: kGuildSidebarScrollIndicatorTopInset,
        child: Opacity(
          opacity: _needsSelectedReveal && _indicatorOrder.isNotEmpty ? 0 : 1,
          child: channelListView,
        ),
      ),
    );
    _inactiveList = child;
    return child;
  }
}
