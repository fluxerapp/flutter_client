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

    _entry = OverlayEntry(
      builder: (_) => UnconstrainedBox(
        child: CompositedTransformFollower(
          link: _layerLink,
          targetAnchor: Alignment.centerRight,
          followerAnchor: Alignment.centerLeft,
          offset: const Offset(8, 0),
          showWhenUnlinked: false,
          child: IgnorePointer(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: ScaleTransition(
                scale: _scaleAnim,
                alignment: Alignment.centerLeft,
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
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: _kArrowWidth + 16,
                          right: 16,
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
        _entry?.remove();
        _entry = null;
      }),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    _entry?.remove();
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

class _GuildTooltipContent extends ConsumerWidget {
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

  String _mutedText(FluxerLocalizations l10n) {
    if (muteEndTime == null) {
      return l10n.voiceParticipantTooltipMuted;
    }
    final String formattedDate = DateFormat(
      'MMM d, y h:mm a',
      l10n.localeName,
    ).format(muteEndTime!);
    return l10n.guildNavbarMutedUntil(formattedDate);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final voiceRows =
        ref.watch(guildVoiceParticipantsProvider(guild.id)).value ??
        const <VoiceParticipantRow>[];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: guild.unavailable
          ? Text(
              l10n.guildUnavailableOutageTooltip(unavailableCount),
              textAlign: TextAlign.center,
              style: context.textStyles.label,
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (guild.isPartnered || guild.isVerified) ...[
                      _GuildBadge(isPartnered: guild.isPartnered),
                      const SizedBox(width: 6),
                    ],
                    Flexible(
                      child: Text(
                        guild.name,
                        style: context.textStyles.channelName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
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
                if (hasPermission(permissions, Permission.manageGuild) &&
                    guild.features.contains('INVITES_DISABLED')) ...[
                  const SizedBox(height: 6),
                  Text(
                    l10n.guildNavbarInvitesPaused,
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
                if (isMuted) ...[
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PhosphorIcon(
                        PhosphorIconsFill.bellSlash,
                        color: context.colors.textSecondary,
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _mutedText(l10n),
                        style: context.textStyles.bodySmall.copyWith(
                          color: context.colors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
                for (final row in voiceRows) ...[
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PhosphorIcon(
                        row.isScreenshare
                            ? PhosphorIconsFill.monitor
                            : PhosphorIconsFill.speakerHigh,
                        color: context.colors.textSecondary,
                        size: 28,
                      ),
                      const SizedBox(width: 6),
                      _AvatarStack(avatarUrls: row.avatarUrls),
                    ],
                  ),
                ],
              ],
            ),
    );
  }
}
