part of 'guild_navbar.dart';

class _RightTooltip extends StatefulWidget {
  final Widget content;
  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;

  const _RightTooltip({
    required this.content,
    required this.child,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  State<_RightTooltip> createState() => _RightTooltipState();
}

class _RightTooltipState extends State<_RightTooltip>
    with SingleTickerProviderStateMixin {
  final _layerLink = LayerLink();
  late final AnimationController _animController;
  late final Animation<double> _fadeAnim;
  late final Animation<double> _scaleAnim;
  OverlayEntry? _entry;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: FluxerMotionTheme.fastDuration,
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _scaleAnim = Tween<double>(
      begin: 0.98,
      end: 1,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animController.duration = context.motion.fast;
  }

  void _show() {
    if (_entry != null) {
      return;
    }
    final overlay = Overlay.of(context);
    final bgColor = widget.backgroundColor ?? context.colors.backgroundPrimary;
    final borderColor =
        widget.borderColor ?? context.colors.backgroundHeaderSecondary;

    final TextDirection direction = Directionality.of(context);
    _entry = OverlayEntry(
      builder: (_) => UnconstrainedBox(
        child: CompositedTransformFollower(
          link: _layerLink,
          targetAnchor: AlignmentDirectional.centerEnd.resolve(direction),
          followerAnchor: AlignmentDirectional.centerStart.resolve(direction),
          offset: Offset(direction == TextDirection.rtl ? -8 : 8, 0),
          showWhenUnlinked: false,
          child: IgnorePointer(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: ScaleTransition(
                scale: _scaleAnim,
                alignment: AlignmentDirectional.centerStart.resolve(direction),
                child: Material(
                  color: Colors.transparent,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 350 + _kArrowWidth,
                    ),
                    child: CustomPaint(
                      painter: _TooltipShapePainter(
                        fillColor: bgColor,
                        borderColor: borderColor,
                        textDirection: direction,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: _kArrowWidth + 16,
                          end: 16,
                          top: 12,
                          bottom: 12,
                        ),
                        child: widget.content,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    overlay.insert(_entry!);
    _animController.forward();
  }

  void _hide() {
    if (_entry == null) {
      return;
    }
    unawaited(
      _animController.reverse().then((_) {
        _entry
          ?..remove()
          ..dispose();
        _entry = null;
      }),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    _entry
      ?..remove()
      ..dispose();
    _entry = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CompositedTransformTarget(
    link: _layerLink,
    child: MouseRegion(
      onEnter: (_) => _show(),
      onExit: (_) => _hide(),
      child: widget.child,
    ),
  );
}

class _UnavailableGuildsIndicator extends ConsumerWidget {
  final int count;

  const _UnavailableGuildsIndicator({required this.count});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String message = l10n.guildUnavailableOutageTooltip(count);
    final Widget badge = _GuildOutageIndicatorBadge();
    final Widget tooltipContent = Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: context.textStyles.label,
      ),
    );
    final Widget indicator = isTouchPrimaryInput(ref)
        ? FluxerGestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              ref
                  .read(toastProvider.notifier)
                  .show(
                    FluxerToast(
                      message: message,
                      variant: FluxerToastVariant.warning,
                    ),
                  );
            },
            child: badge,
          )
        : _RightTooltip(
            backgroundColor: context.colors.statusDanger,
            borderColor: context.colors.statusDanger,
            content: tooltipContent,
            child: badge,
          );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(children: [const SizedBox(width: 12), indicator]),
    );
  }
}

class _GuildOutageIndicatorBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Center(
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: context.colors.statusDanger, width: 2),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Center(
            child: PhosphorIcon(
              PhosphorIconsRegular.exclamationMark,
              color: context.colors.textPrimary,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}

class _SidebarDivider extends StatelessWidget {
  final Color color;

  const _SidebarDivider({required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Center(
        child: Container(
          width: 32,
          height: 2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ),
    );
  }
}

class _TooltipLabel extends StatelessWidget {
  final String label;

  const _TooltipLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label, style: context.textStyles.channelName);
  }
}

const Duration _kGuildCountsFreshTtl = Duration(minutes: 1);
final Map<String, DateTime> _guildCountsRequestedAt = <String, DateTime>{};

void _requestGuildCountsIfStale(WidgetRef ref, String guildId) {
  final DateTime now = DateTime.now();
  final DateTime? last = _guildCountsRequestedAt[guildId];
  if (last != null && now.difference(last) < _kGuildCountsFreshTtl) {
    return;
  }
  _guildCountsRequestedAt[guildId] = now;
  try {
    ref.read(gatewayConnectionProvider).requestGuildCounts(<String>[guildId]);
  } on Object {
    _guildCountsRequestedAt.remove(guildId);
  }
}

KeybindAction? _guildNavigationKeybindAction(
  int guildIndex,
  int selectedIndex,
) {
  if (guildIndex < 0 || selectedIndex < 0) {
    return null;
  }
  if (guildIndex < selectedIndex) {
    return KeybindAction.navGuildPrev;
  }
  if (guildIndex > selectedIndex) {
    return KeybindAction.navGuildNext;
  }
  return null;
}

final Map<KeybindAction, List<String>> _guildNavigationKeybindChips =
    <KeybindAction, List<String>>{
      for (final DefaultKeybind keybind in buildDefaultKeybinds())
        if (keybind.action == KeybindAction.navGuildPrev ||
            keybind.action == KeybindAction.navGuildNext)
          keybind.action: formatKeybindComboChips(keybind.combo),
    };

class _GuildTooltipContent extends ConsumerStatefulWidget {
  final Guild guild;
  final int unavailableCount;
  final int permissions;
  final bool isMuted;
  final DateTime? muteEndTime;

  const _GuildTooltipContent({
    required this.guild,
    this.unavailableCount = 0,
    this.permissions = 0,
    this.isMuted = false,
    this.muteEndTime,
  });

  @override
  ConsumerState<_GuildTooltipContent> createState() =>
      _GuildTooltipContentState();
}

class _GuildTooltipContentState extends ConsumerState<_GuildTooltipContent> {
  @override
  void initState() {
    super.initState();
    if (widget.guild.unavailable) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _requestGuildCountsIfStale(ref, widget.guild.id);
      }
    });
  }

  String _mutedText(FluxerLocalizations l10n, {required bool use12Hour}) {
    final DateTime? muteEndTime = widget.muteEndTime;
    if (muteEndTime == null) {
      return l10n.voiceParticipantTooltipMuted;
    }
    final String formattedDate = formatUserDateTime(
      muteEndTime.toLocal(),
      l10n.localeName,
      use12Hour: use12Hour,
    );
    return l10n.guildNavbarMutedUntil(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    final Guild guild = widget.guild;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Color mutedColor = context.colors.textPrimaryMuted;
    final bool use12Hour = ref.watch(use12HourTimeFormatProvider);
    final voiceRows =
        ref.watch(guildVoiceParticipantsProvider(guild.id)).value ??
        const <VoiceParticipantRow>[];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: guild.unavailable
          ? Text(
              l10n.guildUnavailableOutageTooltip(widget.unavailableCount),
              textAlign: TextAlign.center,
              style: context.textStyles.label,
            )
          : ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 220),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (guild.isPartnered ||
                          guild.isVerified ||
                          guild.features.contains('DISCOVERABLE') ||
                          guild.badgeIds.isNotEmpty) ...[
                        FluxerGuildBadge(
                          features: guild.features,
                          badgeIds: guild.badgeIds,
                          customBadgeLimit: 2,
                          onLightSurface: true,
                        ),
                        const SizedBox(width: 6),
                      ],
                      Flexible(
                        child: Text(
                          guild.name,
                          style: context.textStyles.channelName,
                        ),
                      ),
                    ],
                  ),
                  if (guild.features.contains(
                    'UNAVAILABLE_FOR_EVERYONE_BUT_STAFF',
                  )) ...[
                    const SizedBox(height: 6),
                    Text(
                      l10n.guildNavbarStaffOnlyAccessible(
                        ref.watch(
                          instanceRuntimeConfigProvider.select(
                            (config) => config.productName,
                          ),
                        ),
                      ),
                      style: context.textStyles.bodySmall.copyWith(
                        color: context.colors.statusDanger,
                      ),
                    ),
                  ],
                  if (hasPermission(
                        widget.permissions,
                        Permission.manageGuild,
                      ) &&
                      guild.features.contains('INVITES_DISABLED')) ...[
                    const SizedBox(height: 6),
                    Text(
                      guild.features.contains('RAID_DETECTED')
                          ? l10n.guildNavbarInvitesPausedRaid
                          : l10n.guildNavbarInvitesPaused,
                      style: context.textStyles.bodySmall.copyWith(
                        color: mutedColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                  if (widget.isMuted) ...[
                    const SizedBox(height: 6),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PhosphorIcon(
                          PhosphorIconsFill.bellSlash,
                          color: mutedColor,
                          size: 14,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _mutedText(l10n, use12Hour: use12Hour),
                          style: context.textStyles.bodySmall.copyWith(
                            color: mutedColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 8),
                  _GuildTooltipStats(guild: guild),
                  for (final row in voiceRows) ...[
                    const SizedBox(height: 6),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PhosphorIcon(
                          row.isScreenshare
                              ? PhosphorIconsFill.monitorPlay
                              : PhosphorIconsRegular.speakerHigh,
                          color: mutedColor,
                          size: 28,
                        ),
                        const SizedBox(width: 6),
                        _AvatarStack(avatarUrls: row.avatarUrls),
                      ],
                    ),
                  ],
                  _GuildTooltipKeybindHint(guildId: guild.id),
                ],
              ),
            ),
    );
  }
}

