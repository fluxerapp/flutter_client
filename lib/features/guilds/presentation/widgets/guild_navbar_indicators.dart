part of 'guild_navbar.dart';

class _AvatarStack extends StatelessWidget {
  final List<String> avatarUrls;

  const _AvatarStack({required this.avatarUrls});

  @override
  Widget build(BuildContext context) {
    if (avatarUrls.isEmpty) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      width: avatarUrls.length * 20.0 + 8,
      height: 28,
      child: Stack(
        children: [
          for (var i = 0; i < avatarUrls.length; i++)
            Positioned(
              left: i * 20.0,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colors.backgroundPrimary,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: avatarUrls[i],
                    width: 24,
                    height: 24,
                    memCacheWidth: _guildNavbarIconMemCache(context, 24),
                    memCacheHeight: _guildNavbarIconMemCache(context, 24),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _GuildBadge extends StatelessWidget {
  final bool isPartnered;

  const _GuildBadge({required this.isPartnered});

  @override
  Widget build(BuildContext context) {
    if (isPartnered) {
      return Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: context.colors.brandPrimary,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: PhosphorIcon(
            PhosphorIconsBold.infinity,
            color: context.colors.textOnBrandPrimary,
            size: 10,
          ),
        ),
      );
    }
    return PhosphorIcon(
      PhosphorIconsFill.sealCheck,
      color: context.colors.textPrimary,
      size: 16,
    );
  }
}

class _VoiceActivityBadge extends StatelessWidget {
  final VoiceActivityType type;

  const _VoiceActivityBadge({required this.type});

  @override
  Widget build(BuildContext context) {
    final IconData icon;
    switch (type) {
      case VoiceActivityType.video:
        icon = PhosphorIconsFill.videoCamera;
      case VoiceActivityType.screenshare:
        icon = PhosphorIconsFill.monitor;
      case VoiceActivityType.voice:
        icon = PhosphorIconsFill.speakerHigh;
      case VoiceActivityType.none:
        return const SizedBox.shrink();
    }
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: context.colors.statusOnline,
        shape: BoxShape.circle,
        border: Border.all(
          color: context.colors.serverSidebarBackground,
          width: 3,
        ),
      ),
      child: Center(
        child: PhosphorIcon(
          icon,
          color: context.colors.textOnBrandPrimary,
          size: 12,
        ),
      ),
    );
  }
}

class _PauseBadge extends StatelessWidget {
  const _PauseBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: context.colors.interactiveMuted,
        shape: BoxShape.circle,
        border: Border.all(
          color: context.colors.serverSidebarBackground,
          width: 3,
        ),
      ),
      child: Center(
        child: PhosphorIcon(
          PhosphorIconsFill.pause,
          size: 12,
          color: context.colors.textOnBrandPrimary,
        ),
      ),
    );
  }
}

const double _kArrowWidth = 5;
const double _kArrowHeight = 10;
const double _kBorderRadius = 8;

class _GuildNotificationChannelIcon extends ConsumerWidget {
  const _GuildNotificationChannelIcon({
    required this.channelId,
    required this.fallbackType,
    required this.color,
  });

  final String channelId;
  final ChannelType fallbackType;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Channel? full = ref.watch(channelByIdProvider(channelId)).value;
    final int? effectivePermissionBits = ref
        .watch(effectiveGuildChannelPermissionBitsProvider(channelId))
        .value;
    if (full == null) {
      return ChannelIcon(type: fallbackType, color: color);
    }
    return ChannelIcon(
      type: full.type,
      channel: full,
      effectivePermissionBits: effectivePermissionBits,
      color: color,
    );
  }
}

class _TooltipShapePainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;

  _TooltipShapePainter({required this.fillColor, required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    const r = _kBorderRadius;
    const left = _kArrowWidth;
    final centerY = size.height / 2;
    final arrowTop = centerY - _kArrowHeight / 2;
    final arrowBottom = centerY + _kArrowHeight / 2;

    final path = Path()
      // Top-left corner
      ..moveTo(left + r, 0)
      // Top edge → top-right corner
      ..lineTo(size.width - r, 0)
      ..arcToPoint(Offset(size.width, r), radius: const Radius.circular(r))
      // Right edge → bottom-right corner
      ..lineTo(size.width, size.height - r)
      ..arcToPoint(
        Offset(size.width - r, size.height),
        radius: const Radius.circular(r),
      )
      // Bottom edge → bottom-left corner
      ..lineTo(left + r, size.height)
      ..arcToPoint(
        Offset(left, size.height - r),
        radius: const Radius.circular(r),
      )
      // Left edge down to arrow
      ..lineTo(left, arrowBottom)
      // Arrow pointing left
      ..lineTo(0, centerY)
      ..lineTo(left, arrowTop)
      // Left edge up to top-left corner
      ..lineTo(left, r)
      ..arcToPoint(const Offset(left + r, 0), radius: const Radius.circular(r))
      ..close();

    canvas
      ..drawPath(path, Paint()..color = fillColor)
      ..drawPath(
        path,
        Paint()
          ..color = borderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1,
      );
  }

  @override
  bool shouldRepaint(_TooltipShapePainter old) =>
      old.fillColor != fillColor || old.borderColor != borderColor;
}
