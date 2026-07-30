import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const kContextMenuWidth = 220.0;

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
      child: GestureDetector(
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

double estimateContextMenuHeight(List<Widget> items) {
  var height = 16.0;
  for (final item in items) {
    if (item is ContextMenuDivider) {
      height += 13;
    } else {
      height += 38;
    }
  }
  return height;
}
