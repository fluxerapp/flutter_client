import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';

class QuickSwitcherSegmentedTabs extends StatelessWidget {
  const QuickSwitcherSegmentedTabs({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
    super.key,
  });

  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final motion = context.motion;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double tabWidth = constraints.maxWidth / tabs.length;
        return DecoratedBox(
          decoration: BoxDecoration(
            color: colors.backgroundTertiary,
            borderRadius: layout.radiusMd,
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: motion.normal,
                  curve: motion.curve,
                  left: tabWidth * selectedIndex,
                  width: tabWidth,
                  top: 0,
                  bottom: 0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: colors.backgroundSecondary,
                      borderRadius: layout.radiusMd,
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    for (int i = 0; i < tabs.length; i++)
                      Expanded(
                        child: _QuickSwitcherTabButton(
                          label: tabs[i],
                          isSelected: i == selectedIndex,
                          onTap: () => onChanged(i),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _QuickSwitcherTabButton extends StatelessWidget {
  const _QuickSwitcherTabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final motion = context.motion;
    return FluxerTappable(
      onTap: onTap,
      selected: isSelected,
      semanticLabel: label,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        return AnimatedDefaultTextStyle(
          duration: motion.normal,
          curve: motion.curve,
          style: context.textStyles.categoryName.copyWith(
            height: 18 / 14,
            color: isSelected ? colors.textPrimary : colors.textSecondary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: Center(child: Text(label)),
          ),
        );
      },
    );
  }
}
