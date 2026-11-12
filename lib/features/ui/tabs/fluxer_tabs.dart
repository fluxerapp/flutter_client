import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class FluxerTab {
  const FluxerTab({required this.label, this.icon});
  final String label;
  final IconData? icon;
}

class FluxerTabs extends StatelessWidget {
  const FluxerTabs({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
    this.direction = Axis.horizontal,
    super.key,
  });

  final List<FluxerTab> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    final isHorizontal = direction == Axis.horizontal;
    if (isHorizontal && usesDesktopPointerUi(context)) {
      return _buildDesktop(context);
    }
    return Flex(
      direction: direction,
      crossAxisAlignment: direction == Axis.vertical
          ? CrossAxisAlignment.stretch
          : CrossAxisAlignment.center,
      children: [
        for (var i = 0; i < tabs.length; i++)
          if (isHorizontal)
            Expanded(
              child: _FluxerTabItem(
                tab: tabs[i],
                isSelected: i == selectedIndex,
                onTap: () => onChanged(i),
                direction: direction,
              ),
            )
          else
            _FluxerTabItem(
              tab: tabs[i],
              isSelected: i == selectedIndex,
              onTap: () => onChanged(i),
              direction: direction,
            ),
      ],
    );
  }

  Widget _buildDesktop(BuildContext context) {
    final colors = context.colors;
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final Color selectedColor = isLight
        ? colors.brandPrimary
        : colors.brandPrimaryLight;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
        width: constraints.hasBoundedWidth ? constraints.maxWidth : null,
        child: _buildDesktopStrip(context, selectedColor),
      ),
    );
  }

  Widget _buildDesktopStrip(BuildContext context, Color selectedColor) {
    final colors = context.colors;
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 1,
          child: ColoredBox(color: colors.backgroundModifierAccent),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < tabs.length; i++)
                _FluxerDesktopTabItem(
                  tab: tabs[i],
                  isSelected: i == selectedIndex,
                  selectedColor: selectedColor,
                  onTap: () => onChanged(i),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FluxerDesktopTabItem extends StatelessWidget {
  const _FluxerDesktopTabItem({
    required this.tab,
    required this.isSelected,
    required this.selectedColor,
    required this.onTap,
  });

  final FluxerTab tab;
  final bool isSelected;
  final Color selectedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color foreground = isSelected
        ? selectedColor
        : colors.textPrimaryMuted;
    return FluxerTappable(
      onTap: onTap,
      selected: isSelected,
      semanticLabel: tab.label,
      excludeChildSemantics: true,
      builder: (context, states) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            border: Border(
              bottom: BorderSide(
                color: isSelected ? selectedColor : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              if (tab.icon != null) Icon(tab.icon, size: 16, color: foreground),
              Text(
                tab.label,
                style: context.textStyles.label.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: foreground,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FluxerTabItem extends StatelessWidget {
  const _FluxerTabItem({
    required this.tab,
    required this.isSelected,
    required this.onTap,
    required this.direction,
  });

  final FluxerTab tab;
  final bool isSelected;
  final VoidCallback onTap;
  final Axis direction;

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
      minSize: const Size(44, 44),
      builder: (context, states) {
        final isVertical = direction == Axis.vertical;
        return AnimatedContainer(
          duration: motion.normal,
          curve: motion.curve,
          decoration: BoxDecoration(
            border: isVertical
                ? BorderDirectional(
                    start: BorderSide(
                      color: isSelected
                          ? colors.brandPrimaryLight
                          : Colors.transparent,
                      width: 2,
                    ),
                  )
                : Border(
                    bottom: BorderSide(
                      color: isSelected
                          ? colors.brandPrimaryLight
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isVertical ? layout.s3 : layout.s4,
            vertical: isVertical ? layout.s2 : layout.s3,
          ),
          child: Row(
            mainAxisAlignment: isVertical
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              if (tab.icon != null) ...[
                Icon(
                  tab.icon,
                  size: isVertical ? 16 : 20,
                  color: isSelected ? colors.textPrimary : colors.textSecondary,
                ),
                SizedBox(width: isVertical ? layout.s1 : layout.s2),
              ],
              AnimatedDefaultTextStyle(
                duration: motion.normal,
                curve: motion.curve,
                style: textStyles.label.copyWith(
                  fontSize: isVertical ? null : 16,
                  fontWeight: isVertical ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? colors.textPrimary : colors.textSecondary,
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

@FluxerWidgetPreview(name: 'Horizontal', group: 'FluxerTabs')
Widget fluxerTabsHorizontalPreview() {
  return FluxerTabs(
    tabs: const [
      FluxerTab(label: 'Account'),
      FluxerTab(label: 'Privacy'),
      FluxerTab(label: 'Notifications'),
    ],
    selectedIndex: 1,
    onChanged: (_) {},
  );
}
