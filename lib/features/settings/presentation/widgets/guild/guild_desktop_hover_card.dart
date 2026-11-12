import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

typedef GuildDesktopHoverCardBuilder =
    Widget Function(BuildContext context, {required bool hovered});

class GuildDesktopHoverCard extends StatefulWidget {
  const GuildDesktopHoverCard({
    required this.builder,
    required this.overhang,
    this.cornerButton,
    super.key,
  });

  final GuildDesktopHoverCardBuilder builder;
  final double overhang;
  final Widget? cornerButton;

  @override
  State<GuildDesktopHoverCard> createState() => _GuildDesktopHoverCardState();
}

class _GuildDesktopHoverCardState extends State<GuildDesktopHoverCard> {
  bool _hovered = false;

  void _setHovered(bool value) {
    if (_hovered != value) {
      setState(() => _hovered = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget? cornerButton = widget.cornerButton;
    final Widget card = widget.builder(context, hovered: _hovered);
    if (cornerButton == null) {
      return MouseRegion(
        onEnter: (_) => _setHovered(true),
        onExit: (_) => _setHovered(false),
        child: card,
      );
    }
    final EdgeInsetsDirectional overhang = EdgeInsetsDirectional.only(
      top: widget.overhang,
      end: widget.overhang,
    );
    return FluxerDesktopOverhang(
      overhang: overhang,
      child: MouseRegion(
        hitTestBehavior: HitTestBehavior.deferToChild,
        onEnter: (_) => _setHovered(true),
        onExit: (_) => _setHovered(false),
        child: Stack(
          children: <Widget>[
            Padding(padding: overhang, child: card),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: AnimatedOpacity(
                duration: context.motion.normal,
                opacity: _hovered ? 1 : 0,
                child: IgnorePointer(ignoring: !_hovered, child: cornerButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GuildDesktopRoundActionButton extends StatelessWidget {
  const GuildDesktopRoundActionButton({
    required this.label,
    required this.onPressed,
    this.icon = PhosphorIconsBold.x,
    this.size = 30,
    this.danger = true,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final double size;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color hoverFill = danger ? colors.statusDanger : colors.brandPrimary;
    return FluxerButton.desktop(
      icon: icon,
      semanticLabel: label,
      onPressed: onPressed,
      showTooltip: true,
      circle: true,
      extent: size,
      iconSize: 12,
      background: colors.backgroundPrimary,
      hoverBackground: hoverFill,
      border: colors.backgroundHeaderSecondary,
      hoverBorder: hoverFill,
      hoverColor: danger ? Colors.white : colors.brandPrimaryFill,
      shadows: kFluxerDesktopCardHoverShadow,
      duration: context.motion.normal,
    );
  }
}
