import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';

const double kUserAreaContentHeight = 36;
const double kUserPanelControlSize = 32;
const double kUserPanelControlIconSize = 20;

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

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final bool enabled = widget.onPressed != null;
    final Color foreground = widget.isActive
        ? colors.controlButtonDangerText
        : widget.isSelected
        ? colors.surfaceInteractiveSelectedColor
        : colors.controlButtonNormalText;

    Color background = Colors.transparent;
    if (enabled && _hovered) {
      if (widget.isActive) {
        background = _mixColor(
          Colors.transparent,
          colors.controlButtonDangerText,
          0.2,
        );
      } else if (widget.isSelected) {
        background = _mixColor(Colors.transparent, colors.textPrimary, 0.12);
      } else {
        background = _mixColor(
          Colors.transparent,
          colors.controlButtonNormalText,
          0.1,
        );
      }
    } else if (widget.isActive) {
      background = _mixColor(
        Colors.transparent,
        colors.controlButtonDangerText,
        0.1,
      );
    } else if (widget.isSelected) {
      background = colors.backgroundModifierSelected;
    }

    final Widget button = MouseRegion(
      onEnter: enabled ? (_) => setState(() => _hovered = true) : null,
      onExit: enabled ? (_) => setState(() => _hovered = false) : null,
      child: SizedBox(
        width: kUserPanelControlSize,
        height: kUserPanelControlSize,
        child: Material(
          color: background,
          borderRadius: layout.radiusMd,
          child: InkWell(
            borderRadius: layout.radiusMd,
            onTap: widget.onPressed,
            child: Center(
              child: IconTheme(
                data: IconThemeData(
                  color:
                      enabled &&
                          _hovered &&
                          !widget.isActive &&
                          !widget.isSelected
                      ? colors.controlButtonHoverText
                      : foreground,
                  size: kUserPanelControlIconSize,
                ),
                child: widget.icon,
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

    final Widget button = MouseRegion(
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
    );

    if (widget.tooltip == null || widget.tooltip!.isEmpty) {
      return button;
    }
    return Tooltip(message: widget.tooltip, child: button);
  }
}
