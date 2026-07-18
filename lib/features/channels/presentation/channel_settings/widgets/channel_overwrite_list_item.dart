import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_overwrite_update.dart';
import 'package:fluxer_app/shared/utils/role_color_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelOverwriteListItem extends StatelessWidget {
  const ChannelOverwriteListItem({
    required this.entry,
    required this.isSelected,
    required this.onTap,
    this.roleColor,
    this.showChevron = false,
    this.useMobileTileStyle = false,
    super.key,
  });

  final ChannelPermissionOverwriteEntry entry;
  final bool isSelected;
  final VoidCallback onTap;
  final int? roleColor;
  final bool showChevron;
  final bool useMobileTileStyle;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets contentPadding = useMobileTileStyle
        ? const EdgeInsets.symmetric(horizontal: 12, vertical: 10)
        : const EdgeInsets.symmetric(horizontal: 8, vertical: 6);
    final Widget leading = entry.type == 0
        ? Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Color(guildRoleColorInt(roleColor ?? 0)),
              shape: BoxShape.circle,
            ),
          )
        : PhosphorIcon(
            PhosphorIconsFill.user,
            size: 16,
            color: context.colors.textSecondary,
          );
    final Widget row = Row(
      children: <Widget>[
        leading,
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            entry.label,
            style: entry.type == 0 && roleColor != null && roleColor != 0
                ? context.textStyles.label.copyWith(
                    color: Color(guildRoleColorInt(roleColor!)),
                  )
                : context.textStyles.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (showChevron)
          PhosphorIcon(
            PhosphorIconsBold.caretRight,
            size: 16,
            color: context.colors.textPrimaryMuted,
          ),
      ],
    );
    if (useMobileTileStyle) {
      return Material(
        color: context.colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Padding(padding: contentPadding, child: row),
        ),
      );
    }
    return Material(
      color: isSelected
          ? context.colors.backgroundModifierSelected
          : Colors.transparent,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(padding: contentPadding, child: row),
      ),
    );
  }
}
