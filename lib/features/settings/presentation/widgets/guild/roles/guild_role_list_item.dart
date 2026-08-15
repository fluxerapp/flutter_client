import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/shared/utils/role_color_utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildRoleListItem extends StatelessWidget {
  const GuildRoleListItem({
    required this.role,
    required this.isSelected,
    required this.isLocked,
    required this.onTap,
    this.trailing,
    this.dragHandle,
    this.showChevron = false,
    this.useMobileTileStyle = false,
    super.key,
  });

  final MemberRole role;
  final bool isSelected;
  final bool isLocked;
  final VoidCallback onTap;
  final Widget? trailing;
  final Widget? dragHandle;
  final bool showChevron;
  final bool useMobileTileStyle;

  @override
  Widget build(BuildContext context) {
    final Color roleColor = Color(guildRoleColorInt(role.color));
    final EdgeInsets contentPadding = useMobileTileStyle
        ? const EdgeInsets.symmetric(horizontal: 12, vertical: 10)
        : const EdgeInsets.symmetric(horizontal: 8, vertical: 6);
    final Widget row = Row(
      children: <Widget>[
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: roleColor, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            role.name,
            style: context.textStyles.label.copyWith(
              color: Color(guildRoleColorInt(role.color)),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (isLocked)
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: PhosphorIcon(
              PhosphorIconsFill.lock,
              size: 14,
              color: context.colors.textPrimaryMuted,
            ),
          ),
        ?trailing,
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
        child: _buildInteractiveRow(
          borderRadius: BorderRadius.circular(6),
          contentPadding: contentPadding,
          row: row,
        ),
      );
    }
    return Material(
      color: isSelected
          ? context.colors.backgroundModifierSelected
          : Colors.transparent,
      borderRadius: BorderRadius.circular(4),
      child: _buildInteractiveRow(
        borderRadius: BorderRadius.circular(4),
        contentPadding: contentPadding,
        row: row,
      ),
    );
  }

  Widget _buildInteractiveRow({
    required BorderRadius borderRadius,
    required EdgeInsets contentPadding,
    required Widget row,
  }) {
    if (dragHandle == null) {
      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Padding(padding: contentPadding, child: row),
      );
    }
    return Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: onTap,
            borderRadius: borderRadius,
            child: Padding(padding: contentPadding, child: row),
          ),
        ),
        dragHandle!,
      ],
    );
  }
}
