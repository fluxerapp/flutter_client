import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kTabBarHeight = 40;
const double _kTabBarInset = 3;
const double _kTabLabelFontSize = 14;
const double _kTabLabelLineHeight = 20;

class NotificationsTabBar extends StatelessWidget {
  const NotificationsTabBar({
    required this.labels,
    required this.position,
    required this.onSelected,
    super.key,
  });

  final List<String> labels;
  final ValueListenable<double> position;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final int count = labels.length;
    return Container(
      height: _kTabBarHeight,
      padding: const EdgeInsets.all(_kTabBarInset),
      decoration: BoxDecoration(
        color: colors.backgroundPrimary,
        borderRadius: BorderRadius.circular(_kTabBarHeight / 2),
      ),
      child: ValueListenableBuilder<double>(
        valueListenable: position,
        builder: (BuildContext context, double page, Widget? _) {
          final double clamped = page.clamp(0, count - 1).toDouble();
          return Stack(
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional(
                  count == 1 ? 0 : clamped / (count - 1) * 2 - 1,
                  0,
                ),
                child: FractionallySizedBox(
                  widthFactor: 1 / count,
                  heightFactor: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: colors.backgroundTertiary,
                      borderRadius: BorderRadius.circular(_kTabBarHeight / 2),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  for (int i = 0; i < count; i++)
                    Expanded(
                      child: FluxerTappable(
                        onTap: () => onSelected(i),
                        selected: clamped.round() == i,
                        semanticLabel: labels[i],
                        excludeChildSemantics: true,
                        builder: (BuildContext context, Set<WidgetState> _) =>
                            Center(
                              child: Text(
                                labels[i],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textStyles.bodyMedium.copyWith(
                                  fontSize: _kTabLabelFontSize,
                                  height:
                                      _kTabLabelLineHeight / _kTabLabelFontSize,
                                  fontWeight: FontWeight.lerp(
                                    FontWeight.w600,
                                    FontWeight.w500,
                                    (clamped - i).abs().clamp(0, 1).toDouble(),
                                  ),
                                  color: Color.lerp(
                                    colors.textPrimary,
                                    colors.textPrimaryMuted,
                                    (clamped - i).abs().clamp(0, 1).toDouble(),
                                  ),
                                ),
                              ),
                            ),
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
