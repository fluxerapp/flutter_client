import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_role_color_dot.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MemberRoleCheckboxItem extends StatelessWidget {
  const MemberRoleCheckboxItem({
    required this.label,
    required this.roleColor,
    required this.isChecked,
    required this.onTap,
    this.enabled = true,
    this.isBottomSheet = false,
    this.showCheckbox = true,
    super.key,
  });

  final String label;
  final int roleColor;
  final bool isChecked;
  final VoidCallback onTap;
  final bool enabled;
  final bool isBottomSheet;
  final bool showCheckbox;

  @override
  Widget build(BuildContext context) {
    if (isBottomSheet) {
      return _BottomSheetRoleRow(
        label: label,
        roleColor: roleColor,
        isChecked: isChecked,
        enabled: enabled,
        showCheckbox: showCheckbox,
        onTap: onTap,
      );
    }
    return _MenuRoleRow(
      label: label,
      roleColor: roleColor,
      isChecked: isChecked,
      enabled: enabled,
      showCheckbox: showCheckbox,
      onTap: onTap,
    );
  }
}

class _MenuRoleRow extends StatelessWidget {
  const _MenuRoleRow({
    required this.label,
    required this.roleColor,
    required this.isChecked,
    required this.onTap,
    required this.enabled,
    required this.showCheckbox,
  });

  final String label;
  final int roleColor;
  final bool isChecked;
  final VoidCallback onTap;
  final bool enabled;
  final bool showCheckbox;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s1),
      child: FluxerTappable(
        enabled: enabled,
        onTap: onTap,
        semanticLabel: label,
        checked: isChecked,
        excludeChildSemantics: true,
        builder: (BuildContext context, Set<WidgetState> states) {
          final bool isHovered = states.contains(WidgetState.hovered);

          return AnimatedContainer(
            duration: context.motion.fast,
            curve: context.motion.curve,
            decoration: BoxDecoration(
              color: isHovered
                  ? colors.backgroundModifierHover
                  : Colors.transparent,
              borderRadius: layout.radiusSm,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: layout.s3,
              vertical: layout.s2,
            ),
            child: Row(
              children: <Widget>[
                MemberRoleColorDot(color: roleColor),
                SizedBox(width: layout.s3),
                Expanded(
                  child: Text(
                    label,
                    style: context.textStyles.bodyMedium.copyWith(
                      color: enabled ? colors.textPrimary : colors.textTertiary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (showCheckbox) ...<Widget>[
                  SizedBox(width: layout.s3),
                  _RoleMenuCheckbox(isChecked: isChecked),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BottomSheetRoleRow extends StatelessWidget {
  const _BottomSheetRoleRow({
    required this.label,
    required this.roleColor,
    required this.isChecked,
    required this.onTap,
    required this.enabled,
    required this.showCheckbox,
  });

  final String label;
  final int roleColor;
  final bool isChecked;
  final VoidCallback onTap;
  final bool enabled;
  final bool showCheckbox;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return FluxerTappable(
      enabled: enabled,
      onTap: onTap,
      semanticLabel: label,
      checked: isChecked,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        return ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: <Widget>[
                MemberRoleColorDot(color: roleColor),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: context.textStyles.username.copyWith(
                      color: enabled ? colors.textPrimary : colors.textTertiary,
                    ),
                  ),
                ),
                if (showCheckbox)
                  _RoleMenuCheckbox(isChecked: isChecked, size: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RoleMenuCheckbox extends StatelessWidget {
  const _RoleMenuCheckbox({required this.isChecked, this.size = 18});

  final bool isChecked;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: isChecked
              ? colors.brandPrimary
              : colors.backgroundHeaderSecondary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(3),
        color: isChecked ? colors.brandPrimary : Colors.transparent,
      ),
      child: isChecked
          ? Center(
              child: PhosphorIcon(
                PhosphorIconsBold.check,
                size: size * 0.6,
                color: colors.textOnBrandPrimary,
              ),
            )
          : null,
    );
  }
}
