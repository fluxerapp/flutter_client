import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class MacPermissionPurpose extends StatelessWidget {
  const MacPermissionPurpose({
    required this.purpose,
    required this.advice,
    required this.showAdvice,
    super.key,
  });

  final String purpose;
  final String? advice;
  final bool showAdvice;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = context.textStyles.bodySmall.copyWith(
      fontSize: 14,
      height: 1.4,
      color: context.colors.textSecondary,
    );
    final String? adviceText = advice;
    return Semantics(
      liveRegion: true,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          _line(purpose, style: style, visible: !showAdvice),
          if (adviceText != null)
            _line(adviceText, style: style, visible: showAdvice),
        ],
      ),
    );
  }

  Widget _line(String text, {required TextStyle style, required bool visible}) {
    return Visibility.maintain(
      visible: visible,
      child: ExcludeSemantics(
        excluding: !visible,
        child: Text(text, style: style, textAlign: TextAlign.center),
      ),
    );
  }
}
