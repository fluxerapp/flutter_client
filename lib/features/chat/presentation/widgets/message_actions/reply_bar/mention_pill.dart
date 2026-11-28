import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class ReplyMentionPill extends StatelessWidget {
  const ReplyMentionPill({
    required this.mentioning,
    required this.label,
    required this.tooltip,
    required this.semanticLabel,
    required this.onPressed,
    super.key,
  });

  static const double _kWidth = 56;
  static const double _kHeight = 28;
  static const double _kIconSize = 16;
  static const double _kIconGap = 3;
  static const double _kFontSize = 12;
  static const Color _kOnColor = Color(0xFF60A5FA);

  final bool mentioning;
  final String label;
  final String tooltip;
  final String semanticLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FluxerTooltip(
      message: tooltip,
      child: FluxerTappable(
        onTap: onPressed,
        toggled: mentioning,
        semanticLabel: semanticLabel,
        excludeChildSemantics: true,
        focusRingRadius: BorderRadius.circular(_kHeight / 2),
        builder: (BuildContext context, Set<WidgetState> states) {
          final Color color = mentioning
              ? _kOnColor
              : states.contains(WidgetState.hovered)
              ? context.colors.textPrimary
              : context.colors.textPrimaryMuted;
          return AnimatedContainer(
            duration: context.motion.normal,
            width: _kWidth,
            height: _kHeight,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_kHeight / 2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                PhosphorIcon(
                  PhosphorIconsBold.at,
                  size: _kIconSize,
                  color: color,
                ),
                const SizedBox(width: _kIconGap),
                Text(
                  label,
                  maxLines: 1,
                  style: context.textStyles.smallText.copyWith(
                    fontSize: _kFontSize,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
