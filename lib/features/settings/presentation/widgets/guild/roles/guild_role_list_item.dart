import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/presentation/widgets/role_icon.dart';
import 'package:fluxer_app/features/ui/list/fluxer_selectable_row.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/role_color_utils.dart';

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
    this.reserveIconSlot = false,
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
  final bool reserveIconSlot;

  @override
  Widget build(BuildContext context) {
    if (!useMobileTileStyle && usesDesktopPointerUi(context)) {
      return _buildDesktopPointer(context);
    }
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
        if (reserveIconSlot || role.hasIcon) ...<Widget>[
          const SizedBox(width: 6),
          SizedBox(
            width: 16,
            height: 16,
            child: role.hasIcon
                ? RoleIcon(role: role, size: 16, decorative: true)
                : const SizedBox.shrink(),
          ),
        ],
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            role.name,
            style: context.textStyles.label.copyWith(
              color: Color(guildRoleColorInt(role.color)),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (isLocked)
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 4),
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

  Widget _buildDesktopPointer(BuildContext context) {
    final colors = context.colors;
    final Color foreground = isSelected
        ? colors.brandPrimaryFill
        : colors.textPrimary;
    final BorderRadius radius = context.layout.radiusSm;
    final Widget row = ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 20),
      child: Row(
        children: <Widget>[
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Color(guildRoleColorInt(role.color)),
              shape: BoxShape.circle,
            ),
          ),
          if (reserveIconSlot || role.hasIcon) ...<Widget>[
            const SizedBox(width: 8),
            SizedBox.square(
              dimension: 16,
              child: role.hasIcon
                  ? RoleIcon(role: role, size: 16, decorative: true)
                  : null,
            ),
          ],
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              role.name.isEmpty ? '\u00A0' : role.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.bodyMedium.copyWith(
                fontSize: 14,
                height: 1.2,
                fontWeight: FontWeight.w400,
                color: foreground,
              ),
            ),
          ),
          if (isLocked) ...<Widget>[
            const SizedBox(width: 8),
            PhosphorIcon(
              PhosphorIconsRegular.lock,
              size: 16,
              color: isSelected ? foreground : colors.textPrimaryMuted,
            ),
          ],
          if (trailing != null) ...<Widget>[
            const SizedBox(width: 8),
            trailing!,
          ],
        ],
      ),
    );
    return FluxerSelectableRow(
      isSelected: isSelected,
      selectedColor: colors.brandPrimary,
      borderRadius: radius,
      hoverColor: colors.backgroundModifierHover,
      pressedColor: colors.backgroundModifierHover,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      onTap: onTap,
      child: dragHandle == null
          ? row
          : Row(
              children: <Widget>[
                Expanded(child: row),
                dragHandle!,
              ],
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
