import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';

class ReplyBarTarget extends StatelessWidget {
  const ReplyBarTarget({
    required this.prefix,
    required this.authorName,
    required this.suffix,
    required this.semanticLabel,
    required this.onPressed,
    super.key,
  });

  static const double _kFontSize = 13;
  static const double _kLineHeight = 1.25;

  final String prefix;
  final String authorName;
  final String suffix;
  final String semanticLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: FluxerTappable(
        onTap: onPressed,
        semanticLabel: semanticLabel,
        excludeChildSemantics: true,
        hitTestBehavior: HitTestBehavior.deferToChild,
        builder: (BuildContext context, Set<WidgetState> states) {
          final TextStyle base = context.textStyles.bodySmall.copyWith(
            fontSize: _kFontSize,
            height: _kLineHeight,
            color: context.colors.textPrimary,
            fontWeight: FontWeight.w400,
          );
          final bool underline =
              states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.focused);
          return Text.rich(
            TextSpan(
              style: base,
              children: <InlineSpan>[
                TextSpan(text: prefix),
                TextSpan(
                  text: authorName,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    decoration: underline
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    decorationColor: base.color,
                  ),
                ),
                TextSpan(text: suffix),
              ],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
        },
      ),
    );
  }
}
