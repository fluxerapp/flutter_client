import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';

const double kExpressionTabsHorizontalInset = 8;
const double kExpressionTabsHeight = 42;
const double kExpressionTabsSegmentInset = 4;
const Duration kExpressionTabsSlideDuration = Duration(milliseconds: 450);
const Curve kExpressionTabsSlideCurve = FluxerSpringCurve(
  stiffness: 317,
  damping: 35.6,
  duration: kExpressionTabsSlideDuration,
);

Color expressionSheetSurfaceColor(BuildContext context) =>
    context.colors.backgroundSecondaryAlt;

Color expressionTabsTrackColor(BuildContext context) => Color.alphaBlend(
  context.colors.textPrimary.withValues(alpha: 0.06),
  expressionSheetSurfaceColor(context),
);

Color expressionTabsSegmentColor(BuildContext context) => Color.alphaBlend(
  context.colors.textPrimary.withValues(alpha: 0.17),
  expressionSheetSurfaceColor(context),
);

class ExpressionSegmentedTabs extends StatelessWidget {
  const ExpressionSegmentedTabs({
    required this.tabs,
    required this.selected,
    required this.labelOf,
    required this.onSelected,
    super.key,
  });

  final List<ExpressionPickerTab> tabs;
  final ExpressionPickerTab selected;
  final String Function(ExpressionPickerTab tab) labelOf;
  final ValueChanged<ExpressionPickerTab> onSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final int selectedIndex = tabs.indexOf(selected).clamp(0, tabs.length - 1);
    final double alignX = tabs.length <= 1
        ? 0
        : -1 + 2 * selectedIndex / (tabs.length - 1);
    final Duration duration = MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : kExpressionTabsSlideDuration;
    final TextStyle labelStyle = context.textStyles.categoryName.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      height: 1.2,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kExpressionTabsHorizontalInset,
      ),
      child: Container(
        height: kExpressionTabsHeight,
        padding: const EdgeInsets.all(kExpressionTabsSegmentInset),
        decoration: BoxDecoration(
          color: expressionTabsTrackColor(context),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: AnimatedAlign(
                alignment: Alignment(alignX, 0),
                duration: duration,
                curve: kExpressionTabsSlideCurve,
                child: FractionallySizedBox(
                  widthFactor: 1 / tabs.length,
                  heightFactor: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: expressionTabsSegmentColor(context),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                for (final ExpressionPickerTab tab in tabs)
                  Expanded(
                    child: Semantics(
                      button: true,
                      selected: tab == selected,
                      child: FluxerGestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          if (tab != selected) {
                            onSelected(tab);
                          }
                        },
                        child: Center(
                          child: Text(
                            labelOf(tab),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: labelStyle.copyWith(
                              color: tab == selected
                                  ? colors.textPrimary
                                  : colors.textTertiarySecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
