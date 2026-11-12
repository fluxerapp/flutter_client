import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

const double kUserAreaContentHeight = 36;
const double kUserPanelControlSize = 32;
const double kUserPanelControlIconSize = 20;
const double kUserAreaDesktopBoxHeight = 58;
const double kUserAreaDesktopBoxInset = 6;
const double kUserAreaDesktopInnerInset = 8;
const double kUserAreaDesktopContentHeight = 32;

class UserAreaDivider extends StatelessWidget {
  const UserAreaDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: context.colors.userAreaDividerColor);
  }
}

Color _mixColor(Color base, Color tint, double opacity) {
  return Color.alphaBlend(tint.withValues(alpha: opacity), base);
}

class UserPanelControlButton extends StatefulWidget {
  const UserPanelControlButton({
    required this.icon,
    required this.onPressed,
    this.isActive = false,
    this.isSelected = false,
    this.tooltip,
    super.key,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final bool isActive;
  final bool isSelected;
  final String? tooltip;

  @override
  State<UserPanelControlButton> createState() => _UserPanelControlButtonState();
}

class _UserPanelControlButtonState extends State<UserPanelControlButton> {
  bool _hovered = false;

  Color _background(BuildContext context, {required bool hovered}) {
    final colors = context.colors;
    if (hovered) {
      if (widget.isActive) {
        return _mixColor(
          Colors.transparent,
          colors.controlButtonDangerText,
          0.2,
        );
      }
      if (widget.isSelected) {
        return _mixColor(Colors.transparent, colors.textPrimary, 0.12);
      }
      return _mixColor(Colors.transparent, colors.controlButtonNormalText, 0.1);
    }
    if (widget.isActive) {
      return _mixColor(Colors.transparent, colors.controlButtonDangerText, 0.1);
    }
    if (widget.isSelected) {
      return colors.backgroundModifierSelected;
    }
    return Colors.transparent;
  }

  Color _foreground(BuildContext context, {required bool hovered}) {
    final colors = context.colors;
    if (hovered && !widget.isActive && !widget.isSelected) {
      return colors.controlButtonHoverText;
    }
    return widget.isActive
        ? colors.controlButtonDangerText
        : widget.isSelected
        ? colors.surfaceInteractiveSelectedColor
        : colors.controlButtonNormalText;
  }

  Widget _buildDesktop(BuildContext context) {
    final bool enabled = widget.onPressed != null;
    final Widget button = FluxerTappable(
      onTap: widget.onPressed,
      selected: widget.isSelected,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool hovered = enabled && states.contains(WidgetState.hovered);
        return SizedBox.square(
          dimension: kUserPanelControlSize,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: _background(context, hovered: hovered),
              borderRadius: context.layout.radiusMd,
            ),
            child: Center(
              child: IconTheme(
                data: IconThemeData(
                  color: _foreground(context, hovered: hovered),
                  size: kUserPanelControlIconSize,
                ),
                child: widget.icon,
              ),
            ),
          ),
        );
      },
    );
    if (widget.tooltip == null || widget.tooltip!.isEmpty) {
      return button;
    }
    return FluxerTooltip(message: widget.tooltip, child: button);
  }

  @override
  Widget build(BuildContext context) {
    if (usesDesktopPointerUi(context)) {
      return _buildDesktop(context);
    }
    final layout = context.layout;
    final bool enabled = widget.onPressed != null;
    final bool hovered = enabled && _hovered;

    final Widget button = Semantics(
      button: true,
      enabled: enabled,
      selected: widget.isSelected,
      child: MouseRegion(
        onEnter: enabled ? (_) => setState(() => _hovered = true) : null,
        onExit: enabled ? (_) => setState(() => _hovered = false) : null,
        child: SizedBox(
          width: kUserPanelControlSize,
          height: kUserPanelControlSize,
          child: Material(
            color: _background(context, hovered: hovered),
            borderRadius: layout.radiusMd,
            child: InkWell(
              borderRadius: layout.radiusMd,
              onTap: widget.onPressed,
              child: Center(
                child: IconTheme(
                  data: IconThemeData(
                    color: _foreground(context, hovered: hovered),
                    size: kUserPanelControlIconSize,
                  ),
                  child: widget.icon,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.tooltip == null || widget.tooltip!.isEmpty) {
      return button;
    }
    return Tooltip(message: widget.tooltip, child: button);
  }
}

class UserPanelMediaButton extends StatefulWidget {
  const UserPanelMediaButton({
    required this.icon,
    required this.onPressed,
    this.isActive = false,
    this.enabled = true,
    this.tooltip,
    this.onContextMenu,
    super.key,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final bool isActive;
  final bool enabled;
  final String? tooltip;
  final void Function(TapDownDetails details)? onContextMenu;

  @override
  State<UserPanelMediaButton> createState() => _UserPanelMediaButtonState();
}

class _UserPanelMediaButtonState extends State<UserPanelMediaButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final bool canInteract = widget.enabled && widget.onPressed != null;
    if (usesDesktopPointerUi(context)) {
      return _buildDesktop(context, canInteract: canInteract);
    }

    Color background;
    Color border;
    Color foreground;

    if (!widget.enabled) {
      background = Colors.transparent;
      border = colors.panelControlBorder.withValues(alpha: 0.45);
      foreground = colors.controlButtonNormalText.withValues(alpha: 0.3);
    } else {
      background = _mixColor(
        Colors.transparent,
        colors.backgroundModifierHover,
        0.7,
      );
      border = colors.backgroundModifierHover;
      foreground = colors.controlButtonNormalText;
    }

    if (widget.enabled && widget.isActive) {
      background = _mixColor(Colors.transparent, colors.statusOnline, 0.15);
      border = _mixColor(Colors.transparent, colors.statusOnline, 0.3);
      foreground = colors.statusOnline;
    } else if (widget.enabled && canInteract && _hovered) {
      background = _mixColor(
        Colors.transparent,
        colors.controlButtonNormalText,
        0.1,
      );
      foreground = colors.controlButtonHoverText;
      border = colors.backgroundModifierSelected;
    }

    final Widget button = Semantics(
      button: true,
      enabled: canInteract,
      toggled: widget.isActive,
      label: widget.tooltip,
      child: MouseRegion(
        onEnter: canInteract ? (_) => setState(() => _hovered = true) : null,
        onExit: canInteract ? (_) => setState(() => _hovered = false) : null,
        child: SizedBox(
          height: kUserPanelControlSize,
          width: double.infinity,
          child: Material(
            color: background,
            shape: RoundedRectangleBorder(
              borderRadius: layout.radiusMd,
              side: BorderSide(color: border),
            ),
            child: InkWell(
              borderRadius: layout.radiusMd,
              onTap: canInteract ? widget.onPressed : null,
              onSecondaryTapDown: widget.onContextMenu,
              child: Center(
                child: IconTheme(
                  data: IconThemeData(
                    color: foreground,
                    size: kUserPanelControlIconSize,
                  ),
                  child: widget.icon,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.tooltip == null || widget.tooltip!.isEmpty) {
      return button;
    }
    return Tooltip(
      message: widget.tooltip,
      excludeFromSemantics: true,
      child: button,
    );
  }

  Widget _buildDesktop(BuildContext context, {required bool canInteract}) {
    final colors = context.colors;
    final layout = context.layout;
    final bool hovered = canInteract && _hovered;

    Color background = fluxerCssColorMix(
      colors.backgroundModifierHover,
      Colors.transparent,
      0.7,
    );
    Color border = colors.backgroundModifierHover;
    Color foreground = colors.controlButtonNormalText;
    if (widget.isActive) {
      background = fluxerCssColorMix(
        colors.statusOnline,
        Colors.transparent,
        hovered ? 0.2 : 0.15,
      );
      border = fluxerCssColorMix(colors.statusOnline, Colors.transparent, 0.3);
      foreground = colors.statusOnline;
    } else if (hovered) {
      background = fluxerCssColorMix(
        colors.controlButtonNormalText,
        Colors.transparent,
        0.1,
      );
      foreground = colors.controlButtonHoverText;
      border = colors.backgroundModifierSelected;
    }

    final Widget button = Semantics(
      button: true,
      enabled: canInteract,
      toggled: widget.isActive,
      label: widget.tooltip,
      child: MouseRegion(
        cursor: widget.enabled
            ? SystemMouseCursors.click
            : SystemMouseCursors.forbidden,
        onEnter: canInteract ? (_) => setState(() => _hovered = true) : null,
        onExit: canInteract ? (_) => setState(() => _hovered = false) : null,
        child: Opacity(
          opacity: widget.enabled ? 1 : 0.5,
          child: SizedBox(
            height: kUserPanelControlSize,
            width: double.infinity,
            child: Material(
              color: background,
              shape: RoundedRectangleBorder(
                borderRadius: layout.radiusMd,
                side: BorderSide(color: border),
              ),
              child: InkWell(
                borderRadius: layout.radiusMd,
                hoverColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                highlightColor: Colors.transparent,
                mouseCursor: widget.enabled
                    ? SystemMouseCursors.click
                    : SystemMouseCursors.forbidden,
                onTap: canInteract ? widget.onPressed : null,
                onSecondaryTapDown: widget.onContextMenu,
                child: Center(
                  child: IconTheme(
                    data: IconThemeData(
                      color: foreground,
                      size: kUserPanelControlIconSize,
                    ),
                    child: widget.icon,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.tooltip == null || widget.tooltip!.isEmpty) {
      return button;
    }
    return FluxerTooltip(message: widget.tooltip, child: button);
  }
}
