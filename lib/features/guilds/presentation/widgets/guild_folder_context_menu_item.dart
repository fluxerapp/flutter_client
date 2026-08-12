import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_folder_menu_data.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildFolderContextMenuItem extends StatelessWidget {
  const GuildFolderContextMenuItem({
    required this.entry,
    required this.onTap,
    super.key,
  });

  final FolderMenuActionEntry entry;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ContextMenuItem(
      label: entry.label,
      icon: entry.icon,
      isDisabled: entry.isDisabled,
      onTap: onTap,
    );
  }
}

class GuildFolderContextSubmenuItem extends StatefulWidget {
  const GuildFolderContextSubmenuItem({
    required this.entry,
    required this.isActive,
    required this.onActivate,
    required this.onDeactivate,
    this.enableHoverSubmenu = true,
    super.key,
  });

  final FolderMenuSubmenu entry;
  final bool isActive;
  final bool enableHoverSubmenu;
  final VoidCallback onActivate;
  final VoidCallback onDeactivate;

  @override
  State<GuildFolderContextSubmenuItem> createState() =>
      _GuildFolderContextSubmenuItemState();
}

class _GuildFolderContextSubmenuItemState
    extends State<GuildFolderContextSubmenuItem> {
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
      onEnter: widget.enableHoverSubmenu
          ? (_) {
              if (widget.entry.isDisabled) {
                return;
              }
              setState(() => _isHovered = true);
              widget.onActivate();
            }
          : null,
      onExit: widget.enableHoverSubmenu
          ? (_) {
              setState(() => _isHovered = false);
              widget.onDeactivate();
            }
          : null,
      cursor: widget.entry.isDisabled
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      child: FluxerGestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.entry.isDisabled ? null : widget.onActivate,
        child: Opacity(
          opacity: widget.entry.isDisabled ? 0.5 : 1,
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
                  child: Text(
                    widget.entry.label,
                    style: context.textStyles.label.copyWith(color: textColor),
                    overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
