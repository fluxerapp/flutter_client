import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/material_ui.dart';

class SidebarDropIndicator extends StatelessWidget {
  const SidebarDropIndicator({required this.indicator, super.key});

  static const double _kHeight = 2;
  static const double _kEdgeOffset = 2;
  static const double _kHorizontalInset = 8;
  static const double _kInvalidAlpha = 0.6;

  final ChannelReorderIndicator indicator;

  static Color colorFor(BuildContext context, {required bool isValid}) {
    return isValid
        ? context.colors.brandPrimary
        : context.colors.textPrimaryMuted.withValues(alpha: _kInvalidAlpha);
  }

  @override
  Widget build(BuildContext context) {
    final bool top = indicator.position == ChannelReorderIndicatorPosition.top;
    return PositionedDirectional(
      start: _kHorizontalInset,
      end: _kHorizontalInset,
      top: top ? -_kEdgeOffset : null,
      bottom: top ? null : -_kEdgeOffset,
      height: _kHeight,
      child: IgnorePointer(
        child: AnimatedContainer(
          duration: context.motion.normal,
          decoration: BoxDecoration(
            color: colorFor(context, isValid: indicator.isValid),
            borderRadius: BorderRadius.circular(_kHeight),
          ),
        ),
      ),
    );
  }
}
