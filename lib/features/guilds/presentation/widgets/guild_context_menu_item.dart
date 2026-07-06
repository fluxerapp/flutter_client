import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildContextMenuItem extends StatelessWidget {
  final GuildMenuAction entry;
  final VoidCallback onTap;

  const GuildContextMenuItem({
    required this.entry,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContextMenuItem(
      label: entry.label,
      hint: entry.hint,
      icon: entry.icon,
      isDanger: entry.isDanger,
      onTap: onTap,
    );
  }
}

class GuildContextMenuCheckboxItem extends StatefulWidget {
  final GuildMenuCheckbox entry;
  final VoidCallback onTap;

  const GuildContextMenuCheckboxItem({
    required this.entry,
    required this.onTap,
    super.key,
  });

  @override
  State<GuildContextMenuCheckboxItem> createState() =>
      _GuildContextMenuCheckboxItemState();
}

class _GuildContextMenuCheckboxItemState
    extends State<GuildContextMenuCheckboxItem> {
  var _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textColor = _isHovered ? colors.textPrimary : colors.textSecondary;
    final bgColor = _isHovered
        ? colors.backgroundModifierHover
        : Colors.transparent;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 36),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: layout.s2),
          margin: const EdgeInsets.symmetric(vertical: 1),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: layout.radiusSm,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.entry.label,
                  style: context.textStyles.label.copyWith(color: textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: layout.s3),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.entry.isChecked
                        ? colors.brandPrimary
                        : colors.interactiveMuted,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color: widget.entry.isChecked
                      ? colors.brandPrimary
                      : Colors.transparent,
                ),
                child: widget.entry.isChecked
                    ? Center(
                        child: PhosphorIcon(
                          PhosphorIconsBold.check,
                          size: 12,
                          color: colors.textOnBrandPrimary,
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GuildContextSubmenuItem extends StatefulWidget {
  final GuildMenuSubmenu entry;
  final bool isActive;
  final VoidCallback onActivate;
  final VoidCallback onDeactivate;

  const GuildContextSubmenuItem({
    required this.entry,
    required this.isActive,
    required this.onActivate,
    required this.onDeactivate,
    super.key,
  });

  @override
  State<GuildContextSubmenuItem> createState() =>
      _GuildContextSubmenuItemState();
}

class _GuildContextSubmenuItemState extends State<GuildContextSubmenuItem> {
  var _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final isHighlighted = _isHovered || widget.isActive;

    final textColor = isHighlighted ? colors.textPrimary : colors.textSecondary;
    final bgColor = isHighlighted
        ? colors.backgroundModifierHover
        : Colors.transparent;

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        widget.onActivate();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        widget.onDeactivate();
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onActivate,
        child: Container(
          constraints: const BoxConstraints(minHeight: 36),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: layout.s2),
          margin: const EdgeInsets.symmetric(vertical: 1),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: layout.radiusSm,
          ),
          child: Row(
            children: [
              if (widget.entry.icon != null) ...[
                PhosphorIcon(widget.entry.icon!, size: 18, color: textColor),
                SizedBox(width: layout.s3),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.entry.label,
                      style: context.textStyles.label.copyWith(
                        color: textColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (widget.entry.hint != null)
                      Text(
                        widget.entry.hint!,
                        style: context.textStyles.timestamp.copyWith(
                          color: colors.textTertiary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              SizedBox(width: layout.s3),
              PhosphorIcon(
                PhosphorIconsBold.caretRight,
                size: 14,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
