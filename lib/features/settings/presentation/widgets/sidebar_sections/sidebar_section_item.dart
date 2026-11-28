import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/sidebar_sections/sidebar_section_style.dart';
import 'package:fluxer_app/features/ui/list/fluxer_selectable_row.dart';
import 'package:fluxer_app/material_ui.dart';

class SettingsSidebarSectionItem extends StatelessWidget {
  const SettingsSidebarSectionItem({
    required this.label,
    required this.active,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final BorderRadius radius = BorderRadius.circular(
      kSettingsSidebarSectionItemRadius,
    );
    return Semantics(
      container: true,
      button: true,
      selected: active,
      child: SizedBox(
        height: kSettingsSidebarSectionItemHeight,
        child: FluxerSelectableRow(
          isSelected: active,
          selectedColor: colors.surfaceInteractiveSelectedBg,
          borderRadius: radius,
          hoverColor: colors.surfaceInteractiveHoverBg,
          pressedColor: colors.surfaceInteractiveHoverBg,
          padding: kSettingsSidebarSectionItemPadding,
          onTap: onTap,
          childBuilder: (BuildContext context, Set<WidgetState> states) {
            final bool hovered = states.contains(WidgetState.hovered);
            return Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textStyles.bodyMedium.copyWith(
                  fontSize: 13,
                  height: 18 / 13,
                  fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                  color: active
                      ? colors.textPrimary
                      : hovered
                      ? colors.textSecondary
                      : colors.textTertiary,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
