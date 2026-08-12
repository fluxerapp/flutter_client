import 'dart:async';

import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const kContextMenuWidth = 220.0;
const kContextMenuTitleHeight = 40.0;
const kContextMenuEntranceDuration = Duration(milliseconds: 120);

/// Fade + scale entrance used by sidebar peek menus and context menus.
class ContextMenuEntranceAnimation extends StatelessWidget {
  const ContextMenuEntranceAnimation({
    required this.animation,
    required this.child,
    this.alignment = Alignment.center,
    super.key,
  });

  final Animation<double> animation;
  final Widget child;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.92, end: 1).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        ),
        alignment: alignment,
        child: child,
      ),
    );
  }
}

class ContextMenuEntranceAnimationHost extends StatefulWidget {
  const ContextMenuEntranceAnimationHost({
    required this.child,
    this.alignment = Alignment.center,
    super.key,
  });

  final Widget child;
  final Alignment alignment;

  @override
  State<ContextMenuEntranceAnimationHost> createState() =>
      _ContextMenuEntranceAnimationHostState();
}

class _ContextMenuEntranceAnimationHostState
    extends State<ContextMenuEntranceAnimationHost>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: kContextMenuEntranceDuration,
    );
    unawaited(_controller.forward());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContextMenuEntranceAnimation(
      animation: _controller,
      alignment: widget.alignment,
      child: widget.child,
    );
  }
}

class ContextMenuTitle extends StatelessWidget {
  const ContextMenuTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return SizedBox(
      height: kContextMenuTitleHeight,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: layout.s1),
          child: Text(
            title,
            style: context.textStyles.label.copyWith(
              color: context.colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class ContextMenuPanel extends StatelessWidget {
  final List<Widget> items;

  const ContextMenuPanel({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return Material(
      color: context.colors.backgroundPrimary,
      borderRadius: layout.radiusSm,
      elevation: 8,
      shadowColor: Colors.black45,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: layout.radiusSm,
          border: Border.all(color: context.colors.backgroundModifierAccent),
        ),
        child: SizedBox(
          width: kContextMenuWidth,
          child: Padding(
            padding: EdgeInsets.all(layout.s2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: items,
            ),
          ),
        ),
      ),
    );
  }
}

class ContextMenuItem extends StatefulWidget {
  final String label;
  final String? hint;
  final IconData? icon;
  final bool isDanger;
  final bool isDisabled;
  final VoidCallback onTap;
  final VoidCallback? onDisabledTap;

  const ContextMenuItem({
    required this.label,
    required this.onTap,
    this.hint,
    this.icon,
    this.isDanger = false,
    this.isDisabled = false,
    this.onDisabledTap,
    super.key,
  });

  @override
  State<ContextMenuItem> createState() => _ContextMenuItemState();
}

class _ContextMenuItemState extends State<ContextMenuItem> {
  var _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final Color textColor;
    final Color hoverBg;
    final Color hoverText;

    if (widget.isDanger) {
      textColor = colors.textDanger;
      hoverBg = colors.buttonDangerFill;
      hoverText = colors.buttonDangerText;
    } else if (widget.isDisabled) {
      textColor = colors.textPrimaryMuted;
      hoverBg = colors.backgroundModifierHover;
      hoverText = colors.textPrimaryMuted;
    } else {
      textColor = colors.textSecondary;
      hoverBg = colors.backgroundModifierHover;
      hoverText = colors.textPrimary;
    }

    final activeColor = _isHovered && !widget.isDisabled
        ? hoverText
        : textColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.isDisabled
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      child: FluxerGestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.isDisabled
            ? (widget.onDisabledTap ?? widget.onTap)
            : widget.onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 36),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: layout.s2),
          margin: const EdgeInsets.symmetric(vertical: 1),
          decoration: BoxDecoration(
            color: _isHovered && !widget.isDisabled
                ? hoverBg
                : Colors.transparent,
            borderRadius: layout.radiusSm,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.label,
                      style: context.textStyles.label.copyWith(
                        color: activeColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (widget.hint != null)
                      Text(
                        widget.hint!,
                        style: context.textStyles.timestamp.copyWith(
                          color: colors.textTertiary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              if (widget.icon != null) ...[
                SizedBox(width: layout.s3),
                PhosphorIcon(widget.icon!, size: layout.s5, color: activeColor),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class ContextMenuDivider extends StatelessWidget {
  const ContextMenuDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(vertical: context.layout.s1_5),
      color: context.colors.backgroundModifierAccent.withValues(alpha: 0.3),
    );
  }
}

@FluxerWidgetPreview(name: 'Panel', group: 'ContextMenu')
Widget contextMenuPanelPreview() {
  return ContextMenuPanel(
    items: [
      ContextMenuItem(
        label: 'Reply',
        icon: PhosphorIconsBold.arrowBendUpLeft,
        onTap: () {},
      ),
      const ContextMenuDivider(),
      ContextMenuItem(
        label: 'Delete',
        hint: 'Remove for everyone',
        icon: PhosphorIconsBold.trash,
        isDanger: true,
        onTap: () {},
      ),
    ],
  );
}

Offset contextMenuPositionAtCenter(BuildContext context) {
  final RenderBox? box = context.findRenderObject() as RenderBox?;
  if (box == null) {
    return Offset.zero;
  }
  final Offset origin = box.localToGlobal(Offset.zero);
  return origin + Offset(box.size.width / 2, box.size.height / 2);
}

Offset contextMenuPositionAtPointer(
  BuildContext context, {
  double horizontalFactor = 0.75,
}) {
  final RenderBox? box = context.findRenderObject() as RenderBox?;
  if (box == null) {
    return Offset.zero;
  }
  final Offset origin = box.localToGlobal(Offset.zero);
  return origin +
      Offset(box.size.width * horizontalFactor, box.size.height / 2);
}

double estimateContextMenuHeight(List<Widget> items) {
  var height = 16.0;
  for (final item in items) {
    if (item is ContextMenuDivider) {
      height += 13;
    } else if (item is ContextMenuTitle) {
      height += kContextMenuTitleHeight;
    } else {
      height += 38;
    }
  }
  return height;
}
