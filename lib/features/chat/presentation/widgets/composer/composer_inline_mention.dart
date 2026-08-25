import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class ComposerInlineMention extends StatelessWidget {
  const ComposerInlineMention({
    required this.visibleText,
    required this.baseStyle,
    super.key,
    this.foregroundArgb,
  });

  final String visibleText;
  final TextStyle? baseStyle;
  final int? foregroundArgb;

  Color _mentionColor(BuildContext context) {
    if (foregroundArgb == null || (foregroundArgb! & 0xffffff) == 0) {
      return context.colors.textLink;
    }
    return Color(0xff000000 | (foregroundArgb! & 0xffffff));
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor = _mentionColor(context);
    final TextStyle mentionStyle =
        baseStyle?.copyWith(color: textColor) ??
        context.textStyles.inputText.copyWith(color: textColor);
    return Text(
      visibleText,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: mentionStyle,
    );
  }
}
