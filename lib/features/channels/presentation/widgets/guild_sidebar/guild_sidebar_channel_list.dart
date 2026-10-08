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

  @override
  Widget build(BuildContext context) {
    _rememberActiveGuild();
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        for (final MapEntry<String, Guild> entry in _guildsById.entries)
          Offstage(
            offstage: entry.key != widget.activeGuildId,
            child: _GuildSidebarChannelList(
              key: ValueKey<String>(entry.key),
              guildId: entry.key,
              guild: entry.value,
              isActive: entry.key == widget.activeGuildId,
              onHeaderTap: widget.onHeaderTap,
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
    super.key,
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
  static const double _scrollRestoreStep = 480;

  late final ScrollController _scrollController;
  late final GuildScrollIndicatorController _scrollIndicator;
  final Map<String, GlobalKey> _channelKeys = <String, GlobalKey>{};
  bool _restoring = false;
  bool _needsScrollClamp = false;
  bool _deferChannelList = false;
  GuildSidebarScrollStore? _scrollStore;
  Widget? _inactiveList;

  double _savedScrollOffset() => _scrollStore?.offsetFor(widget.guildId) ?? 0;

  void _syncScrollRestoreState() {
    final bool hasSavedOffset = _savedScrollOffset() > 0;
    _needsScrollClamp = hasSavedOffset;
    _deferChannelList = widget.isActive && hasSavedOffset;
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
    _scrollController = ScrollController()..addListener(_persistScroll);
    _scrollIndicator = GuildScrollIndicatorController(
      scrollController: _scrollController,
      itemKeys: _channelKeys,
      resolveSeverity: _resolveChannelScrollSeverity,
      isMounted: () => mounted,
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
      _refreshGuildPermissions();
      _syncScrollRestoreState();
      _scheduleScrollRestore();
    }
  }

  void _scheduleScrollRestore() {
    if (_deferChannelList) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !widget.isActive) {
          return;
        }
        setState(() {
          _deferChannelList = false;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted || !widget.isActive) {
            return;
          }
          _clampScrollOffset();
        });
      });
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !widget.isActive) {
        return;
      }
      _clampScrollOffset();
      _scrollIndicator.scheduleUpdate();
    });
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
    final double target = _savedScrollOffset().clamp(0.0, maxExtent);
    final double current = _scrollController.offset;
    if (current >= target - 0.5) {
      _restoring = true;
      _scrollController.jumpTo(target);
      _restoring = false;
      setState(() {
        _needsScrollClamp = false;
      });
      _scrollIndicator.scheduleUpdate();
      return;
    }
    _restoring = true;
    _scrollController.jumpTo((current + _scrollRestoreStep).clamp(0.0, target));
    _restoring = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !widget.isActive) {
        return;
      }
      _clampScrollOffset();
    });
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
    if (_deferChannelList) {
      return const SizedBox.shrink();
    }
    _scrollStore = ref.read(guildSidebarScrollStoreProvider);
    final List<GuildSidebarEntry> sidebarEntries = ref.watch(
      guildSidebarEntriesProvider,
    );
    ref
      ..listen(guildReadStateProvider.select((s) => s[widget.guildId]), (_, _) {
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
          cacheExtent: 600,
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
        label: FluxerLocalizations.of(context).scrollIndicatorNewMessage,
        topInset: kGuildSidebarScrollIndicatorTopInset,
        child: Opacity(
          opacity: _needsScrollClamp ? 0 : 1,
          child: channelListView,
        ),
      ),
    );
    _inactiveList = child;
    return child;
  }
}