class _GuildTooltipStats extends ConsumerWidget {
  final Guild guild;

  const _GuildTooltipStats({required this.guild});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ({int online, int members}) counts = ref.watch(
      guildListViewModelProvider.select((GuildListViewState state) {
        final Guild current =
            state.guilds.where((Guild g) => g.id == guild.id).firstOrNull ??
            guild;
        return (online: current.onlineCount, members: current.memberCount);
      }),
    );
    final String onlineCount = NumberFormat.decimalPattern(
      l10n.localeName,
    ).format(counts.online);
    final TextStyle textStyle = context.textStyles.bodySmall.copyWith(
      color: context.colors.textPrimaryMuted,
      fontSize: 13,
      height: 1.2,
      fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
    );
    return Wrap(
      spacing: 10,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _GuildTooltipStat(
          dotColor: context.colors.statusOnline,
          label: l10n.discoveryOnlineCount(onlineCount),
          style: textStyle,
        ),
        _GuildTooltipStat(
          dotColor: context.colors.textTertiarySecondary,
          label: l10n.discoveryMemberCount(counts.members),
          style: textStyle,
        ),
      ],
    );
  }
}

class _GuildTooltipStat extends StatelessWidget {
  final Color dotColor;
  final String label;
  final TextStyle style;

  const _GuildTooltipStat({
    required this.dotColor,
    required this.label,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        const SizedBox(width: 5),
        Text(label, style: style, maxLines: 1, softWrap: false),
      ],
    );
  }
}

class _GuildTooltipKeybindHint extends ConsumerWidget {
  final String guildId;

  const _GuildTooltipKeybindHint({required this.guildId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? activeGuildId = ref.watch(activeGuildIdProvider);
    final ({int guildIndex, int selectedIndex}) indexes = ref.watch(
      guildListViewModelProvider.select((GuildListViewState state) {
        final List<Guild> guilds = state.guilds;
        return (
          guildIndex: guilds.indexWhere((Guild g) => g.id == guildId),
          selectedIndex: activeGuildId == null
              ? -1
              : guilds.indexWhere((Guild g) => g.id == activeGuildId),
        );
      }),
    );
    final KeybindAction? action = _guildNavigationKeybindAction(
      indexes.guildIndex,
      indexes.selectedIndex,
    );
    if (action == null) {
      return const SizedBox.shrink();
    }
    final List<String> keys = _guildNavigationKeybindChips[action] ?? const [];
    if (keys.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: FluxerKeybindHint(keys: keys),
    );
  }
}
