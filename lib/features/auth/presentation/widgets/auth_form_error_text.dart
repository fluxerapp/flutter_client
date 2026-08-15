import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:material_ui/material_ui.dart';

/// Form-level error with a live region for screen readers.
class AuthFormErrorText extends StatelessWidget {
  const AuthFormErrorText(this.errorText, {super.key});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: true,
      label: errorText,
      child: ExcludeSemantics(
        child: Text(
          errorText,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textDanger,
          ),
        ),
      ),
    );
  }
}
