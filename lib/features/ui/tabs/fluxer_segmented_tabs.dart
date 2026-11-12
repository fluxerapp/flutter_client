import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tabs/fluxer_tabs.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class FluxerSegmentedTabs extends StatelessWidget {
  const FluxerSegmentedTabs({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
    super.key,
  });

  final List<FluxerTab> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final bool desktop = usesDesktopPointerUi(context);

    if (desktop) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundTertiary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < tabs.length; i++)
                _FluxerSegmentedDesktopTabItem(
                  tab: tabs[i],
                  isSelected: i == selectedIndex,
                  onTap: () => onChanged(i),
                ),
            ],
          ),
        ),
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundTertiary,
        borderRadius: layout.radiusLg,
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s1 / 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < tabs.length; i++)
              _FluxerSegmentedTabItem(
                tab: tabs[i],
                isSelected: i == selectedIndex,
                onTap: () => onChanged(i),
              ),
          ],
        ),
      ),
    );
  }
}

class _FluxerSegmentedDesktopTabItem extends StatelessWidget {
  const _FluxerSegmentedDesktopTabItem({
    required this.tab,
    required this.isSelected,
    required this.onTap,
  });

  final FluxerTab tab;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerTappable(
      onTap: onTap,
      selected: isSelected,
      semanticLabel: tab.label,
      excludeChildSemantics: true,
      builder: (context, states) {
        final bool pressed = states.contains(WidgetState.pressed);
        final Color foreground = isSelected || pressed
            ? colors.textPrimary
            : colors.textSecondary;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? colors.backgroundSecondary : Colors.transparent,
            borderRadius: context.layout.radiusLg,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: [
              if (tab.icon != null) Icon(tab.icon, size: 16, color: foreground),
              AnimatedDefaultTextStyle(
                duration: context.motion.normal,
                curve: Curves.ease,
                style: context.textStyles.label.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 18 / 14,
                  color: foreground,
                ),
                child: Text(tab.label, textAlign: TextAlign.center),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FluxerSegmentedTabItem extends StatelessWidget {
  const _FluxerSegmentedTabItem({
    required this.tab,
    required this.isSelected,
    required this.onTap,
  });

  final FluxerTab tab;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final motion = context.motion;

    return FluxerTappable(
      onTap: onTap,
      selected: isSelected,
      semanticLabel: tab.label,
      excludeChildSemantics: true,
      builder: (context, states) {
        return AnimatedContainer(
          duration: motion.normal,
          curve: motion.curve,
          decoration: BoxDecoration(
            color: isSelected ? colors.brandPrimary : Colors.transparent,
            borderRadius: layout.radiusMd,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: layout.s2,
            vertical: layout.s1,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (tab.icon != null) ...[
                Icon(
                  tab.icon,
                  size: 16,
                  color: isSelected
                      ? colors.textOnBrandPrimary
                      : colors.textSecondary,
                ),
                SizedBox(width: layout.s1),
              ],
              AnimatedDefaultTextStyle(
                duration: motion.normal,
                curve: motion.curve,
                style: textStyles.label.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? colors.textOnBrandPrimary
                      : colors.textSecondary,
                ),
                child: Text(tab.label),
              ),
            ],
          ),
        );
      },
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerSegmentedTabs')
Widget fluxerSegmentedTabsPreview() {
  return FluxerSegmentedTabs(
    tabs: const [
      FluxerTab(label: 'Day'),
      FluxerTab(label: 'Week'),
      FluxerTab(label: 'Month'),
    ],
    selectedIndex: 0,
    onChanged: (_) {},
  );
}
